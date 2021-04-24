/* Creado por Rosen */ 

_param = param[0];
if (_param  isEqualTo  "sentar") exitWith {
	if (side player != west) exitwith {hint "Policias only."};
	if ((count (attachedObjects silla_electrica))>0) exitwith {hint "Ya hay alguien en la silla."};
	_victima = nearestobjects [player,["man"],2] select 1;
	if (isNil "_victima") exitwith {hint "No hay ninguna persona para ejecutar."};
	_victima attachto [silla_electrica, [-1,-1,0]];
	[_victima,"Crew"] remoteExec ["switchMove", -2];
};

if (_param  isEqualTo  "usar") exitWith {
	_victima = (attachedObjects silla_electrica) select 0;
	if (isNil "_victima") exitwith {hint "No hay nadie en la silla."};
	[silla_electrica, "sillaElectrica"] call CBA_FNC_GlobalSay3d;
	sleep 14;
	_victima setdamage 1;
	sleep 1;
	detach _victima;
	_nombrevictima = name _victima;
	[10, "El dpto. penitenciario de Lakeside informa", [1,0,0], 1.5, format["Se ha impartido justicia, %1 acaba de ser ejecutado en la silla electrica.", _nombrevictima], [1,1,1], 1] remoteexec ["ica_fnc_anuncio", -2];
};
