 /*
		File: fn_updateRequest.sqf
		Author: Bryan "Tonic" Boardwine

		Description:
		Ain't got time to describe it, READ THE FILE NAME!
*/
private["_uid","_side","_cash","_bank","_licenses","_gear","_name","_query","_thread","_isArrested"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_side = [_this,2,sideUnknown,[civilian]] call BIS_fnc_param;
_cash = [_this,3,0,[0]] call BIS_fnc_param;
_bank = [_this,4,5000,[0]] call BIS_fnc_param;
_licenses = [_this,5,[],[[]]] call BIS_fnc_param;
_gear = [_this,6,[],[[]]] call BIS_fnc_param;
_experiencia =[_this,7,[],[[]]] call BIS_fnc_param;

//Get to those error checks.
if((_uid == "") OR (_name == "")) exitWith {};

//Parse and setup some data.
_name = [_name] call DB_fnc_mresString;
_gear = [_gear] call DB_fnc_mresArray;
//_experiencia = [_experiencia] call DB_fnc_mresArray;
_cash = [_cash] call DB_fnc_numberSafe;
_bank = [_bank] call DB_fnc_numberSafe;

//Does something license related but I can't remember I only know it's important?
for "_i" from 0 to count(_licenses)-1 do {
		_bool = [(_licenses select _i) select 1] call DB_fnc_bool;
		_licenses set[_i,[(_licenses select _i) select 0,_bool]];
};

_licenses = [_licenses] call DB_fnc_mresArray;

//Side specific parsing
switch (_side) do {
	case civilian: {
		_isArrested = [_this, 8, false, [false]] call BIS_fnc_param;
		_isArrested = [_isArrested] call DB_fnc_bool;
	};
};

switch (_side) do {
		case west: {_query = format["UpdateRequestWest:%1:%2:%3:%4:%5:%6:%7",_name,_cash,_bank,_gear,_licenses,_experiencia,_uid];};
		case civilian: {_query = format["UpdateRequestCivilian:%1:%2:%3:%4:%5:%6:%7:%8",_name,_cash,_bank,_licenses,_gear,_experiencia,_isArrested,_uid]};
		case independent: {_query = format["UpdateRequestIndependent:%1:%2:%3:%4:%5:%6:%7",_name,_cash,_bank,_licenses,_gear,_experiencia,_uid];};
		case east: {_query = format["UpdateRequestEast:%1:%2:%3:%4:%5:%6:%7",_name,_cash,_bank,_gear,_licenses,_experiencia,_uid];};
};

waitUntil {sleep (random 0.3); !DB_Async_Active};
_queryResult = [_query,1] call DB_fnc_asyncCall;

