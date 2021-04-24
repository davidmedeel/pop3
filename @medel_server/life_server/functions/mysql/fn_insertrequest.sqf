/*
        File: fn_insertRequest.sqf
        Author: Bryan "Tonic" Boardwine

        Description:
        Does something with inserting... Don't have time for
        descriptions... Need to write it...
*/
private["_uid","_name","_side","_money","_bank","_licenses","_handler","_thread","_queryResult","_query","_alias"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_money = [_this,2,0,[""]] call BIS_fnc_param;
//_bank = [_this,3,30000,[""]] call BIS_fnc_param;
_bank = [_this,3,50000,[""]] call BIS_fnc_param;
_returnToSender = [_this,4,ObjNull,[ObjNull]] call BIS_fnc_param;

//Error checks
if((_uid == "") OR (_name == "")) exitWith {systemChat "Bad UID or name";}; //Let the client be 'lost' in 'transaction'
if(isNull _returnToSender) exitWith {systemChat "ReturnToSender is Null!";}; //No one to send this to!

_query = format["GetPlayerIDName:%1",_uid];

waitUntil{sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,2] call DB_fnc_asyncCall;

//Double check to make sure the client isn't in the database...
if(typeName _queryResult == "STRING") exitWith {
[] remoteexec ["SOCK_fnc_dataQuery",(owner _returnToSender)];
}; //There was an entry!
if(count _queryResult != 0) exitWith {
[] remoteexec ["Sock_fnc_dataquery",(owner _returnToSender)];
};


//Clense and prepare some information.
_name = [_name] call DB_fnc_mresString; //Clense the name of bad chars.
_alias = [[_name]] call DB_fnc_mresArray;
_money = [_money] call DB_fnc_numberSafe;
_bank = [_bank] call DB_fnc_numberSafe;

//Prepare the query statement..
_query = format["InsertEmptyPlayer:%1:%2:%3:%4:%5",
        _uid,
        _name,
        _money,
        _bank,
        _alias
];

waitUntil {!DB_Async_Active};
_queryResult = [_query,1] call DB_fnc_asyncCall;

[] remoteexec ["Sock_fnc_dataquery",(owner _returnToSender)];