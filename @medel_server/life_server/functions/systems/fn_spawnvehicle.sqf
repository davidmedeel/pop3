/*
	File: fn_spawnVehicle.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sends the query request to the database, if an array is returned then it creates
	the vehicle if it's not in use or dead.
*/
private["_vid","_sp","_pid","_query","_sql","_vehicle","_nearVehicles","_name","_side","_tickTime","_dir","_fuel"];
_vid = [_this,0,-1,[0]] call BIS_fnc_param;
_pid = [_this,1,"",[""]] call BIS_fnc_param;
_sp = [_this,2,[],[[],""]] call BIS_fnc_param;
_unit = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param;
_price = [_this,4,0,[0]] call BIS_fnc_param;
_dir = [_this,5,0,[0]] call BIS_fnc_param;
_unit_return = _unit;
_name = name _unit;
_side = side _unit;
_unit = owner _unit;

if(_vid == -1 OR _pid == "") exitWith {};
if(_vid in serv_sv_use) exitWith {};
serv_sv_use pushBack _vid;

_query = format["GetPlayerVehicleSpawn:%1:%2",_vid,_pid];

waitUntil{sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,2] call DB_fnc_asyncCall;

if(typeName _queryResult == "STRING") exitWith {};

_fuel = parseNumber(_queryResult select 9);

_vInfo = _queryResult;
if(isNil "_vInfo") exitWith {serv_sv_use = serv_sv_use - [_vid];};
if(count _vInfo == 0) exitWith {serv_sv_use = serv_sv_use - [_vid];};

if((_vInfo select 5) == 0) exitWith
{
	serv_sv_use = serv_sv_use - [_vid];
	[1,format[(localize "STR_Garage_SQLError_Destroyed"),_vInfo select 2]] remoteexeccall ["life_fnc_broadcast",_unit];
};

if((_vInfo select 6) == 1) exitWith
{
	serv_sv_use = serv_sv_use - [_vid];
	[1,format[(localize "STR_Garage_SQLError_Active"),_vInfo select 2]] remoteexeccall ["life_fnc_broadcast",_unit];
};
if(typeName _sp != "STRING") then {
	_nearVehicles = nearestObjects[_sp,["Car","Air","Ship"],10];
} else {
	_nearVehicles = [];
};
if(count _nearVehicles > 0) exitWith
{
	serv_sv_use = serv_sv_use - [_vid];
	[_price,_unit_return] remoteexeccall ["life_fnc_garageRefund",_unit];
	[1,(localize "STR_Garage_SpawnPointError")] remoteexeccall ["life_fnc_broadcast",_unit];
};

_query = format["SetSpawnVehicleActive:1:%1:%2",_pid,_vid];

waitUntil {!DB_Async_Active};
_GCrepaint = false;

[_query,false] spawn DB_fnc_asyncCall;
if(typeName _sp == "STRING") then {
	_vehicle = createVehicle[(_vInfo select 2),[0,0,999],[],0,"NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
	_vehicle allowDamage false;
	_hs = nearestObjects[getMarkerPos _sp,["Land_Hospital_side2_F"],50] select 0;
	_vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
	_vehicle setFuel _fuel;
	sleep 0.6;
} else {
	if (_className isEqualTo "pop_mercedes_benz_vito_atgc1") then {
		_className = "pop_mercedes_benz_vito_cnp1";
		_GCrepaint = true;
	};
	
	_vehicle = createVehicle [(_vInfo select 2),_sp,[],0,"NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
	
	if (_GCrepaint) then {
		_vehicle setObjectTextureGlobal [0, "pop_coches_policia\pop_mercedes_benz_vito_gc\data\texturas\gc.paa"];
	};
	
	_vehicle allowDamage false;
	_vehicle setPos _sp;
	_vehicle setVectorUp (surfaceNormal _sp);
	_vehicle setDir _dir;
	_vehicle setFuel _fuel;
};

if (_vehicle isKindOf "Air") then {
	_str = '
		_veh = _this select 0;
		_pos = _this select 1;
		_tio = _this select 2;

		//hint format ["veh %1\n pos %2\n unit %3", _veh, _pos, _tio];

		if (player == _tio) then {
			if !(("con" call ica_fnc_expToLevel) >= 6) then {
				if (_pos == "driver") then {
					moveOut _tio;
					titleText ["No sabes pilotar esto, será mejor que no toques nada", "PLAIN"];
				};
				if (_pos == "gunner") then {
					if (isCopilotEnabled _veh) then {
						_veh enableCopilot false;
					};
				};
			} else {
				if !(isCopilotEnabled _veh) then {
					_veh enableCopilot true;
				};
			};
		};

	';
	[_vehicle, "getIn", _str, true] call ica_fnc_addEH;
};


_vehicle spawn {
	sleep 2;
	_this allowDamage true;
};

//Send keys over the network.
[_vehicle] remoteexec ["life_fnc_addVehicle2Chain",_unit];
[_pid,_side,_vehicle,1] call TON_fnc_keyManagement;
_vehicle lock 2;
//Reskin the vehicle
[_vehicle,_vInfo select 8] remoteexec ["life_fnc_colorVehicle",0];
_vehicle setVariable["vehicle_info_owners",[[_pid,_name]],true];
_vehicle setVariable["dbInfo",[(_vInfo select 4),_vInfo select 7]];

_vehicle addEventHandler["Killed","_this spawn TON_fnc_vehicleDead"]; //Obsolete function?
[_vehicle] call life_fnc_clearVehicleAmmo;
_cde = '
	_armado = _this select 2;
	if ((player == _armado) && !(player getvariable "dolor")) then {
		life_curWep_h = currentWeapon player;
		player action ["SwitchWeapon", player, player, 100];
		player switchcamera cameraView;
	};
	if ((player == _armado) && (player getvariable "dolor")) then {
		[player,true]spawn ica_fnc_inconsciente;
		titleText ["Debería ir al hospital", "PLAIN"];
	};
';
[_vehicle, "getOut", _cde, true] call ica_fnc_addEH;

_gin = '
			_sitio = _this select 1;
			_pavo = _this select 2;
			if (player == _pavo) then {
				if ((player getvariable "dolor") && (_sitio == "driver")) then {
					moveOut _pavo;
					titleText ["No estas en condiciones para conducir", "PLAIN"];
				};
			};
		';
[_vehicle, "getIn", _gin, true] call ica_fnc_addEH;
_swit = '
			_dolorido = _this select 1;
			if (player == _dolorido) then {
				if (player getvariable "dolor") then {
					moveOut _dolorido;
					[_dolorido,true]spawn ica_fnc_inconsciente;
					titleText ["Estás dolorido, no andes cambiando de asiento", "PLAIN"];
				};
			};
		';
[_vehicle, "SeatSwitched", _swit, true] call ica_fnc_addEH;


//Sets of animations
if((_vInfo select 1) == "civ" && (_vInfo select 2) == "B_Heli_Light_01_F" && _vInfo select 8 != 13) then
{
	[_vehicle,"civ_littlebird",true] remoteexeccall ["life_fnc_vehicleAnimate",_unit];
};

if((_vInfo select 1) == "cop" && (_vInfo select 2) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F"]) then
{
	[_vehicle,"cop_offroad",true] remoteexeccall ["life_fnc_vehicleAnimate",_unit];
};

if((_vInfo select 1) == "med" && (_vInfo select 2) == "C_Offroad_01_F") then
{
	[_vehicle,"med_offroad",true] remoteexeccall ["life_fnc_vehicleAnimate",_unit];
};

// ica
_vehicle setVariable ["matricula", [_vid] call ica_fnc_creaMatricula, true];
if (_vehicle isKindOf "Air") then {

 	_str = '
		_veh = _this select 0;
		_pos = _this select 1;
		_tio = _this select 2;

		//hint format ["veh %1\n pos %2\n unit %3", _veh, _pos, _tio];

		if (player == _tio) then {
			if !(("con" call ica_fnc_expToLevel) >= 6) then {
				if (_pos == "driver") then {
					moveOut _tio;
					titleText ["No sabes pilotar esto, será mejor que no toques nada", "PLAIN"];
				};
				if (_pos == "gunner") then {
					if (isCopilotEnabled _veh) then {
						_veh enableCopilot false;
					};
				};
			} else {

			};
		};
	';
	[_vehicle, "getIn", _str, true] call ica_fnc_addEH;
};


[1,"Tu vehículo está listo!"] remoteexeccall ["life_fnc_broadcast",_unit];
serv_sv_use = serv_sv_use - [_vid];




/*
if (_vehicle isKindOf "Air") then {

	_str = '
		_yo = _this select 2;
		if (_yo == player) then {
			_veh = _this select 0;
			if (_veh isKindOf "Air") then {
				if !(("con" call ica_fnc_expToLevel) >= 6) then {
					if (((assignedVehicleRole _yo) select 0) == "Driver") then {
						moveOut _yo;
						hint "No sabes pilotar esto, será mejor que no toques nada";
					};
					if (((assignedVehicleRole _yo) select 0) == "Turret") then {
						if (isCopilotEnabled _veh) then {
							_veh enableCopilot false;
						};
					};
				};
			};
		};
	';
	[_vehicle, "getIn", _str, true] call ica_fnc_addEH;
};