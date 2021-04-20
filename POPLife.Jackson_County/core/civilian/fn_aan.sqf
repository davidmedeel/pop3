/*
	Author: alleskapot
	
	Description: Sends AAN News to the player

*/
private["_display","_message"];
disableSerialization;
_message = _this select 0;

[parseText format["<t size='1.3'>ALERTA: %1 </t>",_message]] spawn BIS_fnc_AAN;

sleep 30;

_display = uinamespace getvariable "BIS_AAN";
_display closeDisplay 0; 