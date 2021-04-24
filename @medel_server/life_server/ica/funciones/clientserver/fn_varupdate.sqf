
/*
por: Icaruk

*/
private ["_arrayVars", "_idx"];

_arrayVars = _this;

_idx = 0;
while {_idx < (count _arrayVars)} do {
	missionNamespace setVariable [_arrayVars select _idx, _arrayVars select (_idx + 1)];
	
	_idx = _idx + 2;
};

recibido = true;