
/*
por: Icaruk
	[obj, [0,50,1]] call ica_fnc_setVelocity;
*/

private ["_o", "_vector"];

_o = _this select 0;
_vector = _o modelToWorld (_this select 1) vectorDiff (_o modelToWorld [0,0,0]);
_vector set [2, _this select 1 select 2];
_o setVelocity _vector;
