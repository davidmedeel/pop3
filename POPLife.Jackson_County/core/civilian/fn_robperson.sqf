/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Getting tired of adding descriptions...
*/
private["_robber"];
_robber = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _robber) exitWith {}; //No one to return it to?

if(medel_din > 0) then {
	if ((side _robber) == WEST) then {
	_prcn = _this select 1;
	_dinero = (medel_din/100)*_prcn;
	[_dinero] remoteexec ["life_fnc_robReceive",_robber];
	medel_din = medel_din - _dinero;
	[0] call SOCK_fnc_updatePartial;
	} else {
	[medel_din] remoteexeccall ["life_fnc_robReceive",_robber];
	[getPlayerUID _robber,_robber getVariable["realname",name _robber],"211"] remoteexeccall ["life_fnc_wantedAdd",2];
	[1,"STR_NOTF_Robbed",true,[_robber getVariable["realname",name _robber],profileName,[medel_din] call life_fnc_numberText]] remoteexeccall ["life_fnc_broadcast",-2];
	medel_din = 0;
	[0] call SOCK_fnc_updatePartial;
	};
}
	else
{
	if ((side _robber) == WEST) then
	{
		["No tiene dinero."] remoteexeccall ["hint",_robber];
	} else {
		[2,"STR_NOTF_RobFail",true,[profileName]] remoteexeccall ["life_fnc_broadcast",_robber];
	};
};
