
/*
por: Icaruk
	[true] spawn ica_fnc_vistaBonita;
	[false] spawn ica_fnc_vistaBonita;
	[false, false] spawn ica_fnc_vistaBonita; // elimina cámara y efectos
*/

private ["_array", "_pos", "_dir", "_incl"];

_param = _this select 0;


if (_param) then {
	_array = [
		[[891.438,9899.46,0.452698], 241, 28],
		[[5018.22,8796.3,3.02798], 242, -6],
		[[3601.23,7636.93,11.3059], 211, -13],
		[[8037.87,2395.72,34.8205], 203, -2],
		[[8886.8,7411.17,25.3848], 28, -12],
		[[6407.79,4159.15,25.0697], 70, -3],
		[[5108.01,2144.56,41.7563], 322, -7],
		[[4569.75,2317.36,0.0], 220, -2]

	] call BIS_fnc_selectRandom;
} else {
	_array = [
	[[891.438,9899.46,0.452698], 241, 28],
	[[5018.22,8796.3,3.02798], 242, -6],
	[[3601.23,7636.93,11.3059], 211, -13],
	[[8037.87,2395.72,34.8205], 203, -2],
	[[8886.8,7411.17,25.3848], 28, -12],
	[[6407.79,4159.15,25.0697], 70, -3],
	[[5108.01,2144.56,41.7563], 322, -7],
	[[4569.75,2317.36,0.0], 220, -2]
	] call BIS_fnc_selectRandom;
};

if (!isNil {_this select 1}) exitWith {camaraInicial cameraEffect ['TERMINATE', 'BACK']; camaraInicial = nil; ppEffectDestroy borrInicial; borrInicial = nil};

_pos = _array select 0;
_dir = _array select 1;
_incl = _array select 2;

camaraInicial = "camera" camCreate _pos;
camaraInicial setDir _dir;
[camaraInicial, _incl, 0] call BIS_fnc_setpitchbank;
camaraInicial cameraEffect ["INTERNAL", "BACK"];

if (((date select 3) >= 20) OR ((date select 3) < 5)) then {
	camUseNVG true;
};

borrInicial = ppEffectCreate ["DynamicBlur", 450];
borrInicial ppEffectEnable true;
borrInicial ppEffectAdjust [1.5];
borrInicial ppEffectCommit 0;
