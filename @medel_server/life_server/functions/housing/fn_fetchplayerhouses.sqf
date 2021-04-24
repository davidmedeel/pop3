 /*
	Author: Bryan "Tonic" Boardwine

	Description:
	Fetches all the players houses and sets them up.
*/
private["_query","_houses","_DB_fnc_mresToArray","_array","_sel","_house","_HouseCheck2","_containerData"];
if(_this == "") exitWith {};

_DB_fnc_mresToArray =
        {
                private["_array"];
                _array = [_this,0,"",[""]] call BIS_fnc_param;
                if(_array == "") exitWith {[]};
                _array = toArray(_array);

                for "_i" from 0 to (count _array)-1 do
                {
                        _sel = _array select _i;
                        if(_sel == 96) then
                        {
                                _array set[_i,39];
                        };
                };

                _array = toString(_array);
                _array = call compile format["%1", _array];
                _array;
        };

_return = [];
_query = format["GetPlayerHouses:%1",_this];
waitUntil{!DB_Async_Active};
diag_log format ["--------------FETCHPLAYERHOUSES-------------------------: _query   %1",_query];
_houses = [_query,2,true] call DB_fnc_asyncCall;
diag_log format ["FETCHPLAYER HOUSES: _houses   %1",_houses];

{
		_HouseCheck2 = true;
		_pos = call compile format["%1",_x select 1];
	    _HouseCheck = nearestObjects [_pos,["pop_caja_armariop_box","pop_caja_armariog_box"], 5];

		if(count _HouseCheck != 0)then{_HouseCheck2 = false;};
		_house = nearestObject _pos;
		_house allowDamage false;
		_containers = [];


		if(_HouseCheck2)then
		{
				_house setVariable["slots",[],true];
				if(!isNil {(_house getVariable "containers")}) then {
						{if(!isNull _x) then {deleteVehicle _x;};} foreach (_house getVariable "containers");
				};
		};

		_containerData = [_x select 2] call _DB_fnc_mresToArray;
		if(typeName _containerData == "STRING") then {_containerData = call compile format["%1", _containerData];};
		{
				if(count _x == 0) exitWith {}; //No containers / items.
				_className = _x select 0;
				_weapons = (_x select 1) select 0;
				_magazines = (_x select 1) select 1;
				_items = (_x select 1) select 2;
				_backpacks = (_x select 1) select 3;

				//Setup the variables
				_positions = [_house] call life_fnc_getBuildingPositions;
				_pos = [0,0,0];
				_Dir = 0;

				{
						_slots = _house getVariable ["slots",[]];
						if(!(_forEachIndex in _slots)) exitWith
						{
								_slots pushBack _forEachIndex;
								if(_HouseCheck2)then
								{
										_house setVariable["slots",_slots,true];
								};
								_pos = [(_x select 0),(_x select 1),(_x select 2)];
								_Dir = (_x select 3);
						};
				} foreach _positions;

				if(_pos isEqualTo [0,0,0]) exitWith {diag_log format ["################FETCHPLAYERHOUSES######################## error: %1", _this]};

				if(_HouseCheck2)then
				{
						_container = createVehicle[_className,_pos,[],0,"NONE"];
						waitUntil{!isNil "_container"};
						_container allowDamage false;
						_HouseDir = getDir _house;
						_Dir = (_HouseDir - _Dir);
						_container setDir _Dir;
						_container setVectorUp [0,0,1];
						_container setPos _pos;

						_containers pushBack _container;
						clearWeaponCargoGlobal _container;
						clearItemCargoGlobal _container;
						clearMagazineCargoGlobal _container;
						clearBackpackCargoGlobal _container;
						//Add weapons to the crate.
						{
								_weaponCount = (_weapons select 1) select _forEachIndex;
								_container addWeaponCargoGlobal [_x,_weaponCount];
						} foreach (_weapons select 0);

						//Add magazines
						{
								_magazineCount = (_magazines select 1) select _forEachIndex;
								_container addMagazineCargoGlobal [_x,_magazineCount];
						} foreach (_magazines select 0);

						//Add items
						{
								_itemCount = (_items select 1) select _forEachIndex;
								_container addItemCargoGlobal [_x,_itemCount];
						} foreach (_items select 0);

						//Add backpacks
						{
								_backpackCount = (_backpacks select 1) select _forEachIndex;
								_container addBackpackCargoGlobal [_x,_backpackCount];
						} foreach (_backpacks select 0);
				};
			sleep 0.25;
		} foreach _containerData;

		if(_HouseCheck2)then
		{
				_house setVariable["containers",_containers,true];
		};
		_return pushBack [_x select 1,_containers];
} foreach _houses;
missionNamespace setVariable[format["houses_%1",_this],_return];