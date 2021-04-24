
/*
por: Medel
*/

#include "..\..\script_macros.hpp"

if (FETCH_CONST(life_adminlevel) < 3) exitWith {
	closeDialog 0;
	hint parsetext
	"<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
	<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes suficiente nivel de admin</t>"
};

_dato = ["Elige una Opción", "", [
	["dar", "Dar Dinero"],
	["quitar", "Quitar Dinero"]
]] call ica_fnc_eligeDato;

if (_dato isEqualTo "") exitWith {};

if (_dato isEqualTo "dar") exitWith {

	_jugador = ["Introduce el nombre del jugador al que quieres añadir dinero en el banco:"] call ica_fnc_meteDato;
	if (_jugador isEqualTo "") exitWith {};

	_tio = [_jugador, "nombre"] call ica_fnc_online;
	if (isNull _tio) exitWith {["decorado", "AVISO", "El jugador tiene que estar online"] spawn ica_fnc_hint; closeDialog 0;};

	_din = ["Introduce la cantidad a añadir en el banco del jugador:"] call ica_fnc_meteDato;
	_din = round (parseNumber _din);

	if (_din isEqualTo 0) exitWith {["decorado", "AVISO", "No es una cantidad válida"] spawn ica_fnc_hint; closeDialog 0;};

	if (_din > 999999) exitWith {["decorado", "AVISO", "No puedes dar más de 999.999€ a la vez"] spawn ica_fnc_hint; closeDialog 0;};

	if (_din > 0) then {
		_nombre = name _tio;
		hintSilent parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>ADMIN<br/><t color='#21618C'><t size='1.2'><t align='center'>Le has dado a %2 %1€ en su cuenta bancaria.</t>", _din, _nombre];
		["añado", _din, true] remoteexec ["ica_fnc_gesDinero", _tio];
		parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>AVISO<br/><t color='#21618C'><t size='1.2'><t align='center'>Un admin te ha dado %1€ en tu cuenta bancaria.</t>", _din] remoteExec ["hint", _tio];
		["Admin Log",format ["%1 - (%2) ha dado %3 a %4 en su cuenta bancaria",profileName,(getPlayerUID player), _din, _tio]] remoteexeccall ["ica_fnc_customlog",2];
		closeDialog 0;
	};
};

if (_dato isEqualTo "quitar") exitWith {

	_jugador = ["Introduce el nombre del jugador al que quieres quitar dinero del banco:"] call ica_fnc_meteDato;
	if (_jugador isEqualTo "") exitWith {};

	_tio = [_jugador, "nombre"] call ica_fnc_online;
	if (isNull _tio) exitWith {["decorado", "AVISO", "El jugador tiene que estar online"] spawn ica_fnc_hint; closeDialog 0;};

	_din = ["Introduce la cantidad para quitar del banco del jugador:"] call ica_fnc_meteDato;
	_din = round (parseNumber _din);

	if (_din isEqualTo 0) exitWith {["decorado", "AVISO", "No es una cantidad válida"] spawn ica_fnc_hint; closeDialog 0;};

	if (_din > 999999) exitWith {["decorado", "AVISO", "No puedes quitar más de 999.999€ a la vez"] spawn ica_fnc_hint; closeDialog 0;};

	if (_din > 0) then {
		_nombre = name _tio;
		hintSilent parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>ADMIN<br/><t color='#21618C'><t size='1.2'><t align='center'>Le has quitado a %2 %1€ de su cuenta bancaria.</t>", _din, _nombre];
		["quito", _din, true] remoteexec ["ica_fnc_gesDinero", _tio];
		parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>AVISO<br/><t color='#21618C'><t size='1.2'><t align='center'>Un admin te ha quitado %1€ de tu cuenta bancaria.</t>", _din] remoteExec ["hint", _tio];
		["Admin Log",format ["%1 - (%2) ha quitado %3 a %4 de su cuenta bancaria",profileName,(getPlayerUID player), _din, _tio]] remoteexeccall ["ica_fnc_customlog",2];
		closeDialog 0;
	};
};
