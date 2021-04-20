/*
	File: fn_revived.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	THANK YOU JESUS I WAS SAVED!
*/
private["_medic","_dir"];
_medic = [_this,0,"Unknown Medic",[""]] call BIS_fnc_param;
_oldGear = [life_corpse] call life_fnc_fetchDeadGear;
[_oldGear] spawn life_fnc_loadDeadGear;
life_corpse setVariable["realname",nil,true]; //Should correct the double name sinking into the ground.
[life_corpse] remoteexeccall ["life_fnc_corpse",-2];
_dir = getDir life_corpse;
hint format[localize "STR_Medic_RevivePay",_medic,[(call life_revive_fee)] call life_fnc_numberText];

closeDialog 0;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

if(medel_atmdin > (call life_revive_fee)) then
{
	medel_atmdin = medel_atmdin - (call life_revive_fee);
} else {
	medel_atmdin = 0;
};

switch(playerSide) do
{
	case independent: {player setobjecttextureglobal [0,"\pop_iconos\textures\medic_uniform.jpg"];};
};

life_sidechat = true;
[player,life_sidechat,playerSide] remoteexeccall ["TON_fnc_managesc",2];



player setDir _dir;
player setPosASL (visiblePositionASL life_corpse);
life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
[life_corpse] remoteexeccall ["life_fnc_corpse",-2];
hideBody life_corpse;

player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];
call ica_fnc_actualizaHUD;
life_is_alive = true;