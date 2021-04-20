
if (playerSide != west) exitWith {};

if !(vehicle player != player) exitWith {};

private ["_velocidad","_veh"];

_veh = cursorTarget;
_velocidad = round speed _veh;
_coches = ["alfa_romeo_159_ATGC","citroen_c5_ATGC","ford_mondeo_2016_atgc","ford_mondeo_2016_atgc2","toyota_prado_atgc","renault_trafic_ATGC","nissan_pathfinder_atgc"];

if ((_veh isKindOf "Car") || (((currentWeapon player) isEqualTo "cl_speedgun") OR ((typeof vehicle player) in _coches))) then {
	hint parseText format ["<t color='#ffffff'><t size='5'><t align='center'>Radar<br/><t color='#00ff44'><t align='center'><t size='1.8'>Velocidad del Vehiculo:<br/>%1 km/h", round _velocidad];
};
