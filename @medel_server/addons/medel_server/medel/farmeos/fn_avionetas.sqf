
/*
por: Medel
*/

_param = param [0];

if (_param isEqualTo "Init") exitWith {

  _npc = npcavionetas;

  player setvariable ["trabajo_avioneta_activo",0,true];
  player setvariable ["pagar_avionetas",0,true];
  player setvariable ["paquete_entregado",0,true];

  _npc addAction ["Empezar Trabajo",{["solicito"] spawn ica_fnc_avionetas;},[],1.5,true,true,"","(playerside isEqualTo civilian)",5,false,"",""];
  _npc addAction ["Cobrar",{["cobro"] spawn ica_fnc_avionetas;},[],1.0,true,true,"","(playerside isEqualTo civilian)",5,false,"",""];
  _npc addAction ["Cancelar Trabajo",{["cancelo"] spawn ica_fnc_avionetas;},[],0.5,true,true,"","(playerside isEqualTo civilian)",5,false,"",""];
  _npc addAction ["Debug",{["debug"] spawn ica_fnc_avionetas;},[],0.5,true,true,"","(playerside isEqualTo civilian)",5,false,"",""];
};

_classNameAvioneta = "C_Plane_Civil_01_F";

_costeTrabajo = 10000;
_dineroRecompensa = 100000 + _costeTrabajo;

if (_param isEqualTo "solicito") exitWith {

  if (medel_din < _costeTrabajo) exitwith { hint parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>CARTERO<br/><t color='#21618C'><t size='1.2'><t align='center'>La fianza de la avioneta son %1€</t>", _costeTrabajo]; };

  if ((player getvariable "trabajo_avioneta_activo") > 0) exitwith {
    hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>Aereopuerto<br/><t color='#21618C'><t size='1.2'><t align='center'>Ya estás lleno ¡A trabajar!</t>";
  };

  player setvariable ["trabajo_avioneta_activo",1,true];

  _avioneta = _classNameAvioneta createvehicle getmarkerpos "avionetas_spawn";

  clearItemCargoGlobal _avioneta;

  _avioneta setvariable ["propietario", name player, true];

	player setvariable ["avioneta", _avioneta];

	player moveInDriver _avioneta;

  medel_din = medel_din - _costeTrabajo;

  [format ["- %1€", _costeTrabajo]] spawn ica_fnc_infolog;

  ["generoZona"] spawn ica_fnc_avionetas;
};

if (_param isEqualTo "generoZona") exitWith {

  _zonaGenerada = format ["avioneta_%1", round random 10];

  ["empiezo", _zonaGenerada] spawn ica_fnc_avionetas;
};

if (_param isEqualTo "empiezo") exitWith {

  _zona = param [1];

  player setVariable ["posicion_destino", (getmarkerPos _zona)];

  _pos = getMarkerPos _zona;
	entrega = player createSimpleTask ["Entrega el Paquete"];
	entrega setSimpleTaskDestination _pos;
	entrega setSimpleTaskDescription ["Tienes que entregar el paquete en esta ubicación", "Entrega el Paquete", "Ve a la Entrega"];
	entrega setTaskState "Assigned";

  hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>Aereopuerto<br/><t color='#21618C'><t size='1.2'><t align='center'>Te he marcado el punto de entrega en el mapa, pulsa la tecla K para entregar el paquete cuando estés a menos de 250 metros</t>";

  tecla = (findDisplay 46) displayaddEventHandler ["KeyDown", "if ((_this select 1) isEqualto 37) then {['entrego'] spawn ica_fnc_avionetas;}"];
};

if (_param isEqualTo "entrego") exitWith {

  _marcador = player getVariable "posicion_destino";

  if ((player distance _marcador) > 250) exitwith { hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>Aereopuerto<br/><t color='#21618C'><t size='1.2'><t align='center'>Aún estás muy lejos del punto de entrega</t>";};

  if (player getvariable "paquete_entregado" isEqualTo 1) exitwith {};

  _avioneta = player getvariable ["avioneta", objnull];

  _propietario = _avioneta getvariable "propietario";

  if (name player != _propietario) exitwith {
    hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>Aereopuerto<br/><t color='#21618C'><t size='1.2'><t align='center'>Esta avioneta no está a tu nombre merluzo</t>";
  };

  hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>Aereopuerto<br/><t color='#21618C'><t size='1.2'><t align='center'>Muy bien, has entregado el paquete, ve a cobrar</t>";

	cobro = player createSimpleTask ["Vuelve a Cobrar"];
	cobro setSimpleTaskDestination  (getMarkerPos "avionetas_spawn");
	cobro setSimpleTaskDescription ["Vuelve a el Aereopuerto a Cobrar", "Vuelve a Cobrar", "Ve a el Aereopuerto"];
	cobro setTaskState "Assigned";

  player setvariable ["paquete_entregado",1,true];
  player setvariable ["pagar_avionetas",1,true];

	player removeSimpleTask entrega;
	entrega = nil;

	_paquete = "Land_CargoBox_V1_F" createvehiclelocal (position (vehicle player));
	_paracaidas = "O_Parachute_02_F" createVehiclelocal (position player);
	_paracaidas setPosATL (player modelToWorld[0,0,300]);
	_paracaidas attachTo [player,[0,0,-10]];
  detach _paracaidas;
	_paquete attachTo [_paracaidas,[0,0,-2]];
	_paquete setDir 90;

	sleep 10;

	deletevehicle _paquete;
	deletevehicle _paracaidas;
};

if (_param isEqualTo "cobro") exitWith {

  _avioneta = nearestObject [player, "C_Plane_Civil_01_F"];
  _propietario = _avioneta getvariable "propietario";

  if ((player getvariable "pagar_avionetas") isEqualTo 0) exitwith {
    hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>Aereopuerto<br/><t color='#21618C'><t size='1.2'><t align='center'>!Trabaja primero! ¿Qué te crees político?</t>";
  };

  if ((count (nearestObjects [player, ["man"], 10]))>2) exitwith {
    hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>Aereopuerto<br/><t color='#21618C'><t size='1.2'><t align='center'>Debes alejar a todo el mundo para devolverme la avioneta</t>";
  };

  if (isnil "_avioneta") exitwith {
    hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>Aereopuerto<br/><t color='#21618C'><t size='1.2'><t align='center'>No veo ningúna avioneta cerca</t>";
  };

  if ((player distance _avioneta) > 25) exitwith {
    hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>Aereopuerto<br/><t color='#21618C'><t size='1.2'><t align='center'>Acerca la avioneta</t>";
  };

  if (name player != _propietario) exitwith {
    hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>Aereopuerto<br/><t color='#21618C'><t size='1.2'><t align='center'>Esta avioneta no está a tu nombre merluzo</t>";
  };

  if ((player getvariable "pagar_avionetas") > 0) exitwith {

	player removeSimpleTask cobro;
	cobro = nil;

  player setvariable ["trabajo_avioneta_activo",0,true];
  player setvariable ["pagar_avionetas",0,true];
  player setvariable ["paquete_entregado",0,true];

  deleteVehicle _avioneta;

  medel_din = medel_din + medel_dsin_dineroRecompensa;

  [format ["+ %1€", _dineroRecompensa]] spawn ica_fnc_infolog;

  ["EntregaTerminada"] spawn mav_ttm_fnc_addExp;

  hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>Aereopuerto<br/><t color='#21618C'><t size='1.2'><t align='center'>Has trabajado duro, aquí tienes tu recompensa</t>";
  };
};

if (_param isEqualTo "cancelo") exitWith {

  _avioneta = nearestObject [player, "C_Plane_Civil_01_F"];
  _propietario = _avioneta getvariable "propietario";

  if ((player getvariable "trabajo_avioneta_activo") isEqualTo 0) exitwith {
    hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>Aereopuerto<br/><t color='#21618C'><t size='1.2'><t align='center'>No estás trabajando</t>";
  };

  if ((count (nearestObjects [player, ["man"], 10]))>2) exitwith {
    hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>Aereopuerto<br/><t color='#21618C'><t size='1.2'><t align='center'>Debes alejar a todo el mundo para devolverme la avioneta</t>";
  };

  if (isnil "_avioneta") exitwith {
    hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>Aereopuerto<br/><t color='#21618C'><t size='1.2'><t align='center'>No veo ningúna avioneta cerca</t>";
  };

  if ((player distance _avioneta) > 25) exitwith {
    hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>Aereopuerto<br/><t color='#21618C'><t size='1.2'><t align='center'>Acerca la avioneta</t>";
  };

  if (name player != _propietario) exitwith {
    hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>Aereopuerto<br/><t color='#21618C'><t size='1.2'><t align='center'>Esta avioneta no está a tu nombre merluzo</t>";
  };

  player setvariable ["trabajo_avioneta_activo",0,true];
  player setvariable ["pagar_avionetas",0,true];
  player setvariable ["paquete_entregado",0,true];

	player removeSimpleTask entrega;
	entrega = nil;

	player removeSimpleTask cobro;
	cobro = nil;

  medel_din = medel_din + medel_dsin_costeTrabajo;

  [format ["+ %1€", _costeTrabajo]] spawn ica_fnc_infolog;

  hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>Aereopuerto<br/><t color='#21618C'><t size='1.2'><t align='center'>Has cancelado el trabajo de avionetas<br/>Te he devuelto el dinero de la fianza</t>";

  deleteVehicle _avioneta;
};

if (_param isEqualTo "debug") exitWith {

  _avioneta = nearestObject [player, "C_Plane_Civil_01_F"];

  if ((player getvariable "trabajo_avioneta_activo") isEqualTo 0) exitwith {
    hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>Aereopuerto<br/><t color='#21618C'><t size='1.2'><t align='center'>No estás trabajando</t>";
  };

  player setvariable ["trabajo_avioneta_activo",0,true];
  player setvariable ["pagar_avionetas",0,true];
  player setvariable ["paquete_entregado",0,true];

	player removeSimpleTask entrega;
	entrega = nil;

	player removeSimpleTask cobro;
	cobro = nil;

  deleteVehicle _avioneta;

  hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>Aereopuerto<br/><t color='#21618C'><t size='1.2'><t align='center'>Ya no estás bugueado</t>";
};
