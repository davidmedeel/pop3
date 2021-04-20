/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private["_unit","_damage","_source","_projectile","_part","_curWep", "_isVehicle"];
_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;

if(!isNull _source) then
{
	if(_source != _unit) then
	{
		_curWep = currentWeapon _source;
		_isVehicle = if (vehicle player != player) then {true} else {false};

		/* TAZER */
		if (_curWep in ["Taser_26"]) then {
			_damage = false;
			if (_unit distance _source < 30) then {
				if (!life_istazed && !(_unit getVariable ["restrained", false]) && !_isVehicle) then {
					[_unit, _source] spawn life_fnc_tazed;
				};
			};
		};
	};
};

_damage;