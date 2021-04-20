/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Tries to place a storage box in the nearest house.
*/
private["_boxType","_house","_positions","_containers","_pos","_houseCfg"];
_boxType = _this select 0;

_house = nearestObject [player, "House"];
if(!(_house in life_vehicles)) exitWith {hint localize "STR_ISTR_Box_NotinHouse"};
_containers = _house getVariable["containers",[]];
_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {}; //What the fuck happened?
if(count _containers >= (_houseCfg select 1)) exitWith {hint localize "STR_ISTR_Box_HouseFull"};

_slots = _house getVariable ["slots",[]];
_positions = [_house] call life_fnc_getBuildingPositions;
_pos = [0,0,0];
_Dir = 0;
{
	_slots = _house getVariable ["slots",[]];
	if(!(_forEachIndex in _slots)) exitWith
	{
		_slots pushBack _forEachIndex;
		_house setVariable["slots",_slots,true];
		_pos = [(_x select 0),(_x select 1),(_x select 2)];
		_Dir = (_x select 3);
	};
} foreach _positions;

//if(_pos isEqualTo [0,0,0]) exitWith {hint localize "STR_ISTR_Box_HouseFull_2"};


if (([_boxType] call ica_fnc_tengo) < 1) exitWith {hint "No tienes ningún mueble"};
_boxType spawn {sleep 0.1; [_this, -1] call ica_fnc_item};

switch (_boxType) do {
	case "pop_armariop": {
		_container = "pop_caja_armariop_box" createVehicle [0,0,0];

		_HouseDir = getDir _house;
		_Dir = (_HouseDir - _Dir);
		_container allowDamage false;
		_container setDir _Dir;
		_container setPos _pos;
		

		_containers pushBack _container;
		_house setVariable["containers",_containers,true];
		[_house] remoteexec ["TON_fnc_updateHouseContainers",2];

		//Empty out the crate
		clearWeaponCargoGlobal _container;
		clearMagazineCargoGlobal _container;
		clearItemCargoGlobal _container;
		clearBackpackCargoGlobal _container;
	};

	case "pop_armariog": {
		_container = "pop_caja_armariog_box" createVehicle [0,0,0];

		_HouseDir = getDir _house;
		_Dir = (_HouseDir - _Dir);
		_container allowDamage false;
		_container setDir _Dir;
		_container setPos _pos;
		

		_containers pushBack _container;
		_house setVariable["containers",_containers,true];
		[_house] remoteexec ["TON_fnc_updateHouseContainers",2];

		//Empty out the crate
		clearWeaponCargoGlobal _container;
		clearMagazineCargoGlobal _container;
		clearItemCargoGlobal _container;
		clearBackpackCargoGlobal _container;
	};
};