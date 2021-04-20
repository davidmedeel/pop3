/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the players houses, mainly throwing down markers.
*/
if(count life_houses == 0) exitWith {}; //Nothing to do.

{
	_position = call compile format["%1",_x select 0];
	_house = nearestObject _position;
	_house setVariable["uid",round(random 99999),true];
	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	
	_marker = createMarkerLocal [format["house_%1",(_house getVariable "uid")],_position];
	_marker setMarkerTextLocal "Casa";
	_marker setMarkerColorLocal "ColorWhite";
	_marker setMarkerTypeLocal "mil_arrow2";
	/*
	_casasTocapelotas = ["Land_smd_dum_olez_istan2_maly_open","Land_smd_dum_olezlina_open","Land_smd_budova2_open","Land_smd_cihlovej_dum_mini","Land_smd_dum_mesto_in_open","Land_smd_budova3_open","Land_smd_hospoda_mesto","Land_smd_house_y_open","Land_smd_dum_olez_istan1_open2","Land_smd_dum_olez_istan2_open","Land_smd_dum_olez_istan1_open","Land_smd_sara_zluty_statek_in"];
	_n = if !(_house in _casasTocapelotas) then {1} else {0};
	for "_x" from 0 to 20 do {
		_house animate [format ["door%1", _x], _n];

	};
	*/
} foreach life_houses;
