
/*
por: Icaruk

Params:
	0: STRING - Texto a mostrar.
	1: STRING (opc) - Texto del botón 1. False para ocultar.
	2: STRING (opc) - Texto del botón 2. False para ocultar.
	3: SCALAR (opc) - Tiempo que tarda en activar los botones.
	
Ejemplos:	
	["¿Seguro?"] call ica_fnc_confirmacion;
	_confirmado = ["¿Seguro?", "Sí", "No"] call ica_fnc_confirmacion;
	["Ha ocurrido algo.", "Vale", false] call ica_fnc_confirmacion;
	["Ha ocurrido algo.", false, "OK"] call ica_fnc_confirmacion;
	["3 segundos para leer.", "Vale", false, 3] call ica_fnc_confirmacion;
	
Return:
	BOOL según el botón que hayas pulsado.
	
NOTA: La tecla ESC está bloqueada.
NOTA 2: Tiene que estar en SE para que haga el waitUntil llamando desde un call.
NOTA 3: Si se mete texto estructurado no se debe hacer parseText, ya se hace aquí.

*/


// if !(canSuspend) exitWith {["Se necesita SE."] call BIS_fnc_error};


confirmacion = nil;

private _texto = param [0];
private _textoB1 = param [1, "Aceptar"];
private _textoB2 = param [2, "Cancelar"];
private _delay = param [3, 0];

disableSerialization;
createDialog "confirmacion";
_ui = uiNamespace getVariable "confirmacion";

_grp = _ui displayCtrl 6350;
_fondo = _ui displayCtrl 6351;
_txt = _ui displayCtrl 6352;
_b1 = _ui displayCtrl 6353;
_b2 = _ui displayCtrl 6354;


// config inicial
_fondo ctrlAddEventHandler ["Destroy", {if (isNil "confirmacion") then {confirmacion = false}}];
_fondo ctrlEnable false;



// ***********************
// Texto
// ***********************

_txt ctrlSetStructuredText parseText format ["<t size='1.2' align='center' color='%1'>%2</t>", hColNar, _texto];

_txt ctrlSetPosition [(ctrlPosition _txt) select 0, (ctrlPosition _txt) select 1, (ctrlPosition _txt) select 2, (ctrlTextHeight _txt) + 0.03];
_txt ctrlCommit 0;



// ***********************
// Ajuste posiciones
// ***********************



_altoTxt = (ctrlTextHeight _txt) + 0.096; // 0.048 por línea
_grp ctrlSetPosition [ctrlPosition _grp select 0, ctrlPosition _grp select 1, ctrlPosition _grp select 2, _altoTxt]; // ajusto el alto del grupo con el alto del texto // antes multiplicaba _altoTxt * 2
_grp ctrlCommit 0;
_fondo ctrlSetPosition [ctrlPosition _grp select 0, ctrlPosition _grp select 1, ctrlPosition _grp select 2, ctrlPosition _grp select 3]; // hago el fondo igual que el grupo
_fondo ctrlCommit 0;

_espaciado = (ctrlPosition _fondo select 2) - (ctrlPosition _b1 select 2) - (ctrlPosition _b2 select 2); // anchoFondo - anchoB1 - anchoB2

_b1 ctrlSetPosition [
	ctrlPosition _fondo select 0,
	(ctrlPosition _fondo select 1) + (ctrlPosition _fondo select 3), // yFondo + altoFondo
	(ctrlPosition _b1 select 2) + _espaciado, // anchoB1 + espacio
	ctrlPosition _b1 select 3
];
_b1 ctrlCommit 0;

_b2 ctrlSetPosition [
	(ctrlPosition _fondo select 0) + (ctrlPosition _b1 select 2), // xFondo + anchoB1
	(ctrlPosition _fondo select 1) + (ctrlPosition _fondo select 3), // yFondo + altoFondo
	ctrlPosition _b2 select 2,
	ctrlPosition _b2 select 3
];
_b2 ctrlCommit 0;



// ***********************
// Botones
// ***********************

_botonesVisibles = [];


if (_textoB1 isEqualTo false) then { // oculto izq (verde)
	_b1 ctrlSetFade 1;
	_b1 ctrlEnable false;
	_b1 ctrlCommit 0;
	
	_b2 ctrlSetPosition [ctrlPosition _b1 select 0, ctrlPosition _b1 select 1, ctrlPosition _fondo select 2, ctrlPosition _b1 select 3]; // xywh
	_b2 ctrlCommit 0;
	
} else {
	_b1 ctrlSetText _textoB1;
	_botonesVisibles pushBack _b1;
};

if (_textoB2 isEqualTo false) then { // oculto der (rojo)
	_b2 ctrlSetFade 1;
	_b2 ctrlEnable false;
	_b2 ctrlCommit 0;
	
	_b1 ctrlSetPosition [ctrlPosition _b1 select 0, ctrlPosition _b1 select 1, ctrlPosition _fondo select 2, ctrlPosition _b1 select 3]; // xywh
	_b1 ctrlCommit 0;
	
} else {
	_b2 ctrlSetText _textoB2;
	_botonesVisibles pushBack _b2;
};


if ((_textoB1 isEqualTo false) AND (_textoB2 isEqualTo false)) then { // seguro anti-bloqueo
	_b2 ctrlSetFade 0;
	_b2 ctrlEnable true;
	_b2 ctrlCommit 0;
	_b2 ctrlSetText "";
};



if (_delay > 0) then {
	
	{
		_x ctrlEnable false;
		_x ctrlSetFade 0.5;
		_x ctrlCommit 0;
		
		_x ctrlSetFade 0;
		_x ctrlCommit _delay;		
		
	} forEach _botonesVisibles;
	
	
	sleep _delay;
	
	
	{
		_x ctrlEnable true;
	} forEach _botonesVisibles;	
	
	
};



_b1 ctrlAddEventHandler ["ButtonClick", {confirmacion = true; closeDialog 0}];
_b2 ctrlAddEventHandler ["ButtonClick", {confirmacion = false; closeDialog 0}];



if !(canSuspend) then { // NSE
	
	0 spawn {
		waitUntil {sleep 0.2; !isNil "confirmacion"};
	};
	
} else { // SE
	
	waitUntil {sleep 0.2; !isNil "confirmacion"};

	confirmacion
	
};
