
/*
por: Icaruk
	0 spawn ica_fnc_miroDocumentos;
*/

if (!isNil {ocupado}) exitWith {hint "Acabas de ver los documentos hace 1 segundo, ¿en serio es necesario volver a verlos?"};
[] spawn {
	ocupado = true;
	sleep 5;
	ocupado = nil;
};

[player, ["estadoPortatil"]] call ica_fnc_varToServer; waitUntil {recibido};

disableSerialization;
createDialog "documentos";
_ui = uiNamespace getVariable "documentos";
(_ui displayCtrl 4095) ctrlSetText format ["%1", estadoPortatil select 1];
