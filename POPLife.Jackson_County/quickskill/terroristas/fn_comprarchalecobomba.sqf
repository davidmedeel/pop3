/*
	
	Chaleco Terrorista

*/

_unit = player;
if(isNull _unit) exitWith {};

if(vest _unit != "A3L_SuicideVest" AND vest _unit != "pop_chaleco_terro1") exitWith {};

[player, "bomba"] call CBA_fnc_globalSay3D;

sleep 2;

_c4 = "DemoCharge_Remote_Ammo_Scripted" createVehicle position _unit;
_c41 = "DemoCharge_Remote_Ammo_Scripted" createVehicle position _unit;
_c42 = "DemoCharge_Remote_Ammo_Scripted" createVehicle position _unit;
_c43 = "DemoCharge_Remote_Ammo_Scripted" createVehicle position _unit;
_c44 = "Bo_GBU12_LGB_MI10" createVehicle position _unit;
_c4 setDamage 1;
_c41 setDamage 1;
_c42 setDamage 1;
_c43 setDamage 1; 
_c44 setDamage 1; 
_list = player nearObjects 35;

{ _x setDamage 1; } forEach _list;

removeAllActions _unit;

{ _x setDamage 1; } forEach (player nearEntities ["Man", 35]);

[count (player nearEntities ["Man", 35])] spawn {

	sleep 10*60;
	
	hint format ["Has matado a %1 infieles!! Recibes %2€ por tu azaña!!", _this select 0, ((_this select 0) * 15000)];
	medel_atmdin = medel_atmdin + 
 medel_dinmedel_din(_this select 0 * 15000);
	
	["Money Log",format [
		"ATENTADO - %1(%4) ha ganado %2 haciendo un atentado y matando a %3 personas || Dinero en banco : %6 - Dinero en mano %5",
		name player,
		((_this select 0) * 15000),
		_this select 0,
		(getPlayerUID player),
		medel_din,
		medel_atmdin
	]
	] remoteexeccall ["ica_fnc_customlog",2];
};