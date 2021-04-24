/*
por: Medel
Desc: Revisa si un efecto debería ser o no renderizado basado en el máximo de 1000.
*/

private ['_pos', '_duration', '_source', '_scope', '_dist', '_target'];
params ['_target'];

//if (count _target  isEqualTo  0) exitWith { false };

_source = [(positionCameraToWorld [0,0,0]), [(positionCameraToWorld [0,0,0]), (positionCameraToWorld [0,0,4])] call ica_fnc_direccion];

_dist = (_target distance (_source select 0));
if (_dist > 1000) exitWith { false };

true
