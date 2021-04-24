
/*
por: Medel
*/

#include "..\..\script_macros.hpp"

_param = param[0];

_zona = Zona_1;

_grupo = _zona getVariable "owner";

if (_param isEqualTo "init") exitWith {
	if (FETCH_CONST(life_donator) > 0) then {
		["donador"] spawn ica_fnc_nombreFake;
	} else {
		["normal"] spawn ica_fnc_nombreFake;
	}
};

if(_param isEqualTo "normal") exitWith {
	_precio = 25000;

	if !(_grupo isEqualTo group player) exitWith {
		hint parseText "<t size = ""2"" color=""#DE2828"" align='center'>AVISO <br/><t size = ""1"" color=""#21618C"" align='left'>Tu Mafia no tiene el control de esta zona</t></t>";
	};

	if(nombreCambiado isEqualTo 1) exitWith { hint parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>AVISO<br/><t color='#21618C'><t size='1.2'><t align='center'>Sólo puedes falsificar tu DNI 1 vez por restart.</t>"]; };

	if (medel_din < _precio) exitwith { hint parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>AVISO<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes %1€.</t>", _precio]; };

	_nombre = ["Hugo","Martin","Lucas","Leo","Daniel","Alejandro","Pablo", "Manuel", "Alvaro", "Adrian","Mario","Diego","Marco","Javier","Juan","Victor","Alberto","Antonio","Akdabr", "Fernando", "Mark"] call BIS_fnc_selectRandom;
	_apellido = ["Garcia", "Costa", "Estrada", "Gonzalez","Rodriguez","Diaz","Moreno","Romero","Alonso","Serrano","Hamed","Garrido","Mendez","Peña","Pascual","Ferrer","Arias","Gallardo","Rojas", "Zuckerberg"] call BIS_fnc_selectRandom;

	_nuevoNombre = _nombre +" "+ _apellido;

	_confirmado = [format ["El precio de la falsificación del DNI son %1€ y sólo puedes falsificar tu DNI 1 vez por restart, este nombre solo será visible cuando enseñes tu DNI falsificado. ¿Estás seguro que quieres falsificar tu DNI?",_precio], "Sí", "No"] call ica_fnc_confirmacion;

	if (_confirmado) then {
		medel_din = medeL_din - _precio;
		[format ["- %1€", _precio]] call ica_fnc_infolog;
		nombreCambiado = 1;
		closeDialog 0;
		[20, "Actualizando papeles de la documentación..."] spawn ica_fnc_barrita;
		sleep 20;
		player setVariable["nombreFake", _nuevoNombre, true];
		//profileNamespace setVariable ["nombreFake", _nuevoNombre, true];
		hint parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>AVISO<br/><t color='#21618C'><t size='1.2'><t align='center'>Has falsificado tu documento de identificación correctamente tu nuevo DNI es %1</t>", _nuevoNombre];
	} else {
		player setVariable["nombreFake", nil, false];
		//profileNamespace setVariable ["nombreFake", nil, false];
		nombreCambiado = 0;
		closeDialog 0;
	};
};

if (_param isEqualTo "donador") exitWith {
	_precio = 15000;
	if (FETCH_CONST(life_donator) isEqualTo 0) exitWith {};

	if(nombreCambiado isEqualTo 1) exitWith { hint parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>AVISO<br/><t color='#21618C'><t size='1.2'><t align='center'>Sólo puedes falsificar tu DNI 1 vez por restart.</t>"]; };

	if (medel_din < _precio) exitwith { hint parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>AVISO<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes %1€.</t>", _precio]; };

	_nombre = ["Introduce el nuevo nombre que quieres tener falsificado (El apellido se le pedirá en el siguiente paso) :"] call ica_fnc_meteDato;

	if (_nombre isEqualTo "") exitWith {["decorado", "AVISO", "Escoge un nombre"] spawn ica_fnc_hint; closeDialog 0;};

	_apellido = ["Introduce el apellido de tu nombre falsificado:"] call ica_fnc_meteDato;

	if (_apellido isEqualTo "") exitWith {["decorado", "AVISO", "Escoge un apellido"] spawn ica_fnc_hint; closeDialog 0;};

	_nuevoNombre = _nombre +" "+ _apellido;

	_confirmado = [format ["Sólo puedes falsificar tu DNI 1 vez por restart, este nombre solo será visible cuando enseñes tu DNI falsificado. ¿Estás seguro que quieres falsificar tu DNI?",_precio], "Sí", "No"] call ica_fnc_confirmacion;

	if (_confirmado) then {
		medel_din = medeL_din - _precio;
		[format ["- %1€", _precio]] call ica_fnc_infolog;
		nombreCambiado = 1;
		closeDialog 0;
		[20, "Actualizando papeles de la documentación..."] spawn ica_fnc_barrita;
		sleep 20;
		player setVariable["nombreFake", _nuevoNombre, true];
		//profileNamespace setVariable ["nombreFake", _nuevoNombre, true];
		hint parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>AVISO<br/><t color='#21618C'><t size='1.2'><t align='center'>Has falsificado tu documento de identificación correctamente tu nuevo DNI es %1.</t>", _nuevoNombre];
	} else {
		player setVariable["nombreFake", nil, false];
		//profileNamespace setVariable ["nombreFake", nil, false];
		nombreCambiado = 0;
		closeDialog 0;
	};
};

if (_param isEqualTo "elegir") exitWith {
	_dniParam = ["Elige la documentación que quieres enseñar", "", [
		["dni", "DNI"],
		["dnif", "DNI Falsificado"]
	]] call ica_fnc_eligeDato;
	if (_dniParam isEqualTo "") exitWith {};
	if (_dniParam isEqualTo "dni") exitWith { [] call life_fnc_showDNI; };
	if (_dniParam isEqualTo "dnif") exitWith { [] call life_fnc_showdniFalso; };
};
