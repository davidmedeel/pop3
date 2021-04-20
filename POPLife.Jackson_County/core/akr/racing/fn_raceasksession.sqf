/*
	File: fn_raceAskSession.sqf
	Author: Akryllax
	Desc:
*/

private["_racer","_trackID"];

_racer = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
_trackID = [_this, 3, "",[""]] call BIS_fnc_param;

diag_log "# 'raceAskSession' Action triggered";
diag_log format["# Passing param _racer '%1'", _racer];
diag_log format["# Passing param _trackID '%1'", _trackID];

_price = ([_trackID] call life_fnc_raceConf) select 1;

if(medel_din < _price) exitWith {
	hint format["Esta carrera cuesta %1, y tu solo tienes %2", _price, medel_din];
};

hint "Iniciando la carrera";

medel_din = medel_din - _price;

[_trackID,_racer] remoteexeccall ["life_fnc_raceProcessRequest",2];