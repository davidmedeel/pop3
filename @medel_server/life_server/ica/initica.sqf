
/*
por: Icaruk
	NO SE USA
*/

if (isServer) exitWith {}; // esto es para clientes


//0 spawn ica_fnc_climaCliente;
waitUntil {!isNil {experiencia}};

0 spawn ica_fnc_initExp;
0 spawn ica_fnc_impuestos;
["init"] call ica_fnc_comoBebo;
[] call ica_fnc_initHabilidades;
0 spawn ica_fnc_consumo;
["comprobador"] spawn ica_fnc_roboNuclear;
["init"] call ica_fnc_camaras;
0 spawn ica_fnc_EH;
0 spawn ica_fnc_initHUD;

arrayInfo = ["", "", "", "", "", "", "", "", "* Pop Life", "* v2.01"];
if (isNil {profileNamespace getVariable "arraySMS"}) then {
	_arr = []; _arr resize 30;
	profileNamespace setVariable ["arraySMS", _arr];
};

waitUntil {!isNull (uiNamespace getVariable "HUDica")};
[] call ica_fnc_infolog;

0 spawn ica_fnc_mapMarkers;

player addAction ["", {
	call ica_fnc_limitadorDeArmas
}, "", 0, false, true, "DefaultAction", "isNil 'puedoDisparar' "];

[player] spawn ica_fnc_initMed;
["loop"] spawn ica_fnc_posicion;

waitUntil {!isNil {heNacido}};
[] execVM "presentacion.sqf";
["recibo"] call ica_fnc_bloqueoDinero;


