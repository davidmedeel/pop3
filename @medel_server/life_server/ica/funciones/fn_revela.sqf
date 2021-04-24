
/*
por Icaruk
	call ica_fnc_revela; 
*/

private["_obj"];
_obj = nearestObjects [player, [], 5];
{ player reveal _x} foreach _obj;
