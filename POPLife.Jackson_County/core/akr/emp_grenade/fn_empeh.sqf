/*
	File: fn_EMPEH.sqf
	Author: Akryllax
	Desc: Set's and EMP EH for the player.
*/

private ["_player", "_weapon", "_muzzle", "_mode", "_ammo", "_mag", "_proj"];

_player = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_weapon = [_this, 1, "", [""]] call BIS_fnc_param;
_muzzle = [_this, 2, "", [""]] call BIS_fnc_param;
_mode 	= [_this, 3, "", [""]] call BIS_fnc_param;
_ammo	= [_this, 4, "", [""]] call BIS_fnc_param;
_mag	= [_this, 5, "", [""]] call BIS_fnc_param;
_proj	= [_this, 6, objNull, [objNull]] call BIS_fnc_param;

_string = format["Player: %1\nWeapon: %2\nMuzzle: %3\nMode: %4\nAmmo: %5\nMagazine: %6\nProjectile: %7", _player, _weapon, _muzzle, _mode, _ammo, _mag, _proj];

AKR_grenadeProcessor = {
	_grenade = _this select 0;

	diag_log format["Recieved grenade: %1. Is alive?: %2", _grenade, alive _grenade];
	
	_timeStamp = time;

	waitUntil{(isTouchingGround _grenade) || (time - _timeStamp > 4)};
	if(isTouchingGround _grenade && (time - _timeStamp < 4)) then {
		sleep 2;
		[_grenade] spawn AKR_detonateEMP;
	} else {
		[_grenade] spawn AKR_detonateEMP;
	};

	diag_log format["Time delay: %1", time - _timeStamp];
};

AKR_detonateEMP = {
	_grenade = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_position = getPos _grenade;
	
	[_grenade] remoteexeccall ["life_fnc_dropMP",-2];
	playSound3D ["A3\Sounds_F\sfx\special_sfx\sparkles_wreck_1.wss", _grenade, false, getPosASL _grenade, 1, 1, 0];
	playSound3D ["a3\sounds_f\weapons\smokeshell\smoke_2.wss", _grenade, false, getPosASL _grenade, 1, 1, 0];
	
	_grenade enableSimulationGlobal  false;
	
	sleep 1;
	
	deleteVehicle _grenade;

	[_position] remoteexeccall ["life_fnc_castEMP",-2];
};

if(_weapon isEqualTo "Throw") then {
	if(_mag isEqualTo "O_IR_Grenade") then {
		_string = _string + format["\nIs EMP"];
		[_proj] spawn AKR_grenadeProcessor;
		/*
		player addMagazine "O_IR_Grenade";
		*/
	};
};

AKR_EMPdmg = {

	_unit 			= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_selectionName 	= [_this, 1, "", [""]] call BIS_fnc_param;
	_damage			= [_this, 2, -1, [-1]] call BIS_fnc_param;
	_source			= [_this, 3, objNull, [objNull]] call BIS_fnc_param;
	_projectile		= [_this, 4, "", [""]] call BIS_fnc_param;
	
	if(_projectile isEqualTo "R_TBG32V_F") exitWith {
		0
	};
};

if(_weapon isEqualTo "launch_RPG32_F") then {
	if(_mag isEqualTo "RPG32_HE_F") then {
		_pos = getPos _proj;
		_nearEntitites = _pos nearObjects 1000;
		_handled = [];
		{
			if(_x isKindOf "AllVehicles") then {
				_ind = _x addEventHandler["HandleDamage", AKR_EMPdmg];
				_handled pushBack [_x,_ind];
			};
		} forEach (_nearEntitites);
	
		[_proj, _handled] spawn {
			_proj	= _this select 0;
			_handled = _this select 1;
			
			_initialPos = getPos _proj;
			
			waitUntil{(getPos _proj distance _initialPos) > 300 || (isNull _proj)};
			
			if( ((getPos _proj) distance _initialPos) > 300 ) then {
				_proj setDamage	1;
			};
			
			{
				(_x select 0) removeEventHandler["HandleDamage", (_x select 1)];
			} forEach _handled;
		};
	};
};

//hintSilent _string;