
if (deServicio == 0) exitwith {};

_tio = player;
_vel = velocity _tio;
_dir = direction _tio;
_potencia = 3;
_altura = 8;
_tio setVelocity [
	((_vel select 0) + (sin _dir * _potencia)),
	((_vel select 1) + (cos _dir * _potencia)),
	(_vel select 2) + _altura
];
