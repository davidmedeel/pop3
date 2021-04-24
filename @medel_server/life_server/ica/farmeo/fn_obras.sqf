
/*
por: Neoxan
	["reparo"] spawn ica_fnc_obras;
	["solicito"] call ica_fnc_obras;
	["descargo"] call ica_fnc_obras;
	["fianza"] call ica_fnc_obras;
*/

_param = _this select 0;

if (_param isEqualTo "reparo") exitWith {

	_objetos = nearestObjects [player, [], 20];
	_i = 0;
	{
		if (!((_x iskindof "man") or (_x iskindof "car") or (_x iskindof "ship") or (_x iskindof "air") or (damage _x == 0))) then {
			_x setdamage 0;
			_i = _i + 1;
		};
	} foreach _objetos;

	if (_i == 0) exitwith {hint "Parece que aquí no había nada que reparar"};
	[_i, "Reparando..."] spawn ica_fnc_barrita;
	sleep _i;
	if (_i > 0 && _i <= 3) exitwith {
		hint format ["Algo había, has reparado %1", _i];
		_a = "Land_Bricks_V2_F" createvehicle position player;
		_a setvariable ["obrero",name player,true];
		[_a, 60*30] call ica_fnc_borrame;
	};
	if (_i > 3 && _i <= 6) exitwith {
		hint format ["No está nada mal, has reparado %1 objetos", _i];
		_a = "Land_Bricks_V1_F" createvehicle position player;
		_a setvariable ["obrero",name player,true];
		[_a, 60*30] call ica_fnc_borrame;
	};
	if (_i > 6) exitwith {
		hint format ["Había bastante, has reparado %1 objetos", _i];
		_a = "Land_Bricks_V4_F" createvehicle position player;
		_a setvariable ["obrero",name player,true];
		[_a, 60*30] call ica_fnc_borrame;
	};
};

if (_param isEqualTo "solicito") exitWith {
	if (deServicio == 1) exitwith {hint "Estás de sercivio, ¿Te parece poco la paguita de admin?";};
	if (!license_civ_driver) exitwith {hint "No tienes carnet de conducir B, no puedes conducir este camión!"};
	if (medel_din < 15000) exitwith {hint "La fianza del camión son 15000 €"};
	medel_din = medel_din - 15000;
	_veh = "pop_man_obras_negro" createvehicle position player;
	_veh setvariable ["cargando",false,true];
	_veh setvariable ["propietario",name player,true];
	_code = '
	if (name player != (vehicle player getvariable "propietario")) then {
		moveout player;
		hint "Esta grúa sólo puede ser operada por su dueño, fuera de aquí";
		};
	';
	[_veh, "getIn", _code, true] call ica_fnc_addEH;
	_veh setVariable ["dbInfo",[(getPlayerUID player), 0],true];
	_mat = format["OP-%1-AL", round(random(9999))];
	_veh setVariable ["matricula", _mat, true];
	player setvariable ["uniforme",uniform player,true];
	player adduniform "U_C_WorkerCoveralls";
	hint "Todo listo, busca objetos rotos, ponte detrás del camión y reparalos, recoge los escombros con la grúa, cargalos en el camión y descárgalos en el área indicada";
	[] spawn {
		recorrido = 0;
		while {recorrido < 300} do {
			hintSilent format ["%1%2",round((recorrido*100)/300),"%"];
			if (recorrido >= 300) exitwith {hint "¡Venga currante, ya puedes traerme lo que has conseguido!"};
			if (vehicle player != player && speed player > 5) then{recorrido = recorrido + 1;};
			sleep 1;
		};
	};
};

if (_param isEqualTo "fianza") exitWith {
	if ((count (nearestObjects [player, ["man"], 4]))>1) exitwith {hint "De uno en uno por favor"};
	_veh = nearestObject [player, "pop_man_obras_negro"];
	if (isnil "_veh") exitwith {hint "No veo cerca ningún camión"};
	if ((player distance _veh)>10) exitwith {hint "Acerca el camión"};
	_propietario = _veh getvariable "propietario";
	if (name player != _propietario) exitwith {hint "Este camión no esta registrado a tu nombre"};
	deletevehicle _veh;
	_uniforme = player getvariable "uniforme";
	player adduniform _uniforme;
	medel_din = medel_din + 15000;
	hint "Todo listo, el camión está guardado en el garage municipal, vuelve a por más trabajo cuando quieras";
};

if (_param isEqualTo "descargo") exitWith {
	_veh = nearestObject [player, "pop_man_obras_negro"];
	if ((count (nearestObjects [player, ["man"], 4]))>1) exitwith {hint "De uno en uno por favor"};
	if (recorrido < 298) exitWith {hint "¡No seas gandul! Aún no has trabajado lo suficiente."};
	_cargo = [];
	_marker = ["obras1", "obras2", "obras3"] call ica_fnc_masCercano;
	_pos = markerpos _marker;
	_cargo = nearestObjects [_pos, ["Land_Bricks_V2_F","Land_Bricks_V1_F","Land_Bricks_V4_F"], 20];
	if (isNil "_cargo") exitwith {hint "No me has traido nada, ponte a currar"};
	_descarga = 0;
	_propiedad = 0;
	_amarrepos = _veh selectionPosition "carga";
	_cargopos = _veh modelToWorld _amarrepos;
	{
		if ((_x distance _cargopos) < 4) then {
			_descarga = _descarga + 1;
		};
	} foreach _cargo;
	{
		if ((_x getvariable "obrero") != name player) then {
			_propiedad = _propiedad + 1;
		};
	} foreach _cargo;
	if (_propiedad >= 1) exitwith {hint "Aquí hay cosas que no son tuyas, apártalas con la grúa"};
	if (_descarga >= 1) exitwith {hint "Tienes que descargarlo del camión, no me voy a ensuciar las manos para que ganes dinero"};
	_cargo1 = nearestObjects [_pos, ["Land_Bricks_V2_F"], 20];
	_cargo2 = nearestObjects [_pos, ["Land_Bricks_V1_F"], 20];
	_cargo3 = nearestObjects [_pos, ["Land_Bricks_V4_F"], 20];
	{
		if ((_x getvariable "obrero") == name player) then {
			deletevehicle _x;
		};
	} foreach _cargo;
	_exp = ((count _cargo1) + (count _cargo2)*5 + (count _cargo3)*10);
	_valor = 1000*((count _cargo1) + (count _cargo2)*3 + (count _cargo3)*6);
	if (_valor == 0) exitwith {hint"Ponte a currar cacho vago"};
	hint format ["Genial, aquí tienes la recompensa, son %1 €, ve a por más escombros o devuelve el camión y gastate lo que has ganado en las tragaperras como buen obrero", _valor];
	medel_din = medel_din + _valor;
	recorrido = nil;
	[format ["+ %1€", _valor]] call ica_fnc_infolog;
	["exp",_exp] call ica_fnc_arrayexp;
};
