/* 
	Creado por Rosen	
*/

private["_query","_queryResult","_arrV"];

_query = "ListarVotantes";
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

_arrV = [];


for "_idx" from 0 to (count (_queryResult)-1) do {
    _arrV pushBack (_queryResult select _idx select 0); 
};

lista_votantes = _arrV;