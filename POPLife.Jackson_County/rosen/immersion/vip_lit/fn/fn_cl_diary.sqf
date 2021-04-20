_mapFind = (_this select 0) select 0;
_mapTextures = (_this select 0) select 1;
_mapCursor = (_this select 0) select 2;
_mapCursorGrid = (_this select 0) select 3;
_mapAdds = _this select 1;
_nvgDist = (_this select 2) select 0;
_nvgGrain = (_this select 2) select 1;
_nvgNoOptics = (_this select 2) select 2;

_colourText = str (["IGUI_WARNING"] call vip_cmn_fnc_cl_profileColoursHTML);

call vip_cmn_fnc_cl_authorDiaryTopic;

//stuff under map header
_flashlightKey = "F";
if (count (profileNamespace getVariable ["vip_lit_var_cl_mapFlashlightKey", []]) > 0) then {
	_arr = profileNamespace getVariable "vip_lit_var_cl_mapFlashlightKey";
	_keyName = [_arr select 0] call BIS_fnc_keyCode;
	_flashlightKey = format [
		"%1%2%3%4",
		if (_arr select 1) then {"Shift+"} else {""},
		if (_arr select 2) then {"Ctrl+"} else {""},
		if (_arr select 3) then {"Alt+"} else {""},
		_keyName
	];
};

_mapHeader = if (_mapFind || _mapTextures || (count _mapAdds > 0)) then {format["<br /><font color=%1>Map</font><br />", _colourText]} else {""};
_mapFindText = if (_mapFind) then {"-The ""Show player on map"" button is disabled.<br />"} else {""};
_mapTexturesText = if (_mapTextures) then {"-Map textures and the grid reference next to the cursor are disabled.<br />"} else {""};
_mapCursorText = if (_mapCursor) then {"-The map cursor is replaced with a smaller one.<br />"} else {""};
_mapCursorGridText = if (_mapCursorGrid) then {"-The grid reference next to the map cursor is removed.<br />"} else {""};
_mapLightingText = if (count _mapAdds > 0) then {format["-The map's visibility is affected by lighting conditions; weather, sunlight, moonlight, water depth, vehicles, flashlights, and chemlights.<br />-If the map is dark, you can use a flashlight to illuminate it. You must have a flashlight in your inventory (not attached to a weapon). Press ""%2"" to toggle it (<font color=%1><execute expression=""['vip_lit_var_cl_mapFlashlightKey', true] call vip_cmn_fnc_cl_keyBind"">click here to rebind</execute></font>).<br />", _colourText, _flashlightKey]} else {""};

//stuff under nvg header
_nvgHeader = if (_nvgGrain || (count _nvgDist > 0)) then {format["<br /><font color=%1>Night Vision Devices</font><br />", _colourText]} else {""};
_mapNVGText = if (count _mapAdds > 0) then {if (_mapAdds select 1) then {format["-NVG can be used when viewing the map. Press ""N"" to toggle them (<font color=%1><execute expression=""['vip_lit_var_cl_mapNVGKey'] call vip_cmn_fnc_cl_keyBind"">click here to rebind</execute></font>).<br />", _colourText]}} else {""};
_nvgDistText = if (count _nvgDist > 0) then {format["-NV has a maximum view distance of %1m.<br />", _nvgDist select 0]} else {""};
_nvgGrainText = if (_nvgGrain) then {"-NV has analog noise.<br />"} else {""};
_nvgNoOpticText = if (_nvgNoOptics) then {"-While wearing NVG, you cannot use non-collimator optics or ironsights. You must use a dedicated collimator optic or an IR laser module on your weapon.<br />"} else {""};

player createDiaryRecord ["vip_modules_var_cl_diary", ["LIT", format["
<font color=%1 size='18'>Little Immersion Tweaks</font>
<br /><br />
This mission uses voiper's Little Immersion Tweaks (LIT) module, which adds flavour and realism to Arma 3's map and NVG.<br /><br />
<font color=%1 size='18'>Features Used In This Mission:</font><br />
%2
%3
%4
%5
%6
%7
%8
%9
%10
%11
%12
", _colourText, _mapHeader, _mapFindText, _mapTexturesText, _mapCursorText, _mapCursorGridText, _mapLightingText, _mapNVGText, _nvgHeader, _nvgDistText, _nvgGrainText, _nvgNoOpticText]]];