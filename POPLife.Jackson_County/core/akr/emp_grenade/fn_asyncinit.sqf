/*
	File: fn_asyncInit.sqf
	Author: Akryllax
	Desc: Speeds up loading sheduling some non-priority loading.
*/

player addEventHandler["Fired", life_fnc_EMPEH];
player addEventHandler["HandleDamage", life_fnc_HandleDamage];

for "_i" from 0 to 6 do {
	//player addMagazine "O_IR_Grenade";
};