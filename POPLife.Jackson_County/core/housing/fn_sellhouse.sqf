#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Sells the house?
*/
private["_house","_uid","_action","_houseCfg","_listaventa"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_uid = getPlayerUID player;
_listaventa = []; 
_listaventa append listacasas; 
_listaventa append listaGarajes;
if(isNull _house) exitWith {};

if(!(typeOf _house in _listaventa)) exitWith {};

if(isNil {_house getVariable "house_owner"}) exitWith {hint "There is no owner for this house."};
closeDialog 0;

_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {};

_action = [
	format[localize "STR_House_SellHouseMSG",
	(round((_houseCfg select 0)/2)) call life_fnc_numberText,
	(_houseCfg select 1)],localize "STR_pInAct_SellHouse",localize "STR_Global_Sell",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	_house setVariable["house_sold",true,true];
	[_house] remoteexeccall ["TON_fnc_sellHouse",2];
	_house setVariable["locked",false,true];
	_house setVariable["containers",nil,true];
	deleteMarkerLocal format["house_%1",_house getVariable "uid"];
	_house setVariable["uid",nil,true];

	//medel_atmdin = medel_atmdin + (round((_houseCfg select 0)/2));
	_index = life_vehicles find _house;
	if(_index != -1) then {
		life_vehicles set[_index,-1];
		life_vehicles = life_vehicles - [-1];
	};

	_index = [str(getPosATL _house),life_houses] call TON_fnc_index;
	if(_index != -1) then {
		life_houses set[_index,-1];
		life_houses = life_houses - [-1];
	};
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house setVariable[format["bis_disabled_Door_%1",_i],0,true];
	};
	
	["Money Log",format [
	"%1 - (%2) ha vendido una casa por %3 en coordenadas (%6) - Dinero en banco : %4 - Dinero en mano %5",
	profileName,
	(getPlayerUID player),
	(round((_houseCfg select 0)/2)),
	medel_atmdin,
	medel_din,
	mapgridposition player
	]
	] remoteexeccall ["ica_fnc_customlog",2];
	
};
