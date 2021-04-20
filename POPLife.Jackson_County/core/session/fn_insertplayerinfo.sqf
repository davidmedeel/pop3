/*
	File: fn_insertPlayerInfo.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Read the file name... Explains it.
*/
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
titleText [localize "STR_Session_QueryFail","PLAIN"];
// 0 cutFadeOut 9999999;
profilenamespace setvariable ["noiposci", nil];

[getPlayerUID player,profileName,medel_din,medel_atmdin,player] remoteexeccall ["DB_fnc_insertRequest",2];