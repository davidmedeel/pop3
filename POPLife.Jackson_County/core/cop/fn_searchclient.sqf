/*
	File: fn_searchClient.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Searches the player and he returns information back to the player.
*/
private["_cop","_inv","_var","_val","_robber"];
_cop = [_this,0,Objnull,[objNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};
_robber = false;

if(!life_use_atm) then
{
	medel_din = 0;
	_robber = true;
};

[player,_inv,_robber] remoteexeccall ["life_fnc_copSearch",_cop];