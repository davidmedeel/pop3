/*
	File: fn_licensesRead.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Outprints the licenses.
*/
private["_licenses","_civ"];
_civ = [_this,0,"",[""]] call BIS_fnc_param;
_licenses = [_this,1,(localize "STR_Cop_NoLicenses"),[""]] call BIS_fnc_param;
_puntos = _this select 2;
_licencia = _this select 3;
if (isNil "_puntos") then {_puntos = 15};
if (_licencia) then {
	hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'>" +(localize "STR_Cop_Licenses")+ "</t></t><br/>%2<t color='#FFD700'><t size='1.5'>" +("Puntos del carnet:")+ "</t></t><br/>%3",_civ,_licenses,_puntos];
}else{
	hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'>" +(localize "STR_Cop_Licenses")+ "</t></t><br/>%2",_civ,_licenses];
};