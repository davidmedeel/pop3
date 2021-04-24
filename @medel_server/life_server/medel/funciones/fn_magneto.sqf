//
//      Efecto de refaccion magnetico
//

private ['_target', '_pos', '_duration', '_size'];
_target = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_duration = [_this,1, 1, [0]] call BIS_fnc_param;
_scale = [_this,2, 1, [0]] call BIS_fnc_param;

if (isNull _target || _duration < 0) exitWith { hint "No tengo target o duracion";};

_pos = (ASLtoATL visiblePositionASL _target);
_isVisible = [_pos, _duration] call ica_fnc_efectoEsVisible;
if (!_isVisible) exitWith {};

_source  = "#particlesource" createVehicle _pos;
_source setParticleCircle [0, [0, 0, 0]];
_source setParticleRandom [0.2, [15 * _scale, 15 * _scale, 0], [0, 0, 0], 1, 0.5, [0, 0, 0, 0], 0, 0];
_source setDropInterval 0.01;
_source attachTo [_target];

_source setParticleParams
[
	["\A3\data_f\ParticleEffects\Universal\Refract",1, 0, 1, 0],						
	"",																		
	"Billboard",															
	1,																		
	0.15,																	
	[0, 0, 0],																
	[30 * _scale, 30 * _scale, 0],											
	0,																		
	3,																		
	3,																		
	0.1,																	
	[5 * _scale, 60 * _scale],																	
	[[1, 1, 1, 1], [1, 1, 1, 0.7],  [1, 1, 1, 0.1]],													
	[1],					  												
	0,																		
	0,																		
	"",																		
	"",																		
	_target																	
];	

sleep _duration;

deleteVehicle _source;
