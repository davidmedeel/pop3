
/*
por: Icaruk
	["menu"] call ica_fnc_daLlaves;
	["doy", quien, can] call ica_fnc_daLlaves;
*/

_param = _this select 0;

if (_param isEqualTo "menu") exitWith {
	disableSerialization;
	createDialog "daLlaves";

	_ui = uiNamespace getVariable "daLlaves";
	_lista = _ui displayCtrl 7075;
	_desplegable = _ui displayCtrl 7076;
	_boton = _ui displayCtrl 7077;

	_lista ctrlSetEventHandler ["LBSelChanged", "
		_ui = uiNamespace getVariable ""daLlaves"";
		_boton = _ui displayCtrl 7077;
		_boton buttonSetAction ""
			['doy', lbData [7075, (lbCurSel 7075)], lbData [7076, (lbCurSel 7076)]] call ica_fnc_daLlaves;
		"";
	"];
	_desplegable ctrlSetEventHandler ["LBSelChanged", "
		_ui = uiNamespace getVariable ""daLlaves"";
		_boton = _ui displayCtrl 7077;
		_boton buttonSetAction ""
			['doy', lbData [7075, (lbCurSel 7075)], lbData [7076, (lbCurSel 7076)]] call ica_fnc_daLlaves;
		"";
	"];

	lbClear _lista;
	lbClear _desplegable;

	_cercanos = [];
	{ if (player distance _x < 2) then {_cercanos pushBack _x};} foreach playableUnits;

	for "_i" from 0 to ((count life_vehicles) -1) do {
		_veh = life_vehicles select _i;
		if ((!isNull _veh) AND (alive _veh)) then {
			_color = [(typeOf _veh), (_veh getVariable "Life_VEH_color")] call life_fnc_vehicleColorStr;
			_text = format ["(%1)", _color];
			if (_text == "()") then {
				_text = "";
			};

			_name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
			_pic = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");
			_lista lbAdd format["%1 %3 - (%2m)",_name,round(player distance _veh),_text];
			if (_pic != "pictureStaticObject") then {
				_lista lbSetPicture [(lbSize _lista)-1, _pic];
			};
			_lista lbSetData [(lbSize _lista)-1, str(_i)];
		};
	};

	{
		if (!isNull _x && alive _x && player distance _x < 20 && _x != player) then {
			_desplegable lbAdd format["???????????", side _x];
			_desplegable lbSetData [(lbSize _desplegable)-1, str(_x)];
		};
	} foreach _cercanos;

	if (((lbSize _lista)-1) == -1) then {
		_lista lbAdd "No tienes ningún vehículo";
		_lista lbSetData [(lbSize _lista)-1, str(ObjNull)];
	};

};

if (_param isEqualTo "doy") exitWith {
	private ["_llave", "_can", "_uid", "_owners", "_index"];
	_llave = _this select 1;
	_llave = life_vehicles select parseNumber (_llave);
	_quien = _this select 2;
	_quien = call compile format["%1", _quien];

	if (isNil {_quien}) exitWith {};
	if (isNull _quien) exitWith {};

	_uid = getPlayerUID _quien;
	_owners = _llave getVariable "vehicle_info_owners";
	_index = [_uid,_owners] call TON_fnc_index;
	if (_index == -1) then {
		_owners pushBack [_uid,_quien getVariable["realname",name _quien]];
		_llave setVariable["vehicle_info_owners",_owners,true];
	};

	hint format["Has dado llaves de %1", getText(configFile >> "CfgVehicles" >> (typeOf _llave) >> "displayName")];
	[_llave,_quien,profileName] remoteexeccall ["TON_fnc_clientGetKey",_quien];
};
