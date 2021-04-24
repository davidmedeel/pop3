
/*
por: Icaruk
	["entrego"] call ica_fnc_entregaPaquete;
*/

_param = _this select 0;
// El classname es del objeto que se transporta
_class = "pop_correos"; // PENDIENTE

if (_param isEqualTo "entrego") exitWith {
	
	if (([_class] call ica_fnc_tengo) == 0) exitWith {hint "No tienes ningún paquete que entregarme"};
	
	[_class, -1] call ica_fnc_item;
	[format ["- %1", [_class] call ica_fnc_classToName]] call ica_fnc_infolog;
    // regalito es lo que te va  a dar a la entrega configurar class y el numero que nos dara .
	_regalito = [["pop_tela"], ["pop_cristal", 1], ["pop_hierro_r", 1]] call BIS_fnc_selectRandom; // PENDIENTE
	_n = if ((count _regalito) > 1) then {_regalito select 1} else {1};
	
	_regalito call ica_fnc_item;
	[format ["+ %1", [_class] call ica_fnc_classToName]] call ica_fnc_infolog;	
};
