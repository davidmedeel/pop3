/*
	File: fn_spikeStrip.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	This is the server-side part of it which constantly monitors the spike strip and vehicles near it.
	First originally tried triggers but I was never any good at those nor do I like them as they
	have a global effect.
*/
private["_nearVehicles","_spikeStrip"];
_spikeStrip = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _spikeStrip) exitWith {}; //Bad vehicle type passed.

//waitUntil {_nearVehicles = nearestObjects[getPos _spikeStrip,["Car"],5]; count _nearVehicles > 0 OR isNull _spikeStrip};


while {true} do {
_nearVehicles = nearestObjects[getPos _spikeStrip,["Car"],5];
if (((count _nearVehicles) > 0) OR (isNull _spikeStrip)) exitWith {


if(isNull _spikeStrip) exitWith {}; //It was picked up?
_vehicle = _nearVehicles select 0;

if(isNil "_vehicle") exitWith {deleteVehicle _spikeStrip;};
[_vehicle] remoteexeccall ["life_fnc_spikeStripEffect",_vehicle];


};




};

/*
if(isNull _spikeStrip) exitWith {}; //It was picked up?
_vehicle = _nearVehicles select 0;

if(isNil "_vehicle") exitWith {deleteVehicle _spikeStrip;};
[_vehicle] remoteexeccall ["life_fnc_spikeStripEffect",_vehicle];
*/
