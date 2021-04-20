/*
	Creado por Rosen
*/

private["_uid","_query","_queryResult","_candidato","_query2","_queryResult2"];

if(isNil "candidato") exitWith{hint "Seleccione un candidato a votar."};
if(votando) exitWith{hint "Espere a que se procese su voto."};
votando = true;
_uid = getPlayerUID player;
_candidato = candidato;
closeDialog 10720;
hint "Procesando...";
[] remoteexeccall ["ica_fnc_initVotantes",2];
[player, ["lista_votantes"]] spawn ica_fnc_varToServer; waitUntil {recibido};
sleep 6;
_num = lista_votantes find _uid;

if(_num != -1) exitWith{closeDialog 10720;hint "Ya ha votado. Solo puede votar una vez."};

_query = format["Votar:%1", _candidato];
[_query,1,true] remoteexec ["DB_fnc_asyncCall",2];


_query2 = format["UpdateVotantes:%1:%2", _uid, _candidato];
[_query2,1,true] remoteexec ["DB_fnc_asyncCall",2];
hint format["Has votado a %1.", candidato];
votando = false;
