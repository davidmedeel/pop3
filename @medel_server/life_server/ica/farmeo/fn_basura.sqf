
/*
por: Neoxan & Icaruk
	["init"] spawn ica_fnc_basura;
*/

_param = _this select 0;

if (_param isEqualTo "init") exitWith {
	// contenedor es el nombre del objeto que ira en el mapa con el numero del uno al 20
	_contenedores = [];
	_palabra = "contenedor";

	for "_x" from 1 to 30 do {
		_contenedores pushBack (call compile format ["%1%2", _palabra, _x]);
	};

	//hint format ["El array de contenedores es %1", _contenedores];  COMENTAME DESPUES DE TESTEAR

	while {true} do {

		{
			if !(_x getvariable "basura") then {
				_x setvariable ["basura",true,true];// es el classname del objeto que ira dentro del contenedor
				_x animate ["tapacontenedor",1]; // Animación para que la gente pueda ver si el contenedor esta lleno o vacío
				_x animate ["basura_unhide",1]; // Animación para que la gente pueda ver si el contenedor esta lleno o vacío
			};
		} forEach _contenedores;
		sleep (60 * 20);
	};
};

if (_param isEqualTo "cargo") exitWith {
	// Esto es para cuando el camión va a cargar el contenedor
	_veh = nearestObject [player, "pop_camionbasura"];
	_contenedor = nearestObject [player, "pop_contenedordebasura"];
	// comprobaciones para ver que el player puede cargar el container
	if ((player distance _contenedor)>5) exitwith {hint "Acercate al contendor de basura"};
	if !(_contenedor getvariable "basura") exitwith {hint "El contendor esta vacío"};
	// Esto lo uso para ver si el camión se mueve luego
	_positionveh = getpos _veh;
	// Posiciones en coordenadas del modelo de los puntos de memoria
	_action1 = _veh selectionPosition "action_1";
	_action2 = _veh selectionPosition "action_2";
	_actionbasura = _veh selectionPosition "action_basura";
	// Se cambia el sistema de referencia del modelo al mundo
	_cargopos1 = _veh modelToWorld _action1;
	_cargopos2 = _veh modelToWorld _action2;
	_cargobasura = _veh modelToWorld _actionbasura;
	// posición del contenedor de basura
	_contenedorpos = getpos _contenedor;
	if (((player distance _cargopos1) > 2) and ((player distance _cargopos2) > 2)) exitwith {hint "Colócate en posición, en cualquiera de los laterales del camión"};
	if ((_contenedor distance _cargobasura)>2) exitwith {hint "Acerca el camión a la parte trasera del contenedor"};
	if ((_veh getvariable "basura") > 4) exitwith {hint "El camión está lleno"};
	if (_veh getvariable "cargando") exitwith {hint "El camión está cargando"};
	_contenedor setvariable ["basura",false,true];// para que no se pongan varios camiones a descargar el mismo container
	_veh setvariable ["cargando",true,true];
	// Ya por fin cargamos, hacemos todas las animaciones
	// se esconde el contenedor original y aparece el que está en el camión
	[_contenedor, true] call ica_fnc_ocultame;
	_veh animate ['contenedor_unhide',1];
	_veh animate ['contenedor',1];
	_veh animate ['tapacontenedor',1];
	sleep 3;
	
	sleep 1;
	_veh animate ['contenedor',0];
	_veh animate ['tapacontenedor',0];
	sleep 3;
	_veh animate ['contenedor_unhide',0];
	sleep 1;
	[_contenedor, false] call ica_fnc_ocultame;
	//_contenedor hideObjectGlobal false;
	if (((position _veh) distance _positionveh) > 2) exitwith {hint "Has movido el camión de basura durante la carga"};
	_veh animate ['pala',0];
	_veh animate ['hidraulicos',0];
	_veh animate ['hidraulicos2',0];
	sleep 1;
	_veh animate ['porton',1];
	_veh animate ['basura_unhide',1];
	[_veh, "Hidraulics",100] call CBA_fnc_globalSay3d;
	sleep 7;
	_veh animate ['pala',1];
	_veh animate ['hidraulicos',1];
	_veh animate ['hidraulicos2',1];
	sleep 2;
	[_veh, "Hidraulics",100] call CBA_fnc_globalSay3d;
	_veh animate ['porton',0];
	sleep 7;
	_veh animate ['pala',1];
	_veh animate ['hidraulicos',1];
	_veh animate ['hidraulicos2',1];
	sleep 1;
	_veh animate ['basura_unhide',0];
	_contenedor animate ["tapacontenedor",0]; // Animación para que la gente pueda ver si el contenedor esta lleno o vacío
	_contenedor animate ["basura_unhide",0]; // Animación para que la gente pueda ver si el contenedor esta lleno o vacío
	_basura = _veh getvariable "basura";
	if (isNil "_basura") then {_veh setvariable ["basura",0,true]};
	_veh setvariable ["basura", _basura + 1,true];
	if (_basura > 3) then {_veh setvariable ["basura",3,true]}; // a veces se buggeaba y no podian descargar
	_veh setvariable ["cargando",false,true];
};

if (_param isEqualTo "descargo") exitWith {
	_veh = nearestObject [player, "pop_camionbasura"];
	if ((player distance _veh)>10) exitwith {hint "Acercate al camión de basura"};
	if ((count (nearestObjects [player, ["man"], 4]))>1) exitwith {hint "De uno en uno por favor"};
	if ((_veh getvariable "basura") == 0) exitwith {hint "El camión está vacío"};
	if ((_veh getvariable "basura") == 1) exitwith {
		hint "Había algo de basura, pero tampoco te lo has currado mucho, aquí tienes tu recompensa, ve a darte una ducha que aquí huele a mierda";
		_veh setvariable ["basura",0,true];
		medel_din = medel_din + 3000;
		["exp",4] call ica_fnc_arrayexp;
	};
	if ((_veh getvariable "basura") == 2) exitwith {
		hint "No está mal, aquí tienes tu recompensa, ve a darte una ducha que aquí huele a mierda";
		_veh setvariable ["basura",0,true];
		medel_din = medel_din + 6000;
		["exp",6] call ica_fnc_arrayexp;
	};
	if ((_veh getvariable "basura") == 3) exitwith {
		hint "Fantástico, había un montón de basura, aquí tienes tu recompensa";
		_veh setvariable ["basura",0,true];
		medel_din = medel_din + 9000;
		["exp",8] call ica_fnc_arrayexp;
	};
	if ((_veh getvariable "basura") == 4) exitwith {
		hint "Fantástico, había un montón de basura, aquí tienes tu recompensa";
		_veh setvariable ["basura",0,true];
		medel_din = medel_din + 12000;
		["exp",10] call ica_fnc_arrayexp;
	};
	if ((_veh getvariable "basura") == 5) exitwith {
		hint "Fantástico, había un montón de basura, aquí tienes tu recompensa";
		_veh setvariable ["basura",0,true];
		medel_din = medel_din + 15000;
		["exp",12] call ica_fnc_arrayexp;
	};
};
if (_param isEqualTo "solicito") exitWith {
	if (deServicio == 1) exitwith {hint "Estás de sercivio, ¿Te parece poco la paguita de admin?";};
	if (!license_civ_driver) exitwith {hint "No tienes carnet de conducir B, no puedes conducir este camión!"};
	if (medel_din < 15000) exitwith {hint "La fianza del camión son 15000 €"};
	medel_din = medel_din - 15000;
	_veh = "pop_camionbasura" createvehicle position player;
	_veh setvariable ["basura",0,true];
	_veh setvariable ["propietario",name player,true];
	player setvariable ["uniforme",uniform player,true];
	player adduniform "U_C_FireFighter";
	hint "Todo listo, ve a buscar los contenedores verdes que hay por Lakeside y Nueva Morrison, carga el camión y vuelve cuando tengas algo de basura, puedes devolver el camión cuando quieras, se te devolverá la fianza y el uniforme que llevabas lo tenemos guardado en la taquilla";
};

if (_param isEqualTo "fianza") exitWith {


	if ((count (nearestObjects [player, ["man"], 4]))>1) exitwith {hint "De uno en uno por favor"};
	_veh = nearestObject [player, "pop_camionbasura"];
	if (isnil "_veh") exitwith {hint "No veo cerca ningún camión de basura"};
	if ((player distance _veh)>5) exitwith {hint "Acerca el camión de basura"};
	_propietario = _veh getvariable "propietario";
	if (name player != _propietario) exitwith {hint "Este camión no esta registrado a tu nombre"};
	deletevehicle _veh;
	_uniforme = player getvariable "uniforme";
	player adduniform _uniforme;
	medel_din = medel_din + 15000;
	hint "Todo listo, el camión está guardado en el garage, vuelve a por más trabajo cuando quieras";
};
