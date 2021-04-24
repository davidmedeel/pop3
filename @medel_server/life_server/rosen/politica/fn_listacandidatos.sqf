/*  
	Creado por Rosen
*/

private["_display","_lista","_i"];

if!(votacion) exitWith{hint "Las elecciones han terminado. Espere a que se reinicie el sistema."};
if(votando) exitWith{hint "Espere a que se procese su voto"};
[] remoteexeccall ["ica_fnc_initCandidatos",2];

[player, ["lista_candidatos"]] spawn ica_fnc_varToServer; waitUntil {recibido};
hint "Obteniendo lista de candidatos...";
sleep 3;
hint "Lista de candidatos obtenida.";
createDialog "votar";
disableSerialization;
_display = findDisplay 10720;
_lista = _display displayctrl 10721;
lbClear 10721;
_i = 0;
while {_i < count lista_candidatos} do {
	_lista lbAdd (lista_candidatos select _i);
	_lista lbSetData [_i, lista_candidatos select _i];
	_i = _i + 1;
};

_lista ctrlAddEventHandler ["LBSelChanged",{candidato = lbData[10721,(lbCurSel 10721)];}];
