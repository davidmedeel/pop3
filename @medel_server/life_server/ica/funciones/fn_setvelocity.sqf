
/*
por: Killzone_Kid
	[obj, [-5,0,0]] call ica_fnc_setVelocity;
*/

private "_o";
_o = _this select 0;
_o setVelocity (
	_o modelToWorld (_this select 1) vectorDiff (_o modelToWorld [0,0,0])
);
