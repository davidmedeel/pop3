/*
	Author: Bryan "Tonic" Boardwine

	Description:
	WHAT THE HELL DO YOU THINK IT DOES?!?!!??!?!!?!??!
*/
private["_queryResult","_query","_count"];
waitUntil{!DB_Async_Active};
_count = (["CountHouses",2] call DB_fnc_asyncCall) select 0;

for [{_x=0},{_x<=_count},{_x=_x+10}] do {
	waitUntil{!DB_Async_Active};
	_query = format["GetHousesPlayers:%1",_x];
	_queryResult = [_query,2,true] call DB_fnc_asyncCall;
	if(count _queryResult == 0) exitWith {};

	{
		_pos = call compile format["%1",_x select 2];
		_house = nearestObject _pos;
		_house setVariable["house_owner",[_x select 1,_x select 3],true];
		_house setVariable["house_id",_x select 0,true];
		_house setVariable["house_owned",true,true];
		_house setVariable["locked",true,true]; //Lock up all the stuff.
		if (typeof _house in listacasas) then {
			_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
			for "_i" from 1 to _numOfDoors do {
				_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
			};
		};
	} foreach _queryresult;
};