/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Inserts the gang into the database.
*/
private["_ownerID","_uid","_gangName","_query","_queryResult","_gangMembers","_group"];
_ownerID = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_uid = [_this,1,"",[""]] call BIS_fnc_param;
_gangName = [_this,2,"",[""]] call BIS_fnc_param;
_group = group _ownerID;

if(isNull _ownerID OR _uid == "" OR _gangName == "") exitWith {}; //Fail

_ownerID = owner _ownerID;
_gangName = [_gangName] call DB_fnc_mresString;
_query = format["GetIdGangByName:%1",_gangName];
waitUntil{!DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;

//Check to see if the gang name already exists.
if(count _queryResult != 0) exitWith {
	[1,"Ya existe un grupo creado con ese nombre por favor elija otro nombre."] remoteexeccall ["life_fnc_broadcast",_ownerID];
	["life_action_gangInUse",nil,missionNamespace] remoteexeccall ["life_fnc_netsetvar",_ownerID];
};

_query = format["GetIdGangByMembers:%2%1%2",_uid,"%"];
waitUntil{!DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;

//Check to see if this person already owns or belongs to a gang.
if(count _queryResult != 0) exitWith {
	[1,"Actualmente se encuentra ya activa en una pandilla, por favor dejar la pandilla primero."] remoteexeccall ["life_fnc_broadcast",_ownerID];
	["life_action_gangInUse",nil,missionNamespace] remoteexeccall ["life_fnc_netsetvar",_ownerID];
};

//Check to see if a gang with that name already exists but is inactive.
_query = format["GetInactiveGangByName:%1",_gangName];
waitUntil{!DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;
_gangMembers = [[_uid]] call DB_fnc_mresArray;

if(count _queryResult != 0) then {
	_query = format["SetGangActiveById:%1:%2:%3",_uid,_gangMembers,(_queryResult select 0)];
} else {
	_query = format["InsertNewGang:%1:%2:%3",_uid,_gangName,_gangMembers];
};
waitUntil{!DB_Async_Active};
_queryResult = [_query,1] call DB_fnc_asyncCall;

_group setVariable["gang_name",_gangName,true];
_group setVariable["gang_owner",_uid,true];
_group setVariable["gang_bank",0,true];
_group setVariable["gang_maxMembers",8,true];
_group setVariable["gang_members",[_uid],true];
[_group] remoteexeccall ["life_fnc_gangCreated",_ownerID];

sleep 0.35;
_query = format["GetIdActiveGangByOwner:%1",_uid];
waitUntil{!DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;

_group setVariable["gang_id",(_queryResult select 0),true];
