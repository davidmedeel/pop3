/*
	File: fn_vehicleCreate.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Answers the query request to create the vehicle in the database.
*/
private["_uid","_side","_type","_classname","_color","_plate"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[west]] call BIS_fnc_param;
_vehicle = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
_color = [_this,3,-1,[0]] call BIS_fnc_param;

//Error checks
if(_uid == "" OR _side == sideUnknown OR isNull _vehicle) exitWith {};
if(!alive _vehicle) exitWith {};
_className = typeOf _vehicle;
_type = switch(true) do
{
	case (_vehicle isKindOf "Car"): {"Car"};
	case (_vehicle isKindOf "Air"): {"Air"};
	case (_vehicle isKindOf "Ship"): {"Ship"};
};

_side = switch(_side) do
{
	case west:{"cop"};
	case civilian: {"civ"};
	case independent: {"med"};
	default {"Error"};
};

_plate = round(random(999999));


/*_letras = "BCDFGHJKLMNPQRSTVXYZ";
for [{_i=0}, {_i<3}, {_i=_i+1}] do
{
    _numero = round(random(16));
    _plate = format ["%1%2", _plate, _letras select [_numero, 1]];
};*/


[_uid,_side,_type,_classname,_color,_plate] spawn DB_fnc_insertVehicle;

_vehicle setVariable["dbInfo",[_uid,_plate]];
_vehicle addEventHandler["Killed","_this spawn TON_fnc_vehicleDead"];

// ica
_vehicle setVariable ["matricula", [] call ica_fnc_creaMatricula, true];

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

