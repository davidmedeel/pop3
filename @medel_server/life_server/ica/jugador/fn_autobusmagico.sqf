
/*
por: Icaruk
	0 spawn ica_fnc_autoBusMagico;
	[pos] execVM "ica\jugador\fn_autobusMagico.sqf";
*/

_param = _this select 0;

_pos = switch (typeName _param) do {
	case "OBJECT";
	case "STRING": {[_param] call ica_fnc_getPos};
	case "ARRAY": {_param};
};

_posAnt = getPos player;
player setPos (getMarkerPos "esperaAutobus");

_cam = "camera" camCreate _posAnt;
_cam cameraEffect ["INTERNAL", "BACK"];

// sube
_cam camSetTarget _pos;
_cam camSetPos [_posAnt select 0, _posAnt select 1, 600];
// _cam setVectorDirAndUp [[0, 0, -1], [0, 1, 0]];
_cam camCommit 6;
sleep 3;

// se desplaza
_cam camSetPos [_pos select 0, _pos select 1, 400];
_cam camSetTarget _pos;
_cam camCommit 40;
sleep 35;

// baja
_cam camSetPos [_pos select 0, _pos select 1, 2];
_cam camSetTarget _pos;
_cam camCommit 5;
sleep 5;

_cam cameraEffect ['TERMINATE', 'BACK'];
camDestroy _cam;

player setPos _pos;