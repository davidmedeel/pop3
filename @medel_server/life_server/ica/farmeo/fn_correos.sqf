
/*
By Borjamed

Correos gg

fn_correos.sqf
["salida"] spawn ica_fnc_correos;
["entrega"] spawn ica_fnc_correos;
["cobro"] spawn ica_fnc_correos;
*/

_param = _this select 0;

if (_param isEqualTo "salida") then {
	if !(isNil {casacorreos}) exitWith {Hint "Ya te he dado el paquete que tienes que entregar"};
	if (count (nearestObjects [getMarkerPos "correos_car1",["car"],10]) > 0) exitWith {hint "No hay espacio para la furgoneta"};
	if (medel_din < 15000) exitWith {hint "Necesitas pagar una fianza de 15000€ por la furgoneta"};
	medel_din = medel_din - 15000;
	vehcorreos = "pop_nemo_correos" createVehicle getMarkerPos "correos_car1";
	[vehcorreos,2] remoteexeccall ["life_fnc_lockVehicle",vehcorreos];
	life_vehicles pushBack vehcorreos;
	_ciudades = [
	[8099.18,5282.1,0],
	[8553.28,6592.75,0],
	[4937.63,2798.06,0],
	[5026,1110.64,0],
	[8933.87,8351.8,0],
	[5875.97,8296.86,0],
	[5255.82,9439.9,0],
	[3441.63,7641.02,0],
	[2850.38,5626.27,0],
	[4172.67,6505.67,0],
	[2323.2,2064.52,0]
	];
	_paquete = [
	"pop_carbon_r",
	"pop_tostada",
	"pop_nokia",
	"pop_maiz_i",
	"pop_kiwi",
	"pop_Hierro_r",
	"pop_G_Oreo",
	"pop_coca_b",
	"pop_pez4",
	"pop_banana",
	"pop_arena_r",
	"pop_aguasucia"
	];
	paquetecorreos = selectRandom _paquete;
	vehcorreos addItemCargo [paquetecorreos,1];
	casacorreos = selectRandom (nearestObjects [(selectRandom _ciudades),["house"],100]);
	while {typeof casacorreos in [
	"Land_LampStreet_F","Land_Fence1_DED_Fence_01_F","Land_i_Garage_V1_F","Land_PowerPoleWooden_L_F","Land_FuelStation_01_arrow_F","Land_fs_price_F",
	"Land_LampDecor_F","Land_LampHalogen_F","Land_fs_roof_F","rmair_DividerWall_Earth6m","Land_E76_fireladder1","Land_LampShabby_F","Land_E76_City_part1",
	"plp_up_BollardIronAGreenLightOn","Land_E76_trafficlight03a","Land_E76_trafficlight02a","rmair_HandrailA_3m","rmair_mk_LineFullStrYlw_15m",
	"rmair_mk_ParkCar_5","Land_LampStreet_small_F","policesub_tarmac_part1","Orel_NPC_ATM","Land_Pier_F","Land_LampAirport_F","Land_LampAirport_F"
	]} do {
		casacorreos = selectRandom (nearestObjects [(selectRandom _ciudades),["house"],100]);
	};
	casacorreos addAction ["Entregar paquete",{["entrega"] spawn ica_fnc_correos}];
	entrega = player createSimpleTask ["Entrega el paquete"];
	entrega setSimpleTaskDestination (position casacorreos);
	entrega setSimpleTaskDescription ["Entrega aqui el paquete", "Entrega el paquete", "Entrega aqui el paquete"];
	entrega setTaskState "Assigned";
	tiempocorreos = 0;
	hint format ["Fuera te espera una furgoneta con %2 dentro, tienes que entregarlo en la posicion marcada en el mapa.\nNo tardes más de %1 %3.",if (((((getMarkerPos "correos_1") distance casacorreos)/5)-10) > 60) then {round(((((getMarkerPos "correos_1") distance casacorreos)/5)-10)/60)}else{((((getMarkerPos "correos_1") distance casacorreos)/5)-10)},[paquetecorreos] call ica_fnc_classToName,if (((((getMarkerPos "correos_1") distance casacorreos)/5)-10) > 60) then {"minutos"}else{"segundos"}];
	while {true} do {
		if (isNil {tiempocorreos}) exitWith {};
		if ((tiempocorreos > ((getMarkerPos "correos_1" distance casacorreos)/5)) || !alive player) exitWith {
			hint "Has tardado demasiado, ya no podras cobrar.\nNo hace falta que entregues el paquete";
			if (!alive player) then {deleteVehicle vehcorreos;};
			player removeSimpleTask entrega;
			casacorreos removeAction (actionIDs cursorTarget select 0);
			tiempocorreos = nil;
			casacorreos = nil;
			entrega = nil;
		};
		tiempocorreos = tiempocorreos + 5;
		sleep 5;
	};
};
if (_param isEqualTo "entrega") then {
	if !(([paquetecorreos] call ica_fnc_tengo) >= 1) exitWith {
		hint "Has perdido el paquete...\nTu jefe se va a enfadar y no vas a cobrar nada, al no ser que lo encuentres y lo entregues.";
	};
	casacorreos removeAction (actionIDs cursorTarget select 0);
	entrega setTaskState "Succeeded";
	player removeSimpleTask entrega;
	entrega = nil;
	if ((random 100) < 90) then {
		entrega1 = player createSimpleTask ["Vuelve a cobrar"];
		entrega1 setSimpleTaskDestination (getMarkerPos "correos_1");
		entrega1 setSimpleTaskDescription ["Tienes que volver a la oficina a cobrar", "Vuelve a cobrar", "Vuelve a la oficina"];
		entrega1 setTaskState "Assigned";
		hint format ["Has entregado %1 puedes volver a la oficina a cobrar.",[paquetecorreos] call ica_fnc_classToName];
		[format ["- 1 %1", [paquetecorreos] call ica_fnc_classToName]] call ica_fnc_infolog;
		[paquetecorreos, -1] call ica_fnc_item;
		paquetecorreos = nil;
	}else{
		hint "No hay nadie en casa...\nVuelve a dejar el paquete en la oficina";
		entrega1 = player createSimpleTask ["Vuelve a cobrar"];
		entrega1 setSimpleTaskDestination (getMarkerPos "correos_1");
		entrega1 setSimpleTaskDescription ["Tienes que volver a la oficina a cobrar", "Vuelve a cobrar", "Vuelve a la oficina"];
		entrega1 setTaskState "Assigned";
		hint format ["Jopelines, no hay nadie y no puedes entregar %1, vuelve a la oficina y devuelve el paquete para cobrar por tu trabajo.",[paquetecorreos] call ica_fnc_classToName];
	};
};
if (_param isEqualTo "cobro") then {
	if (isNil {casacorreos}) exitWith {
		Hint "Antes tienes que trabajar";
	};
	if !(isNil {entrega}) exitWith {hint "Tienes que entregar el paquete primero"};
	if ((((getMarkerPos "correos_1") distance casacorreos) / 5) < tiempocorreos) exitWith {
		hint "Has tardado demasiado";
		casacorreos = nil;
		player removeSimpleTask entrega1;
		tiempocorreos = nil;
		entrega1 = nil;
	};
	if (!(isNil {paquetecorreos}) && !(([paquetecorreos] call ica_fnc_tengo) >= 1)) exitWith {
		hint "Has perdido el paquete, para poder cobrar buscalo y vuelve";
	};
	if !(isNil {paquetecorreos}) then {
		[format ["- 1 %1", [paquetecorreos] call ica_fnc_classToName]] call ica_fnc_infolog;
		[paquetecorreos, -1] call ica_fnc_item;
		paquetecorreos = nil;
	};
	entrega1 setTaskState "Succeeded";
	_dinero = ((round ((((getMarkerPos "correos_1") distance casacorreos)/5)-(tiempocorreos))*10)*1.7);
	medel_din = medel_din + _dinero;
	[format ["+ %1 €", _dinero]] call ica_fnc_infolog;
	hint format ["Has ganado %1 €.\nGracias por trabajar en correos, vuelve cuando quieras",_dinero];
	_exp = round ((((((getMarkerPos "correos_1") distance casacorreos)/5)-tiempocorreos)*100)/(((getMarkerPos "correos_1") distance casacorreos)/5))/10;
	["exp",_exp] call ica_fnc_arrayexp;
	player removeSimpleTask entrega1;
	entrega1 = nil;
	tiempocorreos = nil;
	casacorreos = nil;
};
if (_param isEqualTo "furgo") then {
	if (isNil {vehcorreos}) exitWith {
		hint "No hay ninguna furgoneta que entregar";
	};
	if ((getMarkerPos "correos_car1" distance vehcorreos) > 10) exitWith {
		hint "La furgoneta esta demasiado lejos";
	};
	deleteVehicle vehcorreos;
	vehcorreos = nil;
	hint "Se te han devuelto los 15000€ de la fianza";
	medel_din = medel_din + 15000;
	[format ["+ %1 €", 15000]] call ica_fnc_infolog;
};