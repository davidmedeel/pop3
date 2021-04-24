
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
	["cartera", "Añadir Cartera"],
	["banco", "Añadir Banco"]
]] call ica_fnc_eligeDato;

if (_dato isEqualTo "") exitWith {};

if (_dato isEqualTo "cartera") exitWith {

	_din = ["Introduce la cantidad que quieres darte en efectivo:"] call ica_fnc_meteDato;
	_din = round (parseNumber _din);

	if (_din isEqualTo 0) exitWith {["decorado", "AVISO", "No es una cantidad válida"] spawn ica_fnc_hint; closeDialog 0;};

	if (_din > 999999) exitWith {["decorado", "AVISO", "No puedes darte más de 999.999€ a la vez"] spawn ica_fnc_hint; closeDialog 0;};

	if (_din > 0) then {
		hintSilent parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>ADMIN<br/><t color='#21618C'><t size='1.2'><t align='center'>Te has dado %1€ en efectivo.</t>", _din];
		["añado", _din, false] remoteexec ["ica_fnc_gesDinero", player];
		["Admin Log",format ["%1 - (%2) se ha dado %3 en efectivo",profileName,(getPlayerUID player), _din]] remoteexeccall ["ica_fnc_customlog",2];
		closeDialog 0;
	};
};

if (_dato isEqualTo "banco") exitWith {

	_din = ["Introduce la cantidad que quieres darte en el banco:"] call ica_fnc_meteDato;
	_din = round (parseNumber _din);

	if (_din isEqualTo 0) exitWith {["decorado", "AVISO", "No es una cantidad válida"] spawn ica_fnc_hint; closeDialog 0;};

	if (_din > 999999) exitWith {["decorado", "AVISO", "No puedes darte más de 999.999€ a la vez"] spawn ica_fnc_hint; closeDialog 0;};

	if (_din > 0) then {
		hintSilent parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>ADMIN<br/><t color='#21618C'><t size='1.2'><t align='center'>Te has dado %1€ en tu cuenta bancaria.</t>", _din];
		["añado", _din, true] remoteexec ["ica_fnc_gesDinero", player];
		["Admin Log",format ["%1 - (%2) se ha dado %3 en su cuenta bancaria",profileName,(getPlayerUID player), _din]] remoteexeccall ["ica_fnc_customlog",2];
		closeDialog 0;
	};
};
