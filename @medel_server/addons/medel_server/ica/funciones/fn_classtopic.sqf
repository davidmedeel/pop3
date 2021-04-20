
private ["_class", "_pic"];
_class = _this select 0;

if ((typeName _class) == "SCALAR") exitWith {""};
if (_class == "") exitWith {_class};

if (isClass (configFile >> "CfgMagazines" >> _class)) then { // si es cargador
	_pic = getText (configFile >> "CfgMagazines" >> _class >> "picture"); // busco nombre cargador
};
if (isClass (configFile >> "CfgWeapons" >> _class)) then { // si es arma
	_pic = getText (configFile >> "CfgWeapons" >> _class >> "picture"); // lo busco de arma
};
if (isClass (configFile >> "CfgVehicles" >> _class)) then { // si es veh
	_pic = getText (configFile >> "CfgVehicles" >> _class >> "picture"); // pues de veh
};

if (isNil {_pic}) then {""} else {_pic};
