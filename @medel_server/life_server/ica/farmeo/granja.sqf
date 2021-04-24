

/*
por: Medel
*/

_param = param [0];

if (_param isEqualTo "Init") exitWith {
	if (player getVariable "trabajandoGranja" isEqualTo 1) exitWith {hint "Ya estás trabajando"};

	["generaHierbas"] spawn ica_fnc_granja;
};

if (_param IsEqualto "generaHierbas") exitWith {
	player setvariable ["trabajandoGranja",1,true];

	hint "Recoje todas los residuos para cobrar!";

	sleep 1;

	_hierba = "Land_WaterBottle_01_compressed_F" createVehicle position player;
	sleep 0.5;
	_hierba1 = "Land_WaterBottle_01_compressed_F" createVehicle position player;
	sleep 0.5;
	_hierba2 = "Land_WaterBottle_01_compressed_F" createVehicle position player;
	sleep 0.5;
	_hierba3 = "Land_WaterBottle_01_compressed_F" createVehicle position player;
	sleep 0.5;
	_hierba4 = "Land_WaterBottle_01_compressed_F" createVehicle position player;

	_hierba addAction ["<t color='#FF0000' size='2'>Recoger</t>", {["recoger"] spawn ica_fnc_granja}];
	_hierba1 addAction ["<t color='#FF0000' size='2'>Recoger</t>", {["recoger"] spawn ica_fnc_granja}];
	_hierba2 addAction ["<t color='#FF0000' size='2'>Recoger</t>", {["recoger"] spawn ica_fnc_granja}];
	_hierba3 addAction ["<t color='#FF0000' size='2'>Recoger</t>", {["recoger"] spawn ica_fnc_granja}];
	_hierba4 addAction ["<t color='#FF0000' size='2'>Recoger</t>", {["recoger"] spawn ica_fnc_granja}];
}; 

if (_param IsEqualto "recoger") exitWith {

	_hierbas = nearestObject [player, "Land_WaterBottle_01_compressed_F"];

	_hierbasRecogidas = player getVariable "hierbasRecogidas";

	player playMoveNow "AinvPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon_medic";

	sleep 2.5;

	_hierbasRecogidas = _hierbasRecogidas + 1;

	hint format ["Has recogido %1/5 residuos", _hierbasRecogidas];

	_hierbas = nearestObject [player, "Land_WaterBottle_01_compressed_F"];

	deleteVehicle _hierbas;

	if (_hierbasRecogidas isEqualTo 5) then {
		player setvariable ["trabajandoGranja",0,true];
		player setVariable ["hierbasRecogidas",0,true];
		hint "Has trabajado duro, aquí tienes tu recompensa";
		medel_din = medel_din + 500;
	};
}; 
