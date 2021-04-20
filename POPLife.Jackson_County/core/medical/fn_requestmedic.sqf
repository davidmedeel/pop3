/*
	File: fn_requestMedic.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	N/A
*/
private["_medicsOnline"];
_medicsOnline = {_x != player && {side _x == independent} && {alive _x}} count playableUnits > 0; //Check if medics (indep) are in the room.

if(_medicsOnline) then {
	//There is medics let's send them the request.
	[player,profileName] remoteexeccall ["life_fnc_medicRequest",independent];
} else {
	//No medics were online, send it to the police.
	[player,profileName] remoteexeccall ["life_fnc_copMedicRequest",west];
};

//Create a thread to monitor duration since last request (prevent spammage).
[] spawn
{
	((findDisplay 7300) displayCtrl 7303) ctrlEnable false;
	((findDisplay 7300) displayCtrl 7304) ctrlEnable false;
	sleep (2 * 60);
	((findDisplay 7300) displayCtrl 7303) ctrlEnable true;
	((findDisplay 7300) displayCtrl 7304) ctrlEnable true;
};