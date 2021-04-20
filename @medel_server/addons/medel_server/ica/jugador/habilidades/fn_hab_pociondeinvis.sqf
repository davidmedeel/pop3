
/*

[] call ica_fnc_hab_pocionDeInvis;
["server"] spawn ica_fnc_hab_pocionDeInvis;
*/

_param = _this select 0;

if (_param isEqualTo "server") exitWith {
	_tio = _this select 1;
	_humillo = _this select 2;
	_tio setvariable ["invisible",true,true];
	_tio hideObjectGlobal true;
	sleep 20;
	_tio hideObjectGlobal false;
	_tio setvariable ["invisible",false,true];
	sleep 1;
	deleteVehicle _humillo;
};

if (_param isEqualTo "preparo") exitWith {

	private "_humillo";
	_humillo = "#particlesource" createVehicle getpos player;  
	_humillo setParticleCircle [0, [0.1, 0.1, 0.1]]; 
	_humillo setParticleRandom [0, [0, 0.1, 1], [0.1, 0, 0.1], 0, 0.1, [0, 0, 0, 0.1], 0, 0]; 
	_humillo setDropInterval 0.1;  
	_humillo attachto [player, [0, 0, 0]]; 
	_humillo setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract", 1, 0, 1], "", "Billboard", 1, 4, [0, 0, 0], [0, 0, 0.5], 9, 10, 7.9, 0.1, [0.6, 1, 0.9, 0.8], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0, 0.1, 0.2, 0.5, 0.1, 0.1], 0, 0, "", "", player]; 
	["server", player, _humillo] remoteexeccall ["ica_fnc_hab_pocionDeInvis",2];
	
};


