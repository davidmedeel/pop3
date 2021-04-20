
/*
por: Icaruk

*/

_tio = _this select 0;
_container = _this select 1;
_item = _this select 2;


if ((_item call ica_fnc_item) == "Bac") then {
	if (getNumber (configFile >> "CfgVehicles" >> typeOf _container >> "maxspeed") > 0) then {
		if ((count (backpackCargo _container)) > 1) then {
			clearBackpackCargoGlobal _container;
			hint "Sólo se puede almacenar 1 mochila en los vehículos. Por seguridad, se han eliminado todas las mochilas que contenía. ";
		};
	};
};
