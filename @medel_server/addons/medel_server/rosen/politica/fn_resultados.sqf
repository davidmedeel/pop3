/* 
	Creado por Rosen
*/

private["_query", "_queryResult", "_ganador","_str"];

if!(votacion) exitWith {hint "Las elecciones han terminado."};
_ganador = param[0];

_str = format ["El nuevo presidente es: %1", _ganador];
[15, "Han acabado las elecciones", [1,0,1], 1.5, _str, [1,1,1], 1] remoteexec ["ica_fnc_anuncio",-2];

_query = "Reiniciar";
[_query,1,true] remoteexec ["DB_fnc_asyncCall",2];
_query2 = "ReiniciarV";
[_query2,1,true] remoteexec ["DB_fnc_asyncCall",2];

votacion = false;