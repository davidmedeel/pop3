/*
	File: fn_serviceTruck.sqf
	Author: Bryan "Tonic" Boardwine
	Traductions/Corrections:	[OSEF]team
	Copyright [OSEF] droits reservés. (fichier non libre de droit)

	Description:
	Main functionality for the service truck.
	*Needs to be revised for new system and flow*
*/
private["_nearby"];
_nearby = nearestObjects[(vehicle player),["Car","Ship","Air"],10];
_nearbyGasStation = nearestObjects[(vehicle player),["Land_fs_feed_F","Land_fs_roof_F","Land_FuelStation_Feed_F"],25];

if(count (_nearbyGasStation) > 1) then
{

	if(count (_nearby) > 1) then
	{
		_vehicle = _nearby select 1;
		_name = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
		titleText[format["En service %1 ne pas bouger...",_name],"PLAIN"];
		titleFadeOut 12;
		sleep 10;
		if((vehicle player) distance _vehicle > 10) exitWith {titleText["Vous avez rate de reparer/mettre le plein, car vous etiez a plus de 10 metres de la station","PLAIN"];};
		titleText[format["Vous avez repare / mis le plein dans: %1",_name],"PLAIN"];
		if(!local _vehicle) then
		{
			{_vehicle setFuel 1} remoteexec ["BIS_fnc_spawn",_vehicle];
		}
			else
		{
			_vehicle setFuel 1;
		};
		_vehicle setDamage 0;
	};

} else {
	hint "Vous devez etre pret d une station service pour reparer tout vehicule automatiquement.";
};