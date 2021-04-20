
/*
por: Icaruk

Params:
	0: STRING - Texto a mostrar.
	1: STRING - Texto que estará en el edit.
	2: BOOL (opc) - Blur. Default true.
	3: SCALAR (opc) - Límite de chars en el output. Default -1 (desactivado).
	
Ejemplos:	
	_dato = ["Escribe un nombre para la tienda.<br/>No puede superar los 40 caracteres.", "Nombre"] call ica_fnc_meteDato;
	_dato = ["Escribe un nombre para la tienda.<br/>No puede superar los 40 caracteres.", "Nombre", false] call ica_fnc_meteDato; // sin blur
	_dato = ["Escribe un nombre para la tienda.<br/>No puede superar los 40 caracteres.", "Nombre", nil, 40] call ica_fnc_meteDato; // limitado a 40 chars
	
Return:
	"" si has cancelado, lo que hayas escrito si has aceptado.
	
Info:
	La tecla ESC está bloqueada.
	Tiene que estar en SE para que haga el waitUntil llamando desde un call.
	
*/


// if !(canSuspend) exitWith {["Se necesita SE."] call BIS_fnc_error};


meteDato = nil;

private _texto = param [0, "Introduce un dato:"];
private _txtIni = param [1, ""];
private _blur = param [2, true];
private _nLimite = param [3, -1];


if (_blur) then {
	[0.2, -1] spawn ica_fnc_blur;
};


if !(_txtIni isEqualType "") then {
	_txtIni = str _txtIni;
};



disableSerialization;
createDialog "meteDato";
_ui = uiNamespace getVariable "meteDato";

private _fondo = _ui displayCtrl 6380;
private _txt = _ui displayCtrl 6381;
private _edit = _ui displayCtrl 6382;
private _b1 = _ui displayCtrl 6383;
private _b2 = _ui displayCtrl 6384;


// config inicial
_fondo ctrlEnable false;
ctrlSetFocus _edit;


// ***********************
// Texto
// ***********************

_txt ctrlSetStructuredText parseText format ["<t size='1.2' align='center' color='#fffff'>%1</t>", _texto];
_edit ctrlSetText _txtIni;

// ***********************
// Botones
// ***********************

_b1 ctrlSetText "Aceptar";
_b2 ctrlSetText "Cancelar";

// *****************************
// Ajuste automático de altura
// *****************************

private _difYedit = (
	((ctrlPosition _fondo select 1) + (ctrlPosition _fondo select 3)) - // yFondo
	((ctrlPosition _edit select 1) + (ctrlPosition _edit select 3))	// yEdit
); // diferencia de la Y del texto y la del edit
	
private _altoTxt = (ctrlTextHeight _txt) + 0.096; // 0.048 por línea



_fondo ctrlSetPosition [ // ajusto el alto del fondo con el alto del texto
	ctrlPosition _fondo select 0,
	ctrlPosition _fondo select 1,
	ctrlPosition _fondo select 2,
	_altoTxt + (ctrlPosition _edit select 3)
];
_fondo ctrlCommit 0;


_txt ctrlSetPosition [ // ajusto el alto del fondo con el alto del texto
		ctrlPosition _txt select 0,
		ctrlPosition _txt select 1,
		ctrlPosition _txt select 2,
		_altoTxt
	];
_txt ctrlCommit 0;


_edit ctrlSetPosition [ // ajusto el alto del fondo con el alto del texto
		ctrlPosition _edit select 0,
		(ctrlPosition _fondo select 1) + (ctrlPosition _fondo select 3) - (ctrlPosition _edit select 3) - _difYedit,
		ctrlPosition _edit select 2,
		ctrlPosition _edit select 3
	];
_edit ctrlCommit 0;


_b1 ctrlSetPosition [
	ctrlPosition _b1 select 0,
	(ctrlPosition _fondo select 1) + (ctrlPosition _fondo select 3),
	ctrlPosition _b1 select 2,
	ctrlPosition _b1 select 3
];
_b1 ctrlCommit 0;


_b2 ctrlSetPosition [
	ctrlPosition _b2 select 0,
	(ctrlPosition _fondo select 1) + (ctrlPosition _fondo select 3),
	ctrlPosition _b2 select 2,
	ctrlPosition _b2 select 3
];
_b2 ctrlCommit 0;






// ***********************
// Empiezo
// ***********************

_b1 ctrlAddEventHandler ["ButtonClick", {
	meteDato = ctrlText ((uiNamespace getVariable "meteDato") displayCtrl 6382);
	closeDialog 0
}];
_b2 ctrlAddEventHandler ["ButtonClick", {
	meteDato = "";
	closeDialog 0
}];



if !(canSuspend) then { // NSE
	
	0 spawn {
		waitUntil {sleep 0.2; !isNil "meteDato"};
		[-1, 0.4] spawn ica_fnc_blur;	
	};
	
} else { // SE
	
	waitUntil {sleep 0.2; !isNil "meteDato"};
	[-1, 0.4] spawn ica_fnc_blur;
	
	
	// Limitado
	if !(_nLimite isEqualTo -1) then {
		if (count meteDato > _nLimite) then {
			meteDato select [0, _nLimite];
			hint parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>AVISO<br/><t color='#21618C'><t size='1.2'><t align='center'>Se ha recortado el texto porque superaba el límite de caracteres de %1</t>", _nLimite];
		};
	};
	
	
	
	meteDato
	
};
