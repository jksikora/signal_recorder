<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="25008000">
	<Property Name="NI.LV.All.SaveVersion" Type="Str">23.0</Property>
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Main" Type="Folder">
			<Item Name="Controls" Type="Folder">
				<Item Name="Browse Icon.ctl" Type="VI" URL="../Controls/Browse Icon.ctl"/>
				<Item Name="Enum 1.ctl" Type="VI" URL="../Controls/Enum 1.ctl"/>
				<Item Name="Enum 2 - States.ctl" Type="VI" URL="../Controls/Enum 2 - States.ctl"/>
				<Item Name="Enum 3 - States.ctl" Type="VI" URL="../Controls/Enum 3 - States.ctl"/>
				<Item Name="Parameters In.ctl" Type="VI" URL="../Controls/Parameters In.ctl"/>
				<Item Name="Path.ctl" Type="VI" URL="../Controls/Path.ctl"/>
				<Item Name="UI Message.ctl" Type="VI" URL="../Controls/UI Message.ctl"/>
			</Item>
			<Item Name="Graphic" Type="Folder">
				<Item Name="browce_icon.png" Type="Document" URL="../Graphic/browce_icon.png"/>
			</Item>
			<Item Name="SubVI" Type="Folder">
				<Item Name="GVar.vi" Type="VI" URL="../SubVI/GVar.vi"/>
			</Item>
			<Item Name="Program.vi" Type="VI" URL="../Program.vi"/>
		</Item>
		<Item Name="Icon16x16.ico" Type="Document" URL="../Icon16x16.ico"/>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="Signal Recorder" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{BE082031-DB26-46BD-9F24-037422DC7495}</Property>
				<Property Name="App_INI_GUID" Type="Str">{C61C8970-DD6A-44B3-BEC2-3283FA2A383F}</Property>
				<Property Name="App_serverConfig.httpPort" Type="Int">8002</Property>
				<Property Name="App_serverType" Type="Int">0</Property>
				<Property Name="Bld_autoIncrement" Type="Bool">true</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{75FA8393-78FB-4ACB-BB2A-E07716C52148}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">Signal Recorder</Property>
				<Property Name="Bld_excludeInlineSubVIs" Type="Bool">true</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../builds/NI_AB_PROJECTNAME/Signal Recorder</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{76BA51D9-60E6-4F3C-A3BD-3190F35B4C54}</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">Signal Recorder.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../builds/NI_AB_PROJECTNAME/Signal Recorder/Signal Recorder.exe</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../builds/NI_AB_PROJECTNAME/Signal Recorder/data</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Exe_iconItemID" Type="Ref">/My Computer/Icon16x16.ico</Property>
				<Property Name="Source[0].itemID" Type="Str">{C5D005E8-A59E-48A7-BB14-1AB4F0CB29CB}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/Main/Program.vi</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="Source[2].Container.applyInclusion" Type="Bool">true</Property>
				<Property Name="Source[2].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[2].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[2].itemID" Type="Ref">/My Computer/Main/Controls</Property>
				<Property Name="Source[2].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[2].type" Type="Str">Container</Property>
				<Property Name="Source[3].Container.applyInclusion" Type="Bool">true</Property>
				<Property Name="Source[3].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[3].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[3].itemID" Type="Ref">/My Computer/Main/Graphic</Property>
				<Property Name="Source[3].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[3].type" Type="Str">Container</Property>
				<Property Name="Source[4].Container.applyInclusion" Type="Bool">true</Property>
				<Property Name="Source[4].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[4].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[4].itemID" Type="Ref">/My Computer/Main/SubVI</Property>
				<Property Name="Source[4].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[4].type" Type="Str">Container</Property>
				<Property Name="SourceCount" Type="Int">5</Property>
				<Property Name="TgtF_fileDescription" Type="Str">Signal Recorder</Property>
				<Property Name="TgtF_internalName" Type="Str">Signal Recorder</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2024 </Property>
				<Property Name="TgtF_productName" Type="Str">Signal Recorder</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{F39F8F9F-95D1-4A8D-B7CC-1D0BC4AFDDE8}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">Signal Recorder.exe</Property>
				<Property Name="TgtF_versionIndependent" Type="Bool">true</Property>
			</Item>
		</Item>
	</Item>
</Project>
