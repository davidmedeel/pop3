
/*
por: Icaruk
	[2] spawn ica_fnc_borroso;
	de 0.5 a 2
	lo convierto x2
*/

_n = (_this select 0) * 2;

private ["_blur"];
_blur = ppEffectCreate ["DynamicBlur", 10];
_blur ppEffectEnable true;
_blur ppEffectAdjust [_n];
_blur ppEffectCommit 2;
sleep 2;
_blur ppEffectAdjust [0];
_blur ppEffectCommit 3;
sleep 3;
ppEffectDestroy _blur;
