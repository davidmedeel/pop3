
private["_container"];

_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _container) exitWith {};

if((typeOf _container) in ["pop_caja_armariop_box","pop_caja_armariog_box"]) exitWith {
	_house = lineIntersectsWith [getPosASL player, ATLtoASL screenToWorld[0.5,0.5]];

	switch(true) do {
		case (count _house == 0): {_exit = true;};
		case (count _house == 1): {_house = _house select 0;};
		default {
			{if((typeof _x ) in listaCasas) exitWith {_house = _x;};} foreach _house;
		};
	};
	if!(isNil "_exit") exitWith {systemChat localize "STR_House_ContainerError"};
	//if!((typeOf _house) in listaCasas) exitWith {systemChat "Error con las casas"};
	//if!((typeOf _container) in ["pop_caja_armariop_box","pop_caja_armariog_box"]) exitWith {systemChat "Error con la caja"};
	[_house] remoteexec ["TON_fnc_updateHouseContainers",2];
};
