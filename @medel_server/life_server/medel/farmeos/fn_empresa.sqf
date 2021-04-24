
/*
por: Medel
*/

_param =  param [0];

if (_param  isEqualTo  "Init") exitWith {
  NPC_EMPRESA_1 addAction ["<t color=""#DE2828"">" + "La Empresa: Transporte de Drogas - Coste: 40.000€ - Recompensa: 80.000€",{["misionTransporteDrogas"] spawn ica_fnc_empresa;},[],1.5,true,true,"","(playerside isEqualTo civilian)",5,false,"",""];
  NPC_EMPRESA_2 addAction ["<t color=""#DE2828"">" + "La Empresa: Transporte de Armas - Coste: 120.000€ - Recompensa: 200.000€",{["misionTransporteArmas"] spawn ica_fnc_empresa;},[],1.5,true,true,"","(playerside isEqualTo civilian)",5,false,"",""];
  NPC_EMPRESA_COBROS addAction ["<t color=""#DE2828"">" + "Cobrar trabajo Transporte de Drogas - Recompensa: 80.000€",{["misionTransporteDrogasCobrar"] spawn ica_fnc_empresa;},[],1.5,true,true,"","(playerside isEqualTo civilian)",5,false,"",""];
  NPC_EMPRESA_COBROS addAction ["<t color=""#DE2828"">" + "Cobrar trabajo Transporte de Armas - Recompensa: 200.000€",{["misionTransporteArmasCobrar"] spawn ica_fnc_empresa;},[],1.5,true,true,"","(playerside isEqualTo civilian)",5,false,"",""];
};

if (_param  isEqualTo  "misionTransporteDrogas") exitWith {

  if (deServicio == 1) exitwith {hint "Estás de sercivio, ¿Te parece poco la paguita de admin?";};

  if !({side _x  isEqualTo  WEST} count playableUnits >= 4) exitWith {hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>EMPRESA<br/><t color='#21618C'><t size='1.2'><t align='center'>Tienen que estar al menos 4 policías conectados, sino, no es divertido.</t>";};

  if ((player getvariable "trabajo_transporte_droga_activo") > 0) exitwith {};

  _coste_mision = 40000;

  if (medel_din < _coste_mision) exitwith {hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>EMPRESA<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes 40.000€.</t>";};

  [format ["- %1€", _coste_mision]] call ica_fnc_infolog;
  medel_din = medel_din - _coste_mision;

  player setvariable ["trabajo_transporte_droga_activo",1,true];

  _time = 60 *  20;
  _droga = "pop_opio_b";
  _drogaCantidad = 25;

  _destino = "Almacén de la Empresa";
  _posDestino = getMarkerPos "AlmacenEmpresa";
  _metros =  player distance _posDestino;

  hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>EMPRESA<br/><t color='#21618C'><t size='1.2'><t align='center'>Coge la droga de la caja y llévala al punto de entrega, está pesada al miligramo, por tu bien que no falte nada.</t>";

  [20,"La caja se borrará cuando la barra llegue al final..."] spawn ica_fnc_barrita;

  _cajaGTA = "CargoNet_01_box_F" createVehicle getMarkerPos "cajaDrogas";

  clearMagazineCargoGlobal _cajaGTA;
  clearItemCargoGlobal _cajaGTA;
  clearWeaponCargoGlobal _cajaGTA; 

  _cajaGTA addItemCargoGlobal [_droga, _drogaCantidad];

  [_cajaGTA, 20] spawn ica_fnc_borrame;

  sleep 20;

  while {_time > 0} do {

    if (vehicle player isKindOf "Air") then {
        titleText["Misión Fallida - No puedes ir en helicóptero para realizar el transporte.", "PLAIN"]; 
        player setvariable ["trabajo_transporte_droga_activo",0,true];
        _cocaDevuelve = ["pop_opio_b"] call ica_fnc_tengo;
      if (_cocaDevuelve >= 25) then {
          hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>EMPRESA<br/><t color='#21618C'><t size='1.2'><t align='center'>Helicopteros...<br/>Esta vez te devuelvo la pasta pero la útlima.</t>";
          ["pop_opio_b", -25] call ica_fnc_item;
          ["+ 40000€"] spawn ica_fnc_infolog;
        medel_din = medel_din + 40000;
      };
    _time = 0;
    };

  _metros =  player distance _posDestino;

  sleep 1;
  _time = _time - 1;

  hintSilent parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>EMPRESA<br/><t color='#21618C'><t size='1.2'><t align='center'>Destino: %3<br/>Tiempo: %1<br/>Distancia: %2 metros</t>", [((_time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring,round (_metros), _destino];

  if !(alive player) then {
    _time = 0;
  };

  if (_time <= 0) then {
    hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>EMPRESA<br/><t color='#21618C'><t size='1.2'><t align='center'>Has tardado mucho en llegar, no queremos tratos con gente incompetente.</t>";
    player setvariable ["trabajo_transporte_droga_activo",0,true];
    _time = 0;
  };

  if (_metros < 10 ) then {

  titleText ["Bien, ahora entrega la droga", "PLAIN"];

  player setvariable ["pagar_transporte_droga",1,true];

  _time = 0;

  hint "";
  };
 };
};

if (_param isEqualTo "misionTransporteDrogasCobrar") exitWith {

  if (deServicio == 1) exitwith {hint "Estás de sercivio, ¿Te parece poco la paguita de admin?";};

  if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>EMPRESA<br/><t color='#21618C'><t size='1.2'><t align='center'>De uno en uno, por favor.</t>";};

  if ((player getvariable "pagar_transporte_droga")  isEqualTo  0) exitwith {hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>EMPRESA<br/><t color='#21618C'><t size='1.2'><t align='center'>Trabaja primero.<br/>¿Qué te crees que eres político?</t>";};

  if ((player getvariable "pagar_transporte_droga") > 0) exitwith {

  _cocaCantidad = ["pop_opio_b"] call ica_fnc_tengo;
  if (_cocaCantidad < 25) exitWith {
    hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>EMPRESA<br/><t color='#21618C'><t size='1.2'><t align='center'>Falta Droga...<br/>Con la Empresa no se juega.</t>";
    player setDamage 0.9;
  };

  ["pop_opio_b", -25] call ica_fnc_item;

  hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>EMPRESA<br/><t color='#21618C'><t size='1.2'><t align='center'>Fantástico, has trabajado duro.<br/>La empresa siempre cumple, aquí está tu recompensa.</t>";

  _exp = 8;
 // _pago = 80000;
 _pago = 60000;

  medel_din = medel_din + _pago;
  [format ["+ %1€", _pago]] call ica_fnc_infolog;
  ["exp", _exp] call ica_fnc_arrayexp;

  player setvariable ["pagar_transporte_droga",0,true];
  player setvariable ["trabajo_transporte_droga_activo",0,true];
  };
};

if (_param  isEqualTo "misionTransporteArmas") exitWith {

  if (deServicio == 1) exitwith {hint "Estás de sercivio, ¿Te parece poco la paguita de admin?";};

  if !({side _x isEqualTo WEST} count playableUnits >= 4) exitWith {hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>EMPRESA<br/><t color='#21618C'><t size='1.2'><t align='center'>Tienen que estar al menos 4 policías conectados, sino, no es divertido.</t>";};

  if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>EMPRESA<br/><t color='#21618C'><t size='1.2'><t align='center'>De uno en uno, por favor.</t>";};

  if ((player getvariable "trabajo_transporte_armas_activo") > 0) exitwith {};

  //_coste_mision = 120000;
  _coste_mision = 80000;

  if (medel_din < _coste_mision) exitwith {hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>EMPRESA<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes 120.000€.</t>";};

  [format ["- %1€", _coste_mision]] call ica_fnc_infolog;
  medel_din = medel_din - _coste_mision;

  player setvariable ["trabajo_transporte_armas_activo",1,true];

  _time = 60 *  20;
  _arma = "R3F_PAMAS";
  _armaCantidad = 2;

  _destino = "Almacén de la Empresa";
  _posDestino = getMarkerPos "AlmacenEmpresa";
  _metros = player distance _posDestino;

hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>EMPRESA<br/><t color='#21618C'><t size='1.2'><t align='center'>Coge las armas de la caja y llévalas al punto de entrega, están contadas, por tu bien que no falte nada.</t>";

_cajaGTA = "CargoNet_01_box_F" createVehicle getMarkerPos "cajaArmas";

clearMagazineCargoGlobal _cajaGTA;
clearItemCargoGlobal _cajaGTA;
clearWeaponCargoGlobal _cajaGTA;

_cajaGTA addItemCargoGlobal [_arma, _armaCantidad];

[20,"La caja se borrará cuando la barra llegue al final..."] spawn ica_fnc_barrita;

[_cajaGTA, 20] spawn ica_fnc_borrame;

sleep 20;

while {_time > 0} do {

  if (vehicle player isKindOf "Air") then {
  titleText ["Mision Fallida - No puedes ir en helicóptero para realizar el transporte.", "PLAIN"]; 
  player setvariable ["trabajo_transporte_armas_activo",0,true];
	_ArmasDevuelve = ["R3F_PAMAS"] call ica_fnc_tengo;
	if (_ArmasDevuelve >= 25) then {
	hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>EMPRESA<br/><t color='#21618C'><t size='1.2'><t align='center'>Helicopteros...<br/>Esta vez te devuelvo la pasta pero la útlima.</t>";
	["R3F_PAMAS", -2] call ica_fnc_item;
  ["+ 120000€"] spawn ica_fnc_infolog;
	medel_din = medel_din + 120000;
	};
  _time = 0;
  };

  _metros =  player distance _posDestino;

  sleep 1;
  _time = _time - 1;

  hintSilent parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>EMPRESA<br/><t color='#21618C'><t size='1.2'><t align='center'>Destino: %3<br/>Tiempo: %1<br/>Distancia: %2 metros</t>", [((_time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring,round (_metros), _destino];

  if !(alive player) then {
    _time = 0;
  };

  if (_time <= 0) then {
    hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>EMPRESA<br/><t color='#21618C'><t size='1.2'><t align='center'>Has tardado mucho en llegar, no queremos tratos con gente incompetente..</t>";
    player setvariable ["trabajo_transporte_armas_activo",0,true];
    _time = 0;
  };

  if (_metros < 10) then {  

  titleText["Bien, ahora entrega las armas.", "PLAIN"];

  player setvariable ["pagar_transporte_armas",1,true];

  _time = 0;

  hint "";
  };
 };
};

if (_param isEqualTo "misionTransporteArmasCobrar") exitWith {

  if (deServicio == 1) exitwith {hint "Estás de sercivio, ¿Te parece poco la paguita de admin?";};

  if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor"};

  if ((player getvariable "pagar_transporte_armas") isEqualTo 0) exitwith {hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>EMPRESA<br/><t color='#21618C'><t size='1.2'><t align='center'>Trabaja primero.<br/>¿Qué te crees que eres político?</t>";};

  _pWeap = primaryWeapon player;
  _hgWeapon= handgunWeapon player; 

  if (_pWeap != "" or _hgWeapon != "") exitWith {
    titleText ["Pon tus armas en la mochila, no te pagaremos mientras lleves armas equipadas.", "PLAIN"];
  };

  if ((player getvariable "pagar_transporte_armas") > 0) exitwith {

  _arma = "R3F_PAMAS";
  _armaCantidad = 2;
  _armaCantidad = ["R3F_PAMAS"] call ica_fnc_tengo;

  if(_armaCantidad < 2) exitWith {
    hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>EMPRESA<br/><t color='#21618C'><t size='1.2'><t align='center'>Faltan armas...<br/>Con la Empresa no se juega.</t>";
    player setdamage 0.9;
  };

  [_arma, -2] call ica_fnc_item;

  hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>EMPRESA<br/><t color='#21618C'><t size='1.2'><t align='center'>Fantástico, has trabajado duro.<br/>La empresa siempre cumple, aquí está tu recompensa.</t>";

  _exp = 14;
 // _pago = 220000;
 _pago = 120000;

  medel_din = medel_din + _pago;
  [format ["+ %1€", _pago]] call ica_fnc_infolog;
  ["exp",_exp] call ica_fnc_arrayexp;

  player setvariable ["pagar_transporte_armas",0,true];
  player setvariable ["trabajo_transporte_armas_activo",0,true];
  };
};
