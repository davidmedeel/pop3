
/*
arrayInfo pushBack "nuevo";
reverse arrayInfo;
arrayinfo resize 10;
reverse arrayInfo;

arrayInfo = ["", "", "", "", "", "", "", "", "", ""]; ["+ 1€"] execVM "ica\dialog\info.sqf";
*/

_param = _this select 0;
arrayInfo pushBack _param;
reverse arrayInfo;
arrayinfo resize 10;
reverse arrayInfo;

disableSerialization;
_ui = uiNamespace getVariable "HUDica";
_txt = _ui displayCtrl 6012;

_arrayInfo = arrayInfo;

_roj = "<t size='0.9' shadow='1'shadowColor='#FF0000'>%1</t><br/>";
_ver = "<t size='0.9' shadow='1'shadowColor='#088A08'>%1</t><br/>";
 
_arraytxt = [];
arrayStr = "";

for "_x" from 0 to 9 do {
	if (["+", _arrayInfo select _x] call ica_fnc_inString) then {
		arrayStr = arrayStr + format [_ver, _arrayInfo select _x];
	};
	if (["-", _arrayInfo select _x] call ica_fnc_inString) then {
		arrayStr = arrayStr + format [_roj, _arrayInfo select _x];
	};
};


arrayTxt = parseText arrayStr;
_txt ctrlSetStructuredText arrayTxt;




