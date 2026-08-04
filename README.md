# Signal Recorder

A **LabVIEW** application for recording an audio signal from the sound card, saving it to a WAVE file, and analyzing it live in two views: a time-domain waveform and an FFT magnitude spectrum. The whole program is built as a single top-level VI (`Program.vi`) backed by a shared global-data VI (`GVar.vi`) and a handful of custom typedef controls.

<img width="1916" height="1013" alt="sigrec00" src="https://github.com/user-attachments/assets/6cccf6d7-4e2a-4724-97ce-662e1caeadfb" />

## Table of contents

- [How it works](#how-it-works)
- [Project architecture](#project-architecture)
- [Requirements](#requirements)
- [Installation](#installation)
- [Running the app](#running-the-app)
- [Front panel controls](#front-panel-controls)
- [Signal flow and states](#signal-flow-and-states)
- [Building the executable](#building-the-executable)
- [Repository structure](#repository-structure)

## How it works

The operator sets the destination **path** of the WAVE file and the desired **sound format** (bits per sample, number of channels, sample rate, number of samples per channel), then presses **Play**. `Program.vi` opens the sound input task (`Sound Input Configure.vi` / `Sound Input Start.vi`), opens the target file for writing (`Sound File Write Open.vi`), and enters a loop that continuously reads audio blocks (`Sound Input Read (DBL).vi`), writes them to disk (`Sound File Write (DBL).vi`) and feeds them through an FFT (`FFT Spectrum (Mag-Phase) for N Chan.vi`) to produce a magnitude spectrum. Both the raw time signal and the spectrum are packed into a single message cluster and pushed to the front panel, which displays them on two tabs — **Waveform Analyzer** and **Spectrum Analyzer**. Pressing **Stop** halts acquisition, closes the sound task (`Sound Input Stop.vi` / `Sound Input Clear.vi`) and closes the file (`Sound File Close.vi`). Any error raised along the way is routed through `Simple Error Handler.vi` and surfaced to the operator via the shared error cluster.

## Project architecture

| File | Responsibility |
|---|---|
| `Program.vi` | Main/top-level VI: front panel (path, sound format, Play/Stop, Waveform/Spectrum tabs) and the state-machine block diagram that drives acquisition, file I/O, FFT analysis and error handling |
| `SubVI/GVar.vi` | Global variable VI: holds the shared `Data` (a `Parameters In` cluster: file path + sound format) so it doesn't need to be wired through every part of the diagram |
| `Controls/Parameters In.ctl` | Typedef cluster bundling the WAVE file **Path** with the **Sound Data Format** (bits/sample, channels, sample rate, samples/channel) |
| `Controls/UI Message.ctl` | Typedef cluster carrying data from the acquisition loop to the display: the time-domain signal, the FFT magnitude spectrum (with `f0`/`df` scaling) and the standard NI error cluster (`status`, `code`, `source`) |
| `Controls/Enum 1.ctl` | **Action** enum: `Play` / `Stop`, used to drive the Play/Stop button and the corresponding case in the state machine |
| `Controls/Enum 2 - States.ctl` | State enum with `Idle` / `Init`: used for the lighter-weight (consumer/UI) side of the diagram |
| `Controls/Enum 3 - States.ctl` | State enum with `Idle` / `Init` / `Analysis`: drives the main acquisition state machine |
| `Controls/Path.ctl` | Typedef wrapper around a file path, used for the WAVE output file |
| `Controls/Browse Icon.ctl` | Picture/icon control (backed by `Graphic/browce_icon.png`) used for the file-path "browse" button |

Data flow is centered on the `Parameters In` cluster (input configuration, shared via `GVar.vi`) and the `UI Message` cluster (acquisition results going out to the display), which together decouple the acquisition/analysis logic from the front-panel presentation.

## Requirements

- **LabVIEW 2025** (project format `LVVersion="25008000"`, saved back-compatible to LabVIEW 2023 - `NI.LV.All.SaveVersion = 23.0`)
- The built-in NI sound-card I/O library (`vi.lib\sound2\lvsound2.llb`) - ships with a standard LabVIEW installation, used for `Sound Input *.vi` and `Sound File *.vi`
- The NI analysis library providing `FFT Spectrum (Mag-Phase) for N Chan.vi` (`NI_MAPro.lvlib`)
- A working audio input device (microphone/line-in) recognized by the sound card

## Installation

```bash
git clone https://github.com/jksikora/signal_recorder.git
```

Open `Signal Recorder.lvproj` in LabVIEW. The project already references all the VIs and controls under `Controls/` and `SubVI/` by relative path, so no further setup is required as long as LabVIEW and the sound library above are installed.

## Running the app

1. Open `Program.vi` from the project tree.
2. Set the **Path** control to where the recording should be saved (`.wav`).
3. Fill in the **sound format** cluster: bits per sample, number of channels, sample rate (S/s), number of samples per channel.
4. Press **Run**, then press **Play** to start recording and analysis.
5. Switch between the **Waveform Analyzer** and **Spectrum Analyzer** tabs to watch the live time signal / FFT magnitude respectively; the **XScale Maximum** field on the spectrum tab controls the visible frequency range.
6. Press **Stop** to end the recording (the file handle and sound input task are closed cleanly).

## Front panel controls

| Control | Purpose |
|---|---|
| `Path` | Destination of the WAVE file being recorded |
| `Sound format` (cluster) | Bits per sample, number of channels, sample rate (S/s), number of samples/channel |
| `Number of samples/ch` | Specifies the number of samples acquired from each channel during every read operation. This value determines the processing block size used for recording and analysis. |
| `Play` (boolean, mapped to `Action` enum) | Starts acquisition and file writing |
| `Tab Control` → `Waveform Analyzer` | Shows the live time-domain **Waveform Graph** |
| `Tab Control` → `Spectrum Analyzer` | Shows the live **Spectrum Graph** (FFT magnitude), with `XScale Maximum` to set the frequency axis range |
| `Zoom` | Vertical slider used to adjust the graph zoom level for easier inspection of waveform and spectrum data. |

## Signal flow and states

The block diagram is split into two cooperating loops:

- An **acquisition/analysis loop**, driven by `Enum 3 - States.ctl` (`Idle → Init → Analysis`), which configures and reads the sound input, writes samples to the WAVE file, and runs the FFT spectrum calculation.
- A lighter **UI loop**, driven by `Enum 2 - States.ctl` (`Idle → Init`), which receives `UI Message` clusters and updates the Waveform/Spectrum graphs.

The two loops are decoupled: configuration flows in through the shared `Parameters In` cluster (kept in `GVar.vi`), and results flow out through the `UI Message` cluster (time signal + FFT magnitude/`f0`/`df` + error info).

## Building the executable

The project ships an Application Builder specification named **"Signal Recorder"** that packages `Program.vi` as the top-level VI together with the `Controls`, `Graphic` and `SubVI` folders as support files, using `Icon16x16.ico` as the application icon. Building it (via *Build Specifications → Signal Recorder → Build*) produces `Signal Recorder.exe` under `../builds/NI_AB_PROJECTNAME/Signal Recorder/`.

## Repository structure

```
signal_recorder/
├── Controls/                 # Custom typedef controls (see "Project architecture")
│   ├── Browse Icon.ctl
│   ├── Enum 1.ctl            # Action: Play / Stop
│   ├── Enum 2 - States.ctl   # Idle / Init
│   ├── Enum 3 - States.ctl   # Idle / Init / Analysis
│   ├── Parameters In.ctl     # Path + Sound Data Format
│   ├── Path.ctl
│   └── UI Message.ctl        # Time signal + spectrum + error cluster
├── Graphic/
│   └── browce_icon.png       # Icon used by Browse Icon.ctl
├── SubVI/ 
│   └── GVar.vi               # Global variable holding shared Parameters In data
├── Icon16x16.ico             # Application icon (used by the EXE build)
├── Program.vi                # Main VI — front panel and state machine
└── Signal Recorder.lvproj    # LabVIEW project file (also defines the EXE build spec)
```
