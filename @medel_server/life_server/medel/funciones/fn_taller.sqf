
/*
por: Medel
*/

#include "..\..\script_macros.hpp"

_param = param[0];

_zona = Zona_1;

_grupo = _zona getVariable "owner";

if (_param isEqualTo "Init") exitWith {

    _npc = NPC_MEDEL_TALLER;

    _npc addAction
    [
        "<t size='1.5' color='#DE2828'>Cambiar propietario del vehículo<t\>",
        {
            ["load"] spawn ica_fnc_taller;
        },
        [],
        1.4,
        true,
        true,
        "",
        "(playerside isEqualTo civilian)",
        5,
        false,
        "",
        ""
    ];

    _npc addAction
    [
        "<t size='1.5' color='#21618C'>Falsificar carnet de identidad<t\>",
        {
            ["init"] spawn ica_fnc_nombreFake;
        },
        [],
        1.5,
        true,
        true,
        "",
        "(playerside isEqualTo civilian)",
        5,
        false,
        "",
        ""
    ];
};

if (_param isEqualTo "load") exitWith {
	if (FETCH_CONST(life_donator) > 0) then {
		["usarTallerDonador"] spawn ica_fnc_taller;
	} else {
		["usarTallerNormal"] spawn ica_fnc_taller;
	}
};

if (_param isEqualTo "usarTallerNormal") exitWith {
	_precio = 25000;
	_npc = NPC_MEDEL_TALLER;

	if !(_grupo isEqualTo group player) exitWith {
		hint parseText "<t size = ""2"" color=""#DE2828"" align='center'>AVISO <br/><t size = ""1"" color=""#21618C"" align='left'>Tu Mafia no tiene el control de esta zona</t></t>";
	};

	if (medel_din < _precio) exitwith { hint parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>AVISO<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes %1€.</t>", _precio]; };

	_veh = (nearestObjects [_npc, ["air","car"],20] select 0);

	if (isNil {_veh}) exitWith {
        hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>AVISO<br/><t color='#21618C'><t size='1.2'><t align='center'>No hay ningún vehículo cerca</t>";
    };

	_nombre = ["Introduce el nuevo nombre que quieres tener falsificado (El apellido se le pedirá en el siguiente paso) :"] call ica_fnc_meteDato;

	if (_nombre isEqualTo "") exitWith {["decorado", "AVISO", "Escoge un nombre"] spawn ica_fnc_hint; closeDialog 0;};

	_apellido = ["Introduce el apellido de tu nombre falsificado:"] call ica_fnc_meteDato;

	if (_apellido isEqualTo "") exitWith {["decorado", "AVISO", "Escoge un apellido"] spawn ica_fnc_hint; closeDialog 0;};

	medel_din = medel_din - _precio;
	[format ["- %1€", _precio]] call ica_fnc_infolog;

	[20, "Cambiando titular del vehículo..."] spawn ica_fnc_barrita;
	sleep 20;

	_nameVeh = _nombre +" "+ _apellido;

	_uid = getPlayerUID player;
	_infoOwner = [[_uid,_nameVeh]];

	_veh setVariable ["vehicle_info_owners",_infoOwner,true];

	_veh setDamage 0;

	hint parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>AVISO<br/><t color='#21618C'><t size='1.2'><t align='center'>Todo listo, el nombre falso de tu matricula es %1, gracias por confiar en los talleres Medel.</t>", _nameVeh];
};

if (_param isEqualTo "usarTallerDonador") exitWith {
	_precio = 15000;
	_npc = NPC_MEDEL_TALLER;

    if (FETCH_CONST(life_donator) < 1) exitWith {};

	if (medel_din < _precio) exitwith { hint parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>AVISO<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes %1€.</t>", _precio]; };

	_veh = (nearestObjects [_npc, ["air","car"],20] select 0);

	if (isNil {_veh}) exitWith {
        hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>AVISO<br/><t color='#21618C'><t size='1.2'><t align='center'>No hay ningún vehículo cerca</t>";
    };

	_nombre = ["Introduce el nuevo nombre del titular del vehículo (El apellido se le pedirá en el siguiente paso) :"] call ica_fnc_meteDato;

	if (_nombre isEqualTo "") exitWith {["decorado", "AVISO", "Escoge un nombre"] spawn ica_fnc_hint; closeDialog 0;};

	_apellido = ["Introduce el nuevo apellido del titular del vehiculo:"] call ica_fnc_meteDato;

	if (_apellido isEqualTo "") exitWith {["decorado", "AVISO", "Escoge un apellido"] spawn ica_fnc_hint; closeDialog 0;};

	medel_din = medel_din - _precio;
	[format ["- %1€", _precio]] call ica_fnc_infolog;

	[20, "Cambiando titular del vehículo..."] spawn ica_fnc_barrita;
	sleep 20;

	_nameVeh = _nombre +" "+ _apellido;

	_uid = getPlayerUID player;
	_infoOwner = [[_uid,_nameVeh]];

	_veh setVariable ["vehicle_info_owners",_infoOwner,true];

	_veh setDamage 0;

	hint parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>AVISO<br/><t color='#21618C'><t size='1.2'><t align='center'>Todo listo, el nombre falso de tu matricula es %1, gracias por confiar en los talleres Medel.</t>", _nameVeh];
};
