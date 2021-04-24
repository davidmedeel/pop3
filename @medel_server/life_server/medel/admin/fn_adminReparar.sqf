
/*
por: Medel
*/

#include "..\..\script_macros.hpp"

if (FETCH_CONST(life_adminlevel) < 1) exitWith {
	closeDialog 0;
	hint parsetext
	"<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
	<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes suficiente nivel de admin</t>";
};

if (deServicio == 0) exitwith {hint "No estás de servicio";};

	if !(vehicle player isEqualTo player) then {
				
	(vehicle player) setDamage 0;

    hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>ADMIN<br/><t color='#21618C'><t size='1.2'><t align='center'>Has reparado tu vehículo</t>";

	} else {

	_nReparados = 0;

	_arrObjs = nearestTerrainObjects [player, [], 20];
		{
			if !(isPlayer _x) then {
				if ((_x getVariable ["matricula", ""]) isEqualTo "") then {
					if !((damage _x) isEqualTo 0) then {
						_x setDamage 0;
					_nReparados = _nReparados + 1;
				};
            };
		};
	} forEach _arrObjs;

    hint parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>AVISO<br/><t color='#21618C'><t size='1.2'><t align='center'>Has reparado %1 elementos en un radio de 20 metros.</t>", _nReparados];
};

["Admin Log",format ["%1 - (%2) ha utilizado la funcion reparar objetos",profileName,(getPlayerUID player)]] remoteexeccall ["ica_fnc_customlog",2];
