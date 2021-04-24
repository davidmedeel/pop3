
/*
por: Icaruk

Params:
	0: STRING - Texto a mostrar.
	1: STRING (opc) - Nombre del elemento 0. Usando "" no aparecerá el elemento 0 y el primer elemento real empezará seleccionado.
	2: ARRAY
		0: STRING - Dato.
		1: STRING (opc) - Nombre visual del dato. Default dato.
		
	3: BOOL (opc) - Blur. Default true.
	
Ejemplos:
	_dato = ["Elige algo de la lista.<br/>Ten en cuenta que X.", "Selecciona un elemento", [["1", "Visual 1"], ["2", "Visual 2"], ["3", "Visual 3"]]] call ica_fnc_eligeDato;
	_dato = ["Elige algo de la lista.<br/>Ten en cuenta que X.", "", [["1", "Visual 1"], ["2", "Visual 2"], ["3", "Visual 3"]]] call ica_fnc_eligeDato;
	_dato = ["Elige algo de la lista.<br/>Ten en cuenta que X.", "", [["1"], ["2"], ["3"]]] call ica_fnc_eligeDato;
	
Return:
	"" si has cancelado, el dato que hayas seleccionado si has aceptado.
	
NOTA: La tecla ESC está bloqueada.
NOTA2: Tiene que estar en SE para que haga el waitUntil llamando desde un call.

*/


// if !(canSuspend) exitWith {["Se necesita SE."] call BIS_fnc_error};


eligeDato = nil;

private _texto = param [0, "Introduce un dato:"];
private _textoIni = param [1, "Selecciona un elemento"];
private _valores = param [2, [["nada", "Nada"]]];
private _blur = param [3, true];


if (_blur) then {
	[0.5, -1] spawn ica_fnc_blur;
};

disableSerialization;
createDialog "eligeDato";
_ui = uiNamespace getVariable "eligeDato";

private _fondo = _ui displayCtrl 6380;
private _txt = _ui displayCtrl 6381;
private _desplegable = _ui displayCtrl 6382;
private _b1 = _ui displayCtrl 6383;



// config inicial
_fondo ctrlAddEventHandler ["Destroy", {if (isNil "eligeDato") then {eligeDato = ""}}];
_fondo ctrlEnable false;
_txt ctrlEnable false;
ctrlSetFocus _desplegable;


// ***********************
// Texto y valores
// ***********************

_txt ctrlSetStructuredText parseText format ["<t size='1.2' align='center' color='#fffff'>%1</t>", _texto];


if !(_textoIni isEqualTo "") then {
	_desplegable lbAdd _textoIni;
	_desplegable lbSetData [0, ""];
};

{
	_visual = _x param [1, _x select 0];
	
	_desplegable lbAdd _visual;
	_idx = (lbSize _desplegable) - 1;
	_desplegable lbSetData [_idx, _x select 0];
	//_desplegable lbSetToolTip [_idx, _visual];
	
} forEach _valores;

_desplegable lbSetCurSel 0;



// ***********************
// Botones
// ***********************

_b1 ctrlSetText "Aceptar";



// *****************************
// Ajuste automático de altura
// *****************************

_difYedit = (
	((ctrlPosition _fondo select 1) + (ctrlPosition _fondo select 3)) - // yFondo
	((ctrlPosition _desplegable select 1) + (ctrlPosition _desplegable select 3))	// yEdit
); // diferencia de la Y del texto y la del edit
	
private _altoTxt = (ctrlTextHeight _txt) + 0.096; // 0.048 por línea



_fondo ctrlSetPosition [ // ajusto el alto del fondo con el alto del texto
	ctrlPosition _fondo select 0,
	ctrlPosition _fondo select 1,
	ctrlPosition _fondo select 2,
	_altoTxt + (ctrlPosition _desplegable select 3)
];
_fondo ctrlCommit 0;


_txt ctrlSetPosition [ // ajusto el alto del fondo con el alto del texto
		ctrlPosition _txt select 0,
		ctrlPosition _txt select 1,
		ctrlPosition _txt select 2,
		_altoTxt
	];
_txt ctrlCommit 0;


_desplegable ctrlSetPosition [ // ajusto el alto del fondo con el alto del texto
		ctrlPosition _desplegable select 0,
		(ctrlPosition _fondo select 1) + (ctrlPosition _fondo select 3) - (ctrlPosition _desplegable select 3) - _difYedit,
		ctrlPosition _desplegable select 2,
		ctrlPosition _desplegable select 3
	];
_desplegable ctrlCommit 0;


_b1 ctrlSetPosition [
	ctrlPosition _b1 select 0,
	(ctrlPosition _fondo select 1) + (ctrlPosition _fondo select 3),
	ctrlPosition _b1 select 2,
	ctrlPosition _b1 select 3
];
_b1 ctrlCommit 0;

// ***********************
// Empiezo
// ***********************

_b1 ctrlAddEventHandler ["ButtonClick", {
	
	disableSerialization;
	_desplegable = (uiNamespace getVariable "eligeDato") displayCtrl 6382;
	eligeDato =  _desplegable lbData (lbCurSel _desplegable);
	
	closeDialog 0
}];



if !(canSuspend) then { // NSE
	
	0 spawn {
		waitUntil {sleep 0.2; !isNil "eligeDato"};
		[-1, 0.5] spawn ica_fnc_blur;		
	};
	
} else { // SE
	
	waitUntil {sleep 0.2; !isNil "eligeDato"};
	[-1, 0.5] spawn ica_fnc_blur;

	eligeDato
	
};





