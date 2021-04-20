
private ["_mensaje"];

disableSerialization;

waitUntil {!isnull (findDisplay 10000)};

if !(("inf" call ica_fnc_expTolevel) >= 7) exitWith {hint parsetext "<t size = ""2"" color=""#DE2828"" align='center'>POP TV <br/><t size = ""1"" color=""#21618C"" align='left'>Si no sabes, no toques.</t></t>";};

if (medel_din < 30000) exitWith {hint parsetext "<t size = ""2"" color=""#DE2828"" align='center'>POP TV <br/><t size = ""1"" color=""#21618C"" align='left'>No tienes 30000€.</t></t>";};

if !(life_anonimo_enviado) exitWith {hint parsetext "<t size = ""2"" color=""#DE2828"" align='center'>POP TV <br/><t size = ""1"" color=""#21618C"" align='left'>Ya han enviado un anuncio anónimo hace poco.</t></t>";};

medel_din = medel_din - 30000;

_mensaje = ctrlText 5254;
[6,format ["Anuncio Anónimo: %1", _mensaje]] remoteexec ["life_fnc_broadcast", -2];

life_anonimo_enviado = false;

[] spawn {
	sleep 900;
	life_anonimo_enviado = true;
};
