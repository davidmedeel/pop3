
/*
por: Medel
*/

#include "..\..\script_macros.hpp"

_param = param[0];

if (_param isEqualTo "Init") exitWith {

    _npc = NPC_MEDEL_TALLER;

    _npc addAction
    [
        "<t size='1.5'>Cambiar propietario del vehículo [25.000€]<t\>",
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
        "<t size='1.5'>Falsificar carnet de identidad [25.000€]<t\>",
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

if(_param isEqualTo "load") exitWith {
	if (FETCH_CONST(life_donator) > 0) then {
		["usarTallerDonador"] spawn ica_fnc_taller;
	} else {
		["usarTallerNormal"] spawn ica_fnc_taller;
	}
}

if (_param isEqualTo "usarTallerNormal") exitWith {
	_precio = 25000;

	//cheeks
	if (isNull objectParent player) exitWith {
		hint "Tienes que estar en un vehículo";
	};

	if (medel_din < _precio) exitwith {hint "El trabajo cuesta 50.000€"};

	//esta dentro del coche
	if (vehicle player != player) exitWith {

		//vars
		_vehicle = vehicle player;

		//quitar dinero
		medel_din = medel_din - _precio;
		[format ["- %1€", _precio]] call ica_fnc_infolog;

		//barrita de espera
		[10, "Cambiando titular del vehículo..."] spawn ica_fnc_barrita;
		sleep 10;

		_infoOwner = _nombre +" "+ _apellido;

		_infoOwner = getPlayerUID player;
		_infoOwner = [[_infoOwner,_infoOwner]];

		_vehicle setVariable ["vehicle_info_owners",_infoOwner,true];

		//reparar
		_vehicle  setDamage 0;

		//info al jugador
		_txt = format ["Todo listo, el nombre falso de tu matricula es %1, gracias por confiar en los talleres Medel", _infoOwner];
		titleText[_txt, "PLAIN"];
	};
};

if (_param isEqualTo "usarTallerDonador") exitWith {
	_precio = 15000;
    if (FETCH_CONST(life_donator) < 1) exitWith {};
	//cheeks
	if (isNull objectParent player) exitWith {
		hint "Tienes que estar en un vehículo";
	};

	//esta dentro del coche
	if (vehicle player != player) exitWith { 

	//vars
	_vehicle = vehicle player;

	//barrita de espera
	[10, "Cambiando titular del vehículo..."] spawn ica_fnc_barrita;
	sleep 10;

	_infoOwner = _nombre +" "+ _apellido;

	_infoOwner = getPlayerUID player;
	_infoOwner = [[_infoOwner,_infoOwner]];

	_vehicle setVariable ["vehicle_info_owners",_infoOwner,true];

	//reparar
	_vehicle setDamage 0;

	//info al jugador
	_txt = format ["Todo listo, el nombre falso de tu matricula es %1, gracias por confiar en los talleres Medel", _infoOwner];
	titleText[_txt, "PLAIN"];
	};
};
