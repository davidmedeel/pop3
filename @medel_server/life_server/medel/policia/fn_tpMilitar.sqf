
/*
por: Medel
*/

#include "..\..\script_macros.hpp"

_param = param [0];

_noLvl = parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>AVISO<br/><t color='#21618C'><t size='1.2'><t align='center'>No eres Militar</t>";

if (_param isEqualTo "aeropuerto") exitWith {

	if (FETCH_CONST(life_coplevel) != 8) exitWith {
		hint _noLvl;
	};

	player setPos (getPos (aeropuerto));
};

if (_param isEqualTo "baseMilitar") exitWith {
	if (FETCH_CONST(life_coplevel) != 8) exitWith {
		hint _noLvl;
	};

	player setPos (getPos (baseMilitar));
};

if (_param isEqualTo "puerto") exitWith {
	if (FETCH_CONST(life_coplevel) != 8) exitWith {
		hint _noLvl;
	};

	player setPos (getPos (puerto));
};
