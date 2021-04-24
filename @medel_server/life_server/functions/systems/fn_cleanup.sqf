
/*
	File: fn_cleanup.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Server-side cleanup script on vehicles.
	Sort of a lame way but whatever.
*/
private["_deleted"];
_deleted = false;
while {true} do
{
	private["_veh","_units"];
	sleep (20 * 60);
	{
		_veh = _x;
		_vehicleClass = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "vehicleClass");

		if(_vehicleClass in ["Car","Air","Ship","Armored","Submarine"]) then
		{
			_dbInfo = _veh getVariable["dbInfo",[]];
			_units = {(_x distance _veh < 150)} count playableUnits;
			if(count crew _x == 0) then
			{
				switch (true) do
				{
					case ((_x getHitPointDamage "HitEngine") > 0.7 && _units == 0) : {deleteVehicle _x; _deleted = true;};
					case ((_x getHitPointDamage "HitLFWheel") > 0.98 && _units == 0) : {deleteVehicle _x; _deleted = true;};
					case ((_x getHitPointDamage "HitLF2Wheel") > 0.98 && _units == 0) : {deleteVehicle _x; _deleted = true;};
					case ((_x getHitPointDamage "HitRFWheel") > 0.98 && _units == 0) : {deleteVehicle _x; _deleted = true;};
					case ((_x getHitPointDamage "HitRF2Wheel") > 0.98 && _units == 0) : {deleteVehicle _x; _deleted = true;};
					case (_units == 0): {deleteVehicle _x; _deleted = true;};
				};
			};

			if(_deleted) then {
				waitUntil {isNull _veh};
				_deleted = false;
			};

			if(isNull _veh) then
			{
				systemChat "VEH NULL";
				if(count _dbInfo > 0) then
				{
					systemChat "Fixing...";
					_uid = _dbInfo select 0;
					_plate = _dbInfo select 1;

					_query = format["SetAliveVehicleByPidId:0:%1:%2:%3",_uid,_plate,fuel _veh];
					waitUntil {!DB_Async_Active};
					[_query,1] call DB_fnc_asyncCall;
				};
			};
		};
	} foreach vehicles;

	sleep (3 * 60); //3 minute cool-down before next cycle.
	{
		if((typeOf _x) in ["Land_Money_F"]) then
		{
			deleteVehicle _x;
		};
	} foreach (allMissionObjects "Thing");

	sleep (2 * 60);
	{
		deleteVehicle _x;
	} foreach (allMissionObjects "GroundWeaponHolder");
};