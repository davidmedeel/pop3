
svr_arrestbutton = {
_personyouwanjail = _this select 0;
_randomiets = _this select 1;
_timeinminute = _this select 2;
_reasonofjail = _this select 3;
[_personyouwanjail,_randomiets,_timeinminute,_reasonofjail] remoteexec ["fnc_sendtojail",_personyouwanjail];
};

svr_sendtojail = {
private["_unit","_bad","_id","_ret"];
_player = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _player) exitWith {};
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_id = owner _player;
_time = _this select 2;
_reasonofarrest = _this select 3;
_uid = getplayerUID _player;
_query = format["UPDATE players SET jailtime='%1', arrestreason='%2' WHERE playerid='%3'",_time,_reasonofarrest,_uid];
waitUntil {sleep (random 0.3); !DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;

_ret = [_player] call life_fnc_wantedPerson;
[_ret,_bad] remoteexec ["fnc_jailsetup",_id];
};

svr_jailtodb = {
private ["_hour","_minute","_uid","_query"];
_hour = _this select 0;
_minute = _this select 1;
_uid = getplayerUID (_this select 2);
_hour = _hour * 60;
_minute = _minute + _hour;
_query = format["UPDATE players SET jailtime='%1' WHERE playerid='%2'",_minute,_uid];
waitUntil {sleep (random 0.3); !DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;
};


svr_releaseprison = {
_uid = getplayerUID (_this select 0);
_minute = 0;
_reason = "none";
_query = format["UPDATE players SET jailtime='%1', arrestreason='%2' WHERE playerid='%3'",_minute,_reason,_uid];
waitUntil {sleep (random 0.3); !DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;
};