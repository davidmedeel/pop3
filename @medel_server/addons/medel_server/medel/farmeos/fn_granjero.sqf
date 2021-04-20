
/*
por: Medel
*/

_param = param [0];

if (_param isEqualTo "Init") exitWith {

  _npc = Tractores;

  player setvariable ["trabajo_granjero_activo",0,true];
  player setvariable ["pagar_granjero",0,true];
  player setvariable ["devolver_tractor",0,true];

  _npc addAction ["Empezar Trabajo",{["solicito"] spawn ica_fnc_granjero;},[],1.5,true,true,"","(playerside isEqualTo civilian)",5,false,"",""];
  _npc addAction ["Cobrar",{["cobrarTrabajo"] spawn ica_fnc_granjero;},[],1.0,true,true,"","(playerside isEqualTo civilian)",5,false,"",""];
  _npc addAction ["Devolver Tractor",{["fianza"] spawn ica_fnc_granjero;},[],0.5,true,true,"","(playerside isEqualTo civilian)",5,false,"",""];
};

if (_param isEqualTo "trabajo") exitWith {

	_trabajando = player getvariable "trabajo_granjero_activo";

	if (_trabajando > 0) exitwith {};

	player setvariable ["trabajo_granjero_activo",1,true];

	_tiempo = (60 * 10);

	hint "Todo listo, ve a arar la tierra, cuando hayas cumplido tu cuota vuelve y serás recompensado.";

	sleep 1;

	_veh = nearestObject [player, "pop_tractor"];

	_metrosTotal = _veh distance getMarkerPos "granjero_ruta_9";

	_destinoIndex = 1;

	_destino = format ["granjero_ruta_%1", _destinoIndex];

	_metros_entregar = _veh distance getMarkerPos _destino;

	_flechaDir = "Sign_Arrow_Direction_F" createVehicleLocal (position _veh);
	_flechaDir attachTo [_veh, [0,0,2.2]];
	_fromTo = ((position  _veh ) vectorFromTo (getMarkerPos _destino)); 
	_flechaDir setDir ((_fromTo select 0) atan2 (_fromTo select 1)) - (getDir _veh);

	while {_tiempo > 0} do {
		_posDestino = getMarkerPos _destino;
		_metros =  _veh distance _posDestino;

		_metros_entregar = _veh distance getMarkerPos _destino;

		_fromTo = ((position  _veh ) vectorFromTo _posDestino); 
		_flechaDir setDir ((_fromTo select 0) atan2 (_fromTo select 1)) - (getDir _veh);

		sleep 1;
		_tiempo = _tiempo - 1;

		hintSilent parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>GRANJERO<br/><t color='#21618C'><t size='1.2'><t align='center'>Tiempo: %1s<br/>Próximo Destino: %2 metros</t>", _tiempo, round (_metros)];

	if !(alive player) then {
		_tiempo = 0;
	};

	if (_metros < 20) then {
		_destinoIndex = _destinoIndex + 1;
		_destino = format ["granjero_ruta_%1", _destinoIndex];
		_posDestino = getMarkerPos _destino;
		_metros = _veh distance _posDestino;
	};

	if (_tiempo <= 0) then {
		hint "Que tío más lento, no te pagaremos nada por tu trabajo, vuelve a empezar la ruta holgazán.";
		player setvariable ["trabajo_granjero_activo",0,true];
	};

	if (_destinoIndex isEqualTo  10) then {
		hint "Buen trabajo, ya puedes ir a cobrar.";

		_destino = "trabajoGranjero";

		player setvariable ["pagar_granjero",1,true];

		_tiempo = 0;
		};
  	};
};

if (_param isEqualTo "cobrarTrabajo") exitWith {

	if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno,por favor"};
	
	if ((player getvariable "pagar_granjero") isEqualTo 0) exitwith {hint "Trabaja primero, ¿Qué te crees que eres Político?"};

	if ((player getvariable "pagar_granjero") > 0) exitwith {
		hint "Fantástico, has trabajado duro, aquí tienes tu recompensa.";
		
		_veh = nearestObject [player, "pop_tractor"];

		{
			detach _x;
			deletevehicle _x;
		} forEach attachedObjects _veh;

		["pop_cajaalimentos", 8] call ica_fnc_item;	
		["+8 Cajas de Alimento"] call ica_fnc_infolog;
					
		_pago = 15000;

		medel_din = medel_din + medel_dsin_pago;

		["exp", 3] call ica_fnc_arrayEXP;

		player setvariable ["pagar_granjero",0,true];
		player setvariable ["trabajo_granjero_activo",0,true];
		player setvariable ["devolver_tractor",1,true];

		[format ["+ %1 €",_pago]] call ica_fnc_infolog;
	};
};

if (_param isEqualTo "solicito") exitWith {

	if ((count (nearestObjects [player, ["man"], 4]))>1) exitwith {hint "De uno en uno, por favor"};

	if ((count (nearestObjects [(getMarkerPos "trabajoGranjero"), ["Car_F"], 5]))>1) exitwith {hint "Hay un vehiculo ocupando el spawn"};

	if (medel_din < 5000) exitwith {hint "La fianza del tractor son 5.000€"};

	medel_din = medel_din - 5000;

	_veh = "pop_tractor" createvehicle (getMarkerPos "trabajoGranjero");

	clearItemCargoGlobal _veh;

	player setvariable ["pagar_granjero",0,true];
	player setvariable ["devolver_tractor",0,true];

	_veh setvariable ["propietario",name player,true];

	player setvariable ["uniforme",uniform player,true];
	player adduniform "rds_uniform_Villager2";

	player moveInDriver _veh;

	["trabajo"] spawn ica_fnc_granjero;
};

if (_param isEqualTo "fianza") exitWith {

	if ((player getvariable "devolver_tractor") isEqualTo 0) exitwith {hint "Para devolver el tractor primero tienes que cobrar."};

	if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor"};

	_veh = nearestObject [player, "pop_tractor"];

	if (isnil "_veh") exitwith {hint "No veo cerca ningún tractor"};

	if ((player distance _veh)>10) exitwith {hint "Acerca el tractor"};

	_propietario = _veh getvariable "propietario";

	if (name player != _propietario) exitwith {hint "Este tractor no esta registrado a tu nombre."};

	deletevehicle _veh;

	player setvariable ["devolver_tractor",0,true];

	_uniforme = player getvariable "uniforme";
	player adduniform _uniforme;

	_fianza = 5000;

	medel_din = medel_din + medel_dsin_fianza;
	[format ["+ %1 €", _fianza]] call ica_fnc_infolog;

	hint "Todo listo, el tractor está guardado en el garage, vuelve a por más trabajo cuando quieras.";
};
