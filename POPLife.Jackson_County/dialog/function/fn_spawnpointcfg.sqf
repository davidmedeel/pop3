
private["_side","_return"];

_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

switch (_side) do
{
	case west:
	{
		_return = [
			["cop_spawn_1","Lakeside","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
			["cop_spawn_2","Los Diablos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_3","New Morrison","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
			["cop_spawn_4","Carcel","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
			["militar_spawn","Fuerzas Armadas","\a3\ui_f\data\map\Markers\NATO\b_air.paa"]
		];
	};
	
	case civilian:
	{
		_return = [
			["civ_spawn_1","Lakeside","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_2","New Morrison","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_3","San Cristobal","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_4","Los Diablos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];

  if (count life_houses > 0) then {
    {
      _pos = call compile format ["%1",(_x select 0)];
      _house = nearestObject [_pos, "House"];
      _houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
      _return pushBack [format ["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
      
      true
    } count life_houses;
  };
};

	case independent: {
		_return = [
			["medic_spawn_1","Lakeside","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_2","New Morrison","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			//["medic_spawn_3","Bagango","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_4","Los Diablos","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
	};
	
	case east: {
		_return = [
			["op_spawn","Corazol","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["op_spawn1","Paraiso","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["op_spawn2","Bagango","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]			
		];
	};
	
};

_return;
