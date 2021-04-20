/* 
	Creado por Rosen	
*/

private["_query","_queryResult","_arrC"];

_query = "ListarCandidatos";
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

_arrC = [];


for "_idx" from 0 to (count (_queryResult)-1) do {
    _arrC pushBack (_queryResult select _idx select 0); 
};

lista_candidatos = _arrC;