/*
	Author: alleskapot

	Description: Sends AAN News to the player

*/
private["_display","_message","_name"];
disableSerialization;
_message = _this select 0;
_name = _this select 1;
[parseText format["<t size='1.2'> %1 </t>",_message],parseText format["<t size='1.0'> Última hora || %1 || Última hora </t>",_name]] spawn BIS_fnc_AAN;
sleep 30;
_display = uinamespace getvariable "BIS_AAN";
_display closeDisplay 0;