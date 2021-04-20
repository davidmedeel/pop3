
private["_message"];

disableSerialization;

waitUntil {!isnull (findDisplay 9000)};

if (medel_din < 6000) exitWith {hint parsetext "<t size = ""2"" color=""#DE2828"" align='center'>POP TV <br/><t size = ""1"" color=""#21618C"" align='left'>No tienes 6000€.</t></t>";};

if !(life_channel_send) exitWith {hint parsetext"<t size = ""2"" color=""#DE2828"" align='center'>POP TV <br/><t size = ""1"" color=""#21618C"" align='left'>Ya han enviado un anuncio hace poco.</t></t> ";};

medel_din = medel_din - 6000;

_message = ctrlText 9001;
[6,format ["Anuncio de %1: %2",name player,_message]] remoteexec ["life_fnc_broadcast",-2];
life_channel_send = false;

[] spawn {
	sleep 600;
	life_channel_send = true;
};
