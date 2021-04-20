/*
Script hecho por Icaruk, si quieres usarlo s�lo tienes que pedirme permiso en adri-rk@hotmail.com.
Script done by Icaruk, if you want to use it, you just have to ask me permission on adri-rk@hotmail.com.
*/

disableSerialization;
_ui = uiNamespace getVariable "electricidad_dialog";

if (electricidad >= 99) exitWith {hint "El deposito esta al maximo de capacidad";};
if !(life_inv_fuelF >= 1) exitWith {hint "No tienes combustible";};
(_ui displayCtrl 9261) ctrlEnable false;
hint "Abriendo la tapa del deposito...";
sleep 1;
hint "Llenando el deposito...";
sleep 2;

if ((player distance generadorKavala) > 5) exitWith {hint "Estas demasiado lejos del generador";};
if !(life_inv_fuelF >= 1) exitWith {hint "No tienes combustible";};

[false,"fuelF",1] call life_fnc_handleInv;
electricidad = electricidad + 5;
publicVariable "electricidad";
hint "Has rellenado un 5% de la capacidad total.";
sleep 3;
hint "El ayuntamiento te enviara 1500E en un periodo de 1 a 3 minutos por ayudar a mantener Kavala iluminada";
	[] spawn {
		sleep 60 + (random 120);
		medel_din = medel_din + medel_dsin1500;
	};

(_ui displayCtrl 9261) ctrlEnable true;
