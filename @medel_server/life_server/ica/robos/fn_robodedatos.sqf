
/*
por: Icaruk
	Función: Hacer la animación de robar los datos, al acabar muestra el código.
	["portatil1"] spawn ica_fnc_roboDeDatos;
*/

if (!isNil {ocupado}) exitWith {hint "Estás ocupado"; };
ocupado = true;

if (vehicle player != player) exitWith {hint "Desde aquí no alcanzas el teclado"; };
disableSerialization;

_mirando = _this select 0;

{(_x call BIS_fnc_rscLayer) cutText ["","PLAIN"]} forEach ["icapa1", "icapa2", "icapa3", "icapa4"];

("icapa1" call BIS_fnc_rscLayer) cutRsc ["dat1","PLAIN"]; // loading extdta
sleep 3;
("icapa1" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
("icapa2" call BIS_fnc_rscLayer) cutRsc ["dat2","PLAIN"];
sleep 1;
("icapa1" call BIS_fnc_rscLayer) cutRsc ["dat3","PLAIN"]; // loading module
("icapa2" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
sleep 4;
("icapa2" call BIS_fnc_rscLayer) cutRsc ["dat4","PLAIN"];
("icapa1" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
sleep 1;
("icapa1" call BIS_fnc_rscLayer) cutRsc ["dat5","PLAIN"]; // sync
("icapa2" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
sleep 2;
("icapa2" call BIS_fnc_rscLayer) cutRsc ["dat6","PLAIN"];
("icapa1" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
sleep 1;
("icapa1" call BIS_fnc_rscLayer) cutRsc ["dat7","PLAIN"]; // extracting
("icapa2" call BIS_fnc_rscLayer) cutText ["","PLAIN"];

("icapa3" call BIS_fnc_rscLayer) cutRsc ["progresoRoboDeDatos","PLAIN"];

_ui = uiNameSpace getVariable "progresoRoboDeDatos";
_barrita = _ui displayCtrl 4000;

[_mirando] spawn {
	_mirando = _this select 0;
	while {!isNil {ocupado}} do {
		if ((player distance _mirando) > 13) exitWith {fuera = true};
		sleep 5;
	};
};

_n = 0;
while {true} do {
	if ((_n >= 1) OR (!isNil {fuera})) exitWith {};
	_n = _n + 0.01;
	_barrita progressSetPosition _n;
	sleep ((floor (random 50)) / 50);
};

if (!isNil {fuera}) exitWith {
	hint "Has perdido la conexión, intenta estar más cerca del portátil";
	ocupado = nil;
	fuera = nil;
	{(_x call BIS_fnc_rscLayer) cutText ["","PLAIN"]} forEach ["icapa1", "icapa2", "icapa3", "icapa4"];
};

[player, ["datos"]] call ica_fnc_varToServer; waitUntil {recibido};

sleep 1;
("icapa2" call BIS_fnc_rscLayer) cutRsc ["dat8","PLAIN"];
("icapa4" call BIS_fnc_rscLayer) cutRsc ["datosRobados","PLAIN"];

_ui2 = uiNameSpace getVariable "datosRobados";
_datos = _ui2 displayCtrl 4001;

_texto = "";
if ((datos select 0) == _mirando) then { // muestro si estoy en el portatil correcto
	_texto = format ["%1", datos select 1];
	["envio", player, 50, 60*5] call ica_fnc_bloqueoDinero;
} else {
	_texto = "No data here";
};
if ((count datos) == 0) then {
	_texto = "Server is  restarting";
};

_datos ctrlSetText _texto;

sleep 15;
{(_x call BIS_fnc_rscLayer) cutText ["","PLAIN"]} forEach ["icapa1", "icapa2", "icapa3", "icapa4"];

ocupado = nil;
