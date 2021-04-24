
/*
por: Neoxan

	["puertacentral"] spawn ica_fnc_fugacarcel;
	["conducto"] spawn ica_fnc_fugacarcel;
	["bajar"] spawn ica_fnc_fugacarcel;
	["abropuertas"] spawn ica_fnc_fugacarcel;
	["sentar"] call ica_fnc_fugacarcel;
	["ejecuto"] spawn ica_fnc_fugacarcel;
	this addAction ["Colocar en la silla", ' [""sentar""] call ica_fnc_fugacarcel; ' ];
	this addAction ["Ejecucion", ' [""ejecuto""] spawn ica_fnc_fugacarcel; ' ];
*/

_param = param [0];

if (_param isEqualTo "puertacentral") exitWith {
	if ((["pop_c4"] call ica_fnc_tengo) == 0) exitWith {hint "Necesitas una bomba C4-OP."};
	["pop_c4", -1] call ica_fnc_item;
	["- C4-OP"] call ica_fnc_infolog;
	hint "Temporizador configurado a 120 segundos. La policía ya está de camino";
	_itemBomba = "pop_c4_obj" createVehicle (getPos puertacentral);
	_itemBomba attachTo [puertacentral, [-0.05,0.050,0],"ACTION_KeypadA"];
	detach _itembomba;
	[_itemBomba, 90, 90] call bis_fnc_setPitchBank;

	[10, "Aviso", [1,0,0], 1.5, "El detector de explosivos de la carcel ha detectado algo", [1,1,1], 1] remoteexec ["ica_fnc_anuncio",WEST];
	sleep 120;

	_bomba = "M_Mo_82mm_AT_LG" createVehicle (getPos _itemBomba);
	deleteVehicle _itemBomba;

	puertacentral animate ["animategatea", 1];
	puertacentral animate ["animategateb", 1];

};
	
if (_param isEqualTo "conducto") exitWith {
	
	if ((puertacentral animationphase "animategatea") != 1) exitWith {hint "Los sistemas informáticos de la carcel no són vulnerables, tienes que abrir las puertas principales."};
	["menu", 0.94, carcel] spawn ica_fnc_ganzua;	// carcel animate ["animateaircon1",1];

};

if (_param isEqualTo "bajar") exitWith {
/*
	if ((count (ropes carcel)) !=0) exitwith {hint "Hay alguien bajando, espera un momento"};
	ropeCreate [carcel, "ACTION_AirCon3", 10, 10, true];
	player allowdamage false;
	sleep 1;
	player attachto [((ropes carcel) select 0),[0,0,0], // esto no esta terminado
	waitUntil {isTouchingGround player};
	player allowdamage true;
	detach player;
*/
	player setpos (carcel modeltoworld [-0.09375,-7.72656,-1.37903]);

};

if (_param isEqualTo "abropuertas") exitWith {

	if ((["O_IR_Grenade"] call ica_fnc_tengo) == 0) exitWith {hint "Necesitas una granada PEM."};
	["O_IR_Grenade", -1] call ica_fnc_item;
	["- O_IR_Grenade"] call ica_fnc_infolog;
	playSound3D ["A3\Sounds_F\sfx\special_sfx\sparkles_wreck_1.wss", player, false, getPosASL player, 1, 1, 0];
	playSound3D ["a3\sounds_f\weapons\smokeshell\smoke_2.wss", player, false, getPosASL player, 1, 1, 0];
	_position = getPos player;
	[_position] remoteexeccall ["life_fnc_castEMP",2];
	[10, "Aviso", [1,0,0], 1.5, "Las puertas de la cárcel están abiertas, los presos se están escapando", [1,1,1], 1] remoteexec ["ica_fnc_anuncio",WEST];
	for '_i' from 1 to 45 do{
	carcel animate [format ['animatecelldoor%1',_i], 1];
	};
	carcel2 animate ["animatefrontdoor",1];
	carcel2 animate ["animatesidedoor",1];
	[getPlayerUID player,name player,"485"] remoteexeccall ["life_fnc_wantedAdd",2];

};

if (_param isEqualTo "sentar") exitWith {
	if (side player != west) exitwith {hint "Solo un oficial puede usar la silla eléctrica"};
	if ((count (attachedObjects bloquevisitas))>0) exitwith {hint "Ya hay alguien en la silla, de uno en uno por favor"};
	_victima = nearestobjects [player,["man"],4] select 1;
	if (isNil "_victima") exitwith {hint "No hay ninguna persona para ejecutar"};
	if ((side _victima) != civilian) exitwith {hint "Solo un civil puede ser ejecutado"};
	_victima attachto [bloquevisitas, [-8.45828,-4.7498,-0.40363]];
	[[_victima,"Crew"],"switchMove",TRUE,FALSE] spawn BIS_fnc_MP;

};

if (_param isEqualTo "ejecuto") exitWith {
	_victima = (attachedObjects bloquevisitas) select 0;
	if (isNil "_victima") exitwith {hint "No hay nadie preparado"};
	[_victima, "Tazersound",100] call CBA_fnc_globalSay3d;
	sleep 5;
	detach _victima;
	_victima setdamage 1;
	_nombrevictima = name _victima;
	[10, "El dpto. penitenciario de Plata o Plomo informa", [1,0,0], 1.5, format["Se ha impartido justicia, %1 acaba de ser ejecutado en la silla eléctrica",_nombrevictima], [1,1,1], 1] remoteexec ["ica_fnc_anuncio",-2];
};

