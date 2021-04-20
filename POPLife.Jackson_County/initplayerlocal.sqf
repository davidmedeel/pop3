
life_adminlevel = nil; life_coplevel = nil; life_donator = nil;

if(!hasInterface) exitWith {};

#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})

__CONST__(BIS_fnc_endMission,BIS_fnc_endMission);

[true] spawn ica_fnc_vistaBonita;

player setVariable ['QS_seated',FALSE];

[] execVM "core\init.sqf";

votando = false;

hierbas = 0;

if((_this select 1)) then {
	[] execVM "core\jip.sqf";
};

//("CapaLogo" call BIS_fnc_rscLayer) cutRsc ["Logo","PLAIN",1,false];

0 enableChannel false;
1 enableChannel false;
2 enableChannel false;
6 enableChannel false;
7 enableChannel false;
8 enableChannel false; 

player allowDamage true;

player createDiarySubject ["pop","Plata o Plomo"];
player createDiaryRecord ["pop", ["www.plataoplomo.es", "by Medel"]];

if (vehicle player == player) then {
	player allowDamage false;
};

["Init"] spawn ica_fnc_p0;
