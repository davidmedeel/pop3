
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
		[[12792.8,8743.83,95.1582], 71, -17], 
		[[13548.1,9737.47,5.42019], 46.7, -15], 
		[[15172.5,8831.72,10.5308], 344, -3], 
		[[16356.8,9116.35,72.2596], 305, -17], 
		[[12581.9,10835.9,1.39648], 127, 1], 
		[[13477.8,11335.6,2.70186], 214, -3], 
		[[14001.4,11282.7,28.8593], 315, -19], 
		[[8969.7,14853,12.4713], 85, -0.2],
		[[12474.8,6974.91,40.3765], 17, -25], 
		[[11071.8,7495.68,0], 301, 10], 
		[[10042.6,6405.77,4.79684], 240, -18],
		[[10645.8,4614.96,34.3392], 4, -24]
		
	] call BIS_fnc_selectRandom;
} else {
	_array = [
		[[13343.5,11357.4,11.9951], 62, -31], 
		[[12516.3,7004.75,11.9799], 32, -44]
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



