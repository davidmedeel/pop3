
private["_civ","_cop","_id","_half"];
_civ = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_cop = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
_half = [_this,2,false,[false]] call BIS_fnc_param;
if(isNull _civ OR isNull _cop) exitWith {};

_id = [(getPlayerUID _civ),life_wanted_list] call TON_fnc_index;
if(_id != -1) then
{
	if(_half) then
	{
		[((life_wanted_list select _id) select 3) / 2,((life_wanted_list select _id) select 3)] remoteexec ["life_fnc_bountyReceive",(owner _cop)];
	}
		else
	{
		[(life_wanted_list select _id) select 3,(life_wanted_list select _id) select 3] remoteexec ["life_fnc_bountyReceive",(owner _cop)];
	};
};