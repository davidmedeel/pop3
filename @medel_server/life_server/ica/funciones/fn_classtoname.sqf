
/*
por: Icaruk
	["class"] call ica_fnc_classToName;
*/

private ["_class", "_nom"];
_class = _this select 0;

if ((typeName _class) == "SCALAR") exitWith {""};
if (_class == "") exitWith {_class};
if (isClass (configFile >> "CfgMagazines" >> _class)) then { // si es cargador
	_nom = getText (configFile >> "CfgMagazines" >> _class >> "Displayname"); // busco nombre cargador
};
if (isClass (configFile >> "CfgWeapons" >> _class)) then { // si es arma
	_nom = getText (configFile >> "CfgWeapons" >> _class >> "Displayname"); // lo busco de arma
};
if (isClass (configFile >> "CfgVehicles" >> _class)) then { // si es veh
	_nom = getText (configFile >> "CfgVehicles" >> _class >> "Displayname"); // pues de veh
};
if (!(isClass (configFile >> "CfgMagazines" >> _class)) AND !(isClass (configFile >> "CfgWeapons" >> _class)) AND
!(isClass (configFile >> "CfgVehicles" >> _class))) then { // es una variable
	_nom = [_class] call life_fnc_vartostr;
};
if (typeName _nom == "BOOL") then {
	_nom = _class;
};
if (isNil {_nom}) then {

	_nom = _class
};

_nom
