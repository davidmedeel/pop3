/*
Script hecho por Icaruk, si quieres usarlo sólo tienes que pedirme permiso en adri-rk@hotmail.com.
Script done by Icaruk, if you want to use it, you just have to ask me permission on adri-rk@hotmail.com.

	["menu"] spawn ica_fnc_loteria;
*/


_param = _this select 0;
_posibilidades = 200;

if (_param isEqualTo "init") exitWith {
	_tiempo = 60 * 120;
	_numG = round (random _posibilidades);

	while {true} do {
		loteria = [[_tiempo, ""], []];

		while {true} do {
			loteria = [[(loteria select 0 select 0) - 1, (loteria select 0 select 1)], (loteria select 1)];
			sleep 1;

			if ((loteria select 0 select 0) <= (60 * 15)) exitWith {
				loteria = [[loteria select 0 select 0, _numG], (loteria select 1)];

				_str = format ["el número ganador es el %1", loteria select 0 select 1];
				[10, "Lotería", [0,0,1], 1.5, _str, [1,1,1], 1] remoteexec ["ica_fnc_anuncio",Civilian];
			};

			if ((loteria select 0 select 0) <= 0) exitWith {
				loteria = [[0, ""], (loteria select 1)];
			};
		};
	};

};

if (_param isEqualTo "menu") exitWith {
	if (deServicio == 1) exitwith {hint "Estás de sercivio, ¿Te parece poco la paguita de admin?";};
	if (!isNil {comprobando}) exitWith {closeDialog 0};

	private ["_miidx", "_miNumero"];

	[player, ["loteria"]] call ica_fnc_varToServer; waitUntil {recibido};

	_miidx = (loteria select 1) find (name player);
	if (_miidx != -1) then {
		_miNumero = loteria select 1 select (_miidx + 1);
	} else {
		_miNumero = "";
	};

	createDialog "loteria";
	disableSerialization;
	_ui = uiNameSpace getVariable "loteria";
	_txt = (_ui displayCtrl 5060);
	_boton = (_ui displayCtrl 5061);

	_str = parseText format ["Mi número: %1<br/><br/>Número ganador: %2<br/><br/>Tiempo restante: %3 min", _miNumero, loteria select 0 select 1, round ((loteria select 0 select 0) / 60)];
	_txt ctrlSetStructuredText _str;

	if (_miNumero isEqualTo "") then {
		_boton ctrlSetText "Comprar";
		_boton buttonSetAction '
			["compro"] spawn ica_fnc_loteria;
		';
	} else {
		_boton ctrlSetText "Cobrar";
		_boton buttonSetAction '
			["cobro"] spawn ica_fnc_loteria;
		';
	};

};

if (_param isEqualTo "compro") exitWith {
	if (!isNil {ocupado}) exitWith {closeDialog 0};
	ocupado = true;

	if (medel_din < 5000) exitWith {hint format ["Te faltan %1€, pero la esperanza es lo último que se pierde", 5000 - medel_din]; closeDialog 0; ocupado = nil};

	private "_minumero";
	_miidx = (loteria select 1) find (name player);
	if (_miidx != -1) then {
		_miNumero = loteria select 1 select (_miidx + 1);
	} else {
		_miNumero = "";
	};

	medel_din = medel_din - 5000;

	if !(_miNumero isEqualTo "") exitWith {hint "Ya tienes un número, no seas avaricioso. Por cierto, te he cobrado igual :)"; closeDialog 0; ocupado = nil};

	_rnd = round (random _posibilidades);
	(loteria select 1) pushBack (name player);
	(loteria select 1) pushBack _rnd;
	publicVariableServer "loteria";

	closeDialog 0;
};

if (_param isEqualTo "cobro") exitWith {
	if (!isNil {ocupado}) exitWith {closeDialog 0};
	ocupado = true;

	closeDialog 0;
	comprobando = true;
	hint "Comprobando el número...";
	sleep 4 + (round (random 5));
	[player, ["loteria"]] call ica_fnc_varToServer; waitUntil {recibido};
	comprobando = nil;

	private "_miNumero";
	_miidx = (loteria select 1) find (name player);
	if (_miidx != -1) then {
		_miNumero = loteria select 1 select (_miidx + 1);
	} else {
		_miNumero = "";
	};

	if ((loteria select 0 select 1) isEqualTo "") exitWith {hint "Aún no ha salido el número ganador"; closeDialog 0; ocupado = nil};
	if !(_miNumero isEqualTo (loteria select 0 select 1)) exitWith {hint "No te ha tocado :("; closeDialog 0; ocupado = nil};

	loteria = [[], []];
	publicVariableServer "loteria";

	hint "¡Te ha tocado! ¡¡¡Has ganado 750.001 €!!!";
	medel_din = medel_din + medel_dsin750001;
};

if (_param isEqualTo "historia1") exitWith {
	hint "Así que quieres que te cuente mis historia, bien....\n\n

	Estaba yo tranquilamente trabajando en mi puesto, como siempre, cuando de repente empezaron a sonar alarmas.\n
	Vi como pasaban policías con fusiles de asalto a toda prisa, uniformados como fuerzas especiales, iban de aquí para allá pegando voces diciendo que había que marcharse de Altis lo antes posible. ¿Y qué pasa con mi negocio? ¿Qué hago con el dinero que he ganado todos estos años? No podía dejarlo todo atrás por cualquier mierda así que busqué un sitio para esconderme. \n\n

	Agazapado en la oscuridad, mientras la fuerte lluvia castigaba mi espalda, a cada paso mis pies se hundían en el barro como si aquello fueran arenas movedizas, me apresur顨asta la tienda general, subí al primer piso y me quedé allíesperando.\n\n

	Hubo una gran explosión, venía de muy lejos y al rato empecé a escuchar disparos acompañados de gritos, pero los gritos no eran de personas, sonaban demasiado... no sé, no eran normales. Estaba muy asustado porque empecé a escuchar sonidos extraños en el piso de abajo y me quedé congelado, no moví ni un sólo músculo temiendo hacer rudido.\n
	Después escuché a alguien subiendo las escaleras hacia donde yo estaba -Joder estoy jodido -pensé, ya no me daba tiempo a escapar por ningún sitio, así que cerré los ojos sin más esperando mi destino...
	";
};

if (_param isEqualTo "historia2") exitWith {
	hint "-Eh tío no te asustes, no soy uno de esos, me llamo Miguel. Ni muerdo ni voy armado, y creo que los dos estamos igual de jodidos aquí arriba. -Las palabras de aquel tipo me convencieron y abrí los ojos. Su aspecto era deplorable, lleno de mierda, de barro y empapado... como yo. \n\n
	Me explicó la causa de la evacuación de Altis, y el resumen fué: científicos, virus y zombis. Joder, esto es lo que pasa cuando se juega a ser Dios.\n
	Escuchamos un camión y muchas voces, Miguel se levantó de un salto y bajó corriendo las escaleras a gritando algo de que era nuestra última oportunidad. Yo me quedé ahí arriba escuchando conversaciones sobre chupetes y pirulís... vaya panda de retrasados.\n\n

	Al final el camión se marchó y dejé de escuchar voces. Después escuché un helicóptero acercarse... y alejarse. \n\n

	De pronto empezaron a caer bombas del cielo, destuyendo todo a su paso, yo ya estaba sentenciado a morir aplastado en aquel edificio. Vi un destello y perdí la consciencia. \n\n

	No sé cuánto tiempo pasó pero vinieron a por mí y me llevaron a esta maravillosa ciudad.

	";
};

/*
Acciones del NPC

Abrir menu:
	this addAction ["Loterícaruk"," ['menu'] execVM 'ica\tonterias\loteria.sqf'; ", "", 9,false,true,"",""];
	this addAction ["Cuéntame tu historia (1/2)"," ['historia1'] execVM 'ica\tonterias\loteria.sqf'; ", "", 8,false,true,"",""];
	this addAction ["Cuéntame tu historia (2/2)"," ['historia2'] execVM 'ica\tonterias\loteria.sqf'; ", "", 7,false,true,"",""];

*/

