/* 
Creado por Medel
Para Plata o Plomo
*/

_param = param[0];

if (_param isEqualTo "NPC") exitWith {
    _npc = MEDEL_NPC_BOMBEROS;

    _npc addAction["<t size='1.5' color='#DE2828'>Empezar servicio de Bombero<t\>",{["vestirse"] spawn ica_fnc_bomberos;},[],1.8,true,true,"","(playerside isEqualTo independent)",5,false,"",""];
	_npc addAction["<t size='1.5' color='#DE2828'>Terminar servicio de Bombero<t\>",{["finalizar"] spawn ica_fnc_bomberos;},[],1.7,true,true,"","(playerside isEqualTo independent)",5,false,"",""];
	_npc addAction["<t size='1.5' color='#DE2828'>Solicitar Camión de Bomberos<t\>",{["solicito"] spawn ica_fnc_bomberos;},[],1.6,true,true,"","(playerside isEqualTo independent)",5,false,"",""];
	_npc addAction["<t size='1.5' color='#DE2828'>Entregar Camión de Bomberos<t\>",{["entregar"] spawn ica_fnc_bomberos;},[],1.5,true,true,"","(playerside isEqualTo independent)",5,false,"",""];
};

if (_param isEqualTo "vestirse") exitWith {
	if !(playerSide == INDEPENDENT) exitWith {hint "Solo personal de EMS puede vestirse de bombero";};
	if (vestidoBombero == 1)exitWith{ hint "Ya estás de servicio como bombero." };
	vestidoBombero = 1;
	//guardamos la ropa
	ropa_bombero = getUnitLoadout player;
	//equipar al tio
	removeAllWeapons player;
	removeUniform player;
	removeVest player;
	removeHeadgear player;
	removeGoggles player;

	player forceAddUniform "medel_uniforme_bombero";
	player addBackpack "mochila_grande";
	player addHeadgear "H_Orel_FireFighter_Gaz";
	player addWeapon "pop_extintor";
	//for "_i" from 1 to 10 do {player addItemToVest "CL_ExtinguisherMagazine";};

	_paraf = parseText "<t size=""1.5"" color=""#FF0000"" align=""center""> Cuerpo de Bomberos </t><br/><t size=""1"">Bienvenido al cuerpo de Bomberos de la ciudad, recuerde que usted es ahora un funcionario publico incorruptible y neutral, mientras este de servicio no puede cometer actos ilegales.</t>";

	("SUMARIO") hintC [
		_paraf,
		"Estas obligado a mantener el uniforme y el Extintor reglamentario mientras estes de servicio.",
		"Debes de brindar los primeros auxilios y estabilizar a cualquier persona que sin dejar de lado tu objetivo principal asi lo requiera.",
		"Debes atender los incendios que se produzcan ya sea en zonas urbanas, rurales o en accidentes de transito, podras salvar coches para que no se pierdan si estan incendiados.",	
		"Usted es una unidad neutral que esta para el servicio de todos.",
		"Recuerda usar el cañon de agua para grandes incendios y el extintor para pequeños incendios.",	
		(parseText "Para mas informacion, dirijase a la <t color=""#000099""><a href=""http://plataoplomo.es"">pagina web</a></t>.")
	];
	hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
		0 = _this spawn {
			_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
			hintSilent "";
		};
	}];
	[] spawn {
		sleep 3;

		0=[[[" - Cuerpo de Bomberos -","<t align = 'center' size = '1.5' font='PuristaBold'>%1</t><br/>"],["","<br/>"],["Ciudad de Plata o Plomo","<t align = 'center' size = '0.8' color = '#aaaaaa'>%1</t>"]]] spawn BIS_fnc_typeText;
	};
};

if (_param isEqualTo "finalizar") exitWith {
	if (playerSide == WEST)exitWith {hint "Policia bombero?";};
	if (vestidoBombero == 0)exitWith {hint "No estas de servicio..."};

	vestidoBombero = 0;

	removeAllWeapons player;

	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;

	player setUnitLoadout ropa_bombero;

	titleText["Servicio finalizado, La ciudad de Lakeside agradece tus servicios!", "PLAIN"];

	_fuego_apagado = player getVariable ["fuego_apagado",nil];
	if !(isNil "_fuego_apagado" && _fuego_apagado > 0) then {_pago = _fuego_apagado; _exp = (_fuego_apagado * 0.01);
		hint "Como has apagado incendios y salvado coches incendiados te reconoceremos de acuerdo a tu esfuerzo";
		medel_din = medel_din + _pago;
        ["exp",_exp] call ica_fnc_arrayEXP;
		player setVariable ["fuego_apagado",0,true];
	};
};

if (_param isEqualTo "solicito") exitWith {
	if !(playerSide isEqualTo independent) exitWith {hint "Solo el personal de EMS puede trabajar de Bombero";};

    if (medel_din < 500) exitwith {hint "Los costes de mantenimiento del camión son de 500 €"};

    medel_din = medel_din - 500;
    _camion = "mercedes_atego_bomberos_ingame" createVehicle getMarkerPos "medic_spawn_26";
	_camion allowdamage false;
	_camion setDir 106;
    _camion setvariable ["incendios",0,true];
    _camion setvariable ["propietario",name player,true];
	_camion addAction["<t size='1.5' color='#DE2828'>Disparar agua<t\>",{["camion",_this select 0,_this select 0] spawn ica_fnc_tiroAgua;},[],1.8,true,true,"","!(vehicle player isEqualTo player)",5,false,"",""];
	sleep 2;
	_camion allowdamage true;
    hint "Ya tienes tu camión asignado al frente, espera y atiende todas las solicitudes de incendios.";
};

if (_param isEqualTo "entregar") exitWith {
	if !(playerSide isEqualTo independent) exitWith {hint "No eres EMS";};

    if ((count (nearestObjects [player, ["man"], 4]))>1) exitwith { hint "De uno en uno, por favor." };

    _camion = nearestObject [player, "mercedes_atego_bomberos_ingame"];

    if (isnil "_camion") exitwith { hint "No veo cerca ningún camión de bomberos." };

    if ((player distance _camion) > 10) exitwith { hint "Acerca el camión de bomberos." };

    _propietario = _camion getvariable "propietario";
    if (name player != _propietario) exitwith { hint "Este camión no está registrado a tu nombre" };

    deletevehicle _camion;
    hint "Todo listo, el camión está guardado en el garage de bomberos, puedes volver a sacarlo cuando desees.";
};
