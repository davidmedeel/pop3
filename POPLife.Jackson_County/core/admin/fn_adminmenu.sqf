
#include <macro.h>

if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};

if (dialog) exitWith {};

private["_display","_list","_side"];

createDialog "life_admin_menu";

disableSerialization;

waitUntil {!isNull (findDisplay 2900)};

while {!(isNull (findDisplay 2900))} do {
if (isNull (findDisplay 2900)) exitWith{};
_display = findDisplay 2900;
_list = _display displayCtrl 2902;

_titulo = _display displayCtrl 1001;

_botonServicio = _display displayCtrl 5908;

_titulo ctrlSetText format ["Panel de Administración - Plata o Plomo || Jugadores: %1 / %2",count playableUnits, count allplayers];

if (deServicio == 1) then {
	_botonServicio ctrlSetText "Salir de Servicio";
} else {
	_botonServicio ctrlSetText "Entrar de Servicio";
};

_txt = ctrlText (_display displayCtrl 1400);
if((_txt != '') && (_txt != 'Buscar jugador')) then {
	_txt = toLower _txt;
	lbClear _list;
	{
	_nombre = _x getVariable["realname",name _x];
	if((toLower _nombre) find _txt > -1) then {
		_side = switch(side _x) do {case west: {"Policia"}; case civilian : {"Civil"}; case independent : {"EMS"}; default {"Unknown"};};
		_list lbAdd format["%1 - %2", _x getVariable["realname",name _x],_side];
		_list lbSetdata [(lbSize _list)-1,str(_x)];
	};
	} foreach playableUnits;
	lbSort [_list, "ASC"];
	waitUntil {(ctrlText (_display displayCtrl 1400)) != _txt || (isNull (findDisplay 2900))};
};
if (_txt isEqualTo '' || _txt isEqualTo 'Buscar jugador') then {
	lbClear _list;

	{
		_side = switch(side _x) do {case west: {"Policia"}; case civilian : {"Civil"}; case independent : {"EMS"}; default {"Unknown"};};
		_list lbAdd format["%1 - %2", _x getVariable["realname",name _x],_side];
		_list lbSetdata [(lbSize _list)-1,str(_x)];
	} foreach playableUnits;
	lbSort [_list, "ASC"];
	waitUntil {(ctrlText (_display displayCtrl 1400)) != '' || (isNull (findDisplay 2900)) || (ctrlText (_display displayCtrl 1400)) != 'Buscar jugador'};
};
uiSleep 0.1;
};

if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};
