/*
Script por Heisenberg White - Con camiones de combustible , debes de ir de un punto a otro segun mas lejos este esa gasolinera, mas cobraras.
Para Plata o Plomo . WWW.plataoplomo.wtf


	["empezar"] spawn ica_fnc_tanque;
	["llenar"] spawn ica_fnc_tanque;
	["vaciar"] spawn ica_fnc_tanque;
*/ 

_param = param [0];
private ["_veh","_array","_estado","_espacio","_flvl","_distance"];

if (_param isEqualTo "empezar") then {

	if ((count (nearestObjects [player, ["Car"], 5])) > 1) exitWith {hint "Hay muchos vehiculos no se cual es el tuyo";};
	_veh = ((nearestObjects [player, ["Car"], 5]) select 0);
	if (isnil "_veh") exitWith {hint "¿Tu ves algun vehiculo cerca?";};
	_array = ["C_Van_01_fuel_F","Volvo_Cisterna_1","B_Truck_01_fuel_F"];
	
	if !((typeof _veh) in _array) exitwith {hint "El coche que tienes no es el que necesitas para este trabajo";};
	_veh setvariable ["vaciando",false,true];
	if (isNil {_veh getVariable "tanque"}) then {
		_estado = 0;
		_espacio = switch (typeof _veh) do {
			case "C_Van_01_fuel_F": {750};
			case "Volvo_Cisterna_1": {1500};
			case "B_Truck_01_fuel_F": {2000};
		};
	
		_veh setvariable ["tanque",[_espacio,_estado],true];

	} else {
	
		_espacio = (_veh getVariable "tanque") select 0;
		_estado = (_veh getVariable "tanque") select 1;
	
	};
	hint "Tu vehiculo esta preparado para trabajar";

};


if (_param isEqualTo "llenar") then {

	_veh = ((nearestObjects [player, ["Car"], 10]) select 0);
	if (isnil "_veh") exitWith {hint "¿Tu ves algun vehiculo cerca?";};
	_array = ["C_Van_01_fuel_F","Volvo_Cisterna_1","B_Truck_01_fuel_F"];
	if !((typeof _veh) in _array) exitwith {hint "El coche no es el que buscamos para realizar este trabajo";};
	
	if (isNil {_veh getVariable "tanque"}) exitWith {hint "Este vehiculo no esta preparado para trabajar";};
	
	_espacio = (_veh getVariable "tanque") select 0;
	_estado = (_veh getVariable "tanque") select 1;
	
	_veh setVariable ["TUso",[true,name player],true];

	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNamespace getVariable "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format ["Tanque  %1 Litros / %2 Litros",_estado,_espacio];
	_flvl = (1 / _espacio) * _estado;
	_progress progressSetPosition _flvl;

	waitUntil {
		if ((_veh getvariable "TUso" select 1) != name player) exitWith {hint "El vehiculo esta en uso";true};
		if (!alive _veh || isNull _veh) exitWith {true};
		if (isEngineOn _veh) exitWith {hint "Apaga el motor";true};
		if (isNil {_veh getVariable "TUso"}) exitWith {hint "Se ha soltado la manguera";true};
		if (player distance _veh > 20) exitWith {hint "Estas muy lejos, la manguera del combustible se ha soltado";true};

		_estado = _estado + 10;
		_veh setVariable ["tanque",[_espacio,_estado],true];
		_flvl = (1 / _espacio) * _estado;

		_progress progressSetPosition _flvl;
		_pgText ctrlSetText format ["Tanque  %1 Ltr / %2 Ltr",_estado,_espacio];

		if (_estado >= _espacio) exitWith {hint "El tanque esta lleno";true};
		sleep 0.1;
	};

	5 cutText ["","PLAIN"]; 
	_veh setVariable ["TUso",nil,true];
	false


};

if (_param isEqualTo "vaciar") then {

		
		_veh = ((nearestObjects [player, ["C_Van_01_fuel_F","Volvo_Cisterna_1","B_Truck_01_fuel_F"], 5]) select 0);
		if (isnil "_veh") exitWith {hint "¿Tu ves algun vehiculo cerca?";};
		
		_gasolineras = (count (nearestObjects [_veh, ["Land_fs_roof_F","land_mr_dino_gasstation","land_pop_gasolinera"], 10]));
		
	
		if (_gasolineras == 0) exitWith {hint "No hay ninguna gasolinera cerca"};
		
		if (_veh getvariable "vaciando") exitWith {hint "El vehiculo ya esta siendo vaciado..."};
		if ((_veh getvariable "TUso" select 1) != name player) exitwith {hint "El vehiculo esta en uso..."};

	if (isNil {_veh getVariable "tanque"}) then {
		_estado = 0;
		_espacio = switch (typeof _veh) do {
			case "C_Van_01_fuel_F": {750};
			case "Volvo_Cisterna_1": {1500};
			case "B_Truck_01_fuel_F": {2000};
		};
	
		_veh setvariable ["tanque",[_espacio,_estado],true];

	} else {
	
		_espacio = (_veh getVariable "tanque") select 0;
		_estado = (_veh getVariable "tanque") select 1;
	
	};		
		
		
	
		

		if (_estado <= 0) exitWith {
			hint "El tanque esta vacio";
		};

	_estacionestado = 0;
	_random = floor((random 9000) + 1500);

{
    if (isNil {_x getVariable "staciontanque"}) then{
        _x setVariable ["staciontanque",[_random,time],true];
        _estacionestado = _random;
    }else{
        _estacionestado = (_x getVariable "staciontanque") select 0;
        if (_estacionestado <= 0) then {
            if (time >= ((_x getVariable "staciontanque") select 1)) then {
                _x setVariable ["staciontanque",[_random,time],true];
                _estacionestado = _random;
            };
        };
    };
} forEach (nearestObjects [_veh, ["Land_fs_roof_F","land_mr_dino_gasstation","land_pop_gasolinera"], 20]);

if (_estacionestado <= 0) exitWith {hint "La estacion ya tiene suficiente gasolina";};

_shortest = 100000;
{
    _distance = _veh distance (getMarkerPos _x);
    if (_distance < _shortest) then {_shortest = _distance};
} forEach ["gasolina1"];

if (_distance < 1000) exitWith {hint "Esta estacion no necesita suministro";};

_pricem = (missionNamespace getvariable ["combustible",0.15]);
_price = floor((((floor(_shortest / 100) * 100) / 1337) * _pricem) * 100) / 100;
_win = 0;

_veh setVariable ["TUso",[true,name player],true];
_veh setvariable ["vaciando",true,true];
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format ["Tank  %1 Ltr / %2 Ltr",_estado,_espacio];
_flvl = (1 / _espacio) * _estado;
_progress progressSetPosition _flvl;

waitUntil {
	if ((_veh getvariable "TUso" select 1) != name player) exitWith {hint "El tanque esta en uso"; true};
    if (!alive _veh || isNull _veh) exitWith {true};
    if (isEngineOn _veh) exitWith {hint "Apaga el vehiculo antes de continuar"; true};
    if (isNil {_veh getVariable "TUso"}) exitWith {hint "Algo ha ido mal . El vehiculo esta en uso"; true};
    if (player distance _veh > 10) exitWith {hint "Estas muy lejos de tu vehiculo. La manguera se ha caido"; true};

    _estado = _estado - 10;
    _estacionestado = _estacionestado - 10;

    _win = _win + (_price * 100);
    _veh setVariable ["Tanque",[_espacio,_estado],true];

    _flvl = (1 / _espacio) * _estado;
    _progress progressSetPosition _flvl;
    _pgText ctrlSetText format ["Tank  %1 Ltr / %2 Ltr  ( %3€ / Ltr )",_estado,_espacio,_price];

    if (_estado isEqualTo 0 || _estacionestado <= 0) exitWith {true};

    sleep 0.1;
    false
};

{
    if (_estacionestado <= 0) then {
        _x setVariable ["staciontanque",[0,(time + 1800)],true];
    } else {
        _x setVariable ["staciontanque",[_estacionestado,time],true];
    };
} forEach (nearestObjects [_veh, ["Land_fs_roof_F","land_mr_dino_gasstation","land_pop_gasolinera"], 20]);

if (_estacionestado <= 0) then {hint "El surtidor esta lleno de gasolina";};
if (_estado <= 0) then {hint "El tanque esta vacio";};
sleep 2;

medel_din = medel_din + _win;
[format ["+ %1 €", _win]] call ica_fnc_infolog;
if (_win > 10000) then {["exp",2] call ica_fnc_arrayexp;[format ["+ %1 EXP", 1]] call ica_fnc_infolog};

[0] call SOCK_fnc_updatePartial;


hint format ["Has ganado %1 €",_win];
5 cutText ["","PLAIN"];
_veh setVariable ["Tuso",nil,true];
_veh setvariable ["vaciando",false,true];


};

