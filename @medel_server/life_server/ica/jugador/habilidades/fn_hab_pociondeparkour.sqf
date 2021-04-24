
if (!isNil {parkourUsado}) exitWith {hint "Necesitas descansar 20s"};
[] spawn {
	parkourUsado = true;
	sleep 20;
	parkourUsado = nil;
};
titleText ["3...", "PLAIN"];
sleep 1;
titleText ["2...", "PLAIN"];
sleep 1;
titleText ["1...", "PLAIN"];
sleep 1;

[] spawn {
	player allowdamage false;
	sleep 3;
	waitUntil {isTouchingGround player};
	player allowdamage true;
};

_tio = player;
_vel = velocity _tio;
_dir = direction _tio;
_potencia = 6;
_altura = 10;
_tio setVelocity [
	((_vel select 0) + (sin _dir * _potencia)),
	((_vel select 1) + (cos _dir * _potencia)),
	(_vel select 2) + _altura
];
