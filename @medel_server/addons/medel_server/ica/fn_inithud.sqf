
/*
CreaHUD por Icaruk
	0 spawn ica_fnc_initHUD;
*/

waitUntil {player == player};
waitUntil {!isNull player};
waitUntil {!isNil {medel_din}};

disableSerialization;
("hudica" call BIS_fnc_rscLayer) cutRsc ["HUDica","PLAIN", 1, false];


_ui = uiNamespace getVariable "HUDica";

_salud = _ui displayCtrl 6001;
	_salud ctrlSetTextColor [1,0,0,1]; // rojo
_hambre = _ui displayCtrl 6003;
	_hambre ctrlSetTextColor [0,1,0,1]; // verde
_sed = _ui displayCtrl 6002;
	_sed ctrlSetTextColor [0,0.3,1,1]; // azul
_fatiga = _ui displayCtrl 6004;
	_fatiga ctrlSetTextColor [0.72,0.54,0,1];
_peso = _ui displayCtrl 6005;
	_peso ctrlSetTextColor [1,1,1,1];
_exp = _ui displayCtrl 6006;
	_exp ctrlSetTextColor [1,0,0.75,1];
_txtExp = _ui displayCtrl 6010;
	_txtExp ctrlSetTextColor [1, 0.7, 0, 1];
_txt2 = _ui displayCtrl 6014;
	_txt2 ctrlSetTextColor [0.9, 0.9, 0.9, 0.8];
_nombre = _ui displayCtrl 6008;
	_nombre ctrlSetStructuredText parseText format ["<t size='0.99' font='PuristaMedium' color='#FF8000' align='right'>%1</t>", name player];

	

ica_fnc_actualizaHUD = {
	if (isnil "medel_din") then {medel_din = 0};
	disableSerialization;
	_ui = uiNamespace getVariable "HUDica";

	_salud = _ui displayCtrl 6001;	
	_hambre = _ui displayCtrl 6003;
	_sed = _ui displayCtrl 6002;
	_peso = _ui displayCtrl 6005;
	_exp = _ui displayCtrl 6006;
	_txtLvl = _ui displayCtrl 6010;
	_txt2 = _ui displayCtrl 6014;
	_nombre = _ui displayCtrl 6008;
	_dinero = _ui displayCtrl 6009;
	_salud progressSetPosition 1 - (damage player);
	_hambre progressSetPosition (profileNamespace getVariable "hearb") / 100;
	_sed progressSetPosition (profileNamespace getVariable "fois") / 100;
	_peso progressSetPosition ([] call ica_fnc_cargaInv);
	
	_exp progressSetPosition ("next" call ica_fnc_expToLevel);
	
	_txtLvl ctrlSetText format ["   Nivel %1", [] call ica_fnc_expToLevel];
	_txt2 ctrlSetText format ["Energía: %1/1000 | SP: %2", experiencia select 2, experiencia select 1];
	_dinero ctrlSetStructuredText parseText format ["<t size='0.95' font='PuristaMedium' color='#FFFFFF' align='right'>%1 €</t>", [medel_din, 3] call ica_fnc_numToStr];
};

ica_actualizaFatiga = {
	disableSerialization;
	_ui = uiNamespace getVariable "HUDica";
	_fatiga = _ui displayCtrl 6004;
	_fatiga progressSetPosition 1 - (getFatigue player);
};

call ica_fnc_actualizaHUD;

[] spawn {
	while {true} do {
		call ica_actualizaFatiga;
		sleep 1;
	};
};

// Esto es temporal
[] spawn {
	while {true} do {
		call ica_fnc_actualizaHUD;
		sleep 1;
	};
};	
