/*
	File: fn_lockpick.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for lock-picking.
*/
private["_vehicle","_displayName","_isVehicle","_distance","_title","_progressBar","_cP","_titleText","_dice","_badDistance"];
_vehicle = cursorTarget;
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

life_interrupted = false;
if(life_action_inUse) exitWith {};

if(isPlayer _vehicle) exitWith {};
if(isNull _vehicle) exitWith {};

// robo concesionario ica
if (!isNil {_vehicle getVariable "robable"}) exitWith {
	["menu", 0.9, "concesionario"] call ica_fnc_ganzua;
	if (isNil {avisadoConcesionario}) then {
		avisadoConcesionario = true;
		[] spawn {
			sleep 120;
			avisadoConcesionario = nil;
		};

		[] spawn {
			sleep 30; // espero para avisar a la policía

			paq = [player, "anuncioPolicia",
				[10, "Aviso", [1,0,0], 1.5, "Están ganzuando un vehículo del concesionario", [1,1,1], 1]
			]; publicVariableServer "paq"; paq = nil;
		};
	};
};

_distance = ((boundingBox _vehicle select 1) select 0) + 2;
if(player distance _vehicle > _distance) exitWith {}; //Too far
if(typeof _vehicle in listaCasas) exitWith {["menu", 0.94, "cas", _vehicle] call ica_fnc_ganzua}; // En el caso de usar una ganzua para una casa
if(typeof _vehicle in listaGarajes) exitWith {hint "No puedes robar un garage"}; // En el caso de usar una ganzua para una Garage
_isVehicle = if((_vehicle isKindOf "LandVehicle") OR (_vehicle isKindOf "Ship") OR (_vehicle isKindOf "Air")) then {true} else {false};
if(_isVehicle && _vehicle in life_vehicles) exitWith {hint localize "STR_ISTR_Lock_AlreadyHave"};

_title = format[localize "STR_ISTR_Lock_Process",_displayName];

// salto el ganzuamiento de tonic y meto el de ica
if (true) exitWIth {["menu", 0.9, "veh", _vehicle] call ica_fnc_ganzua};

life_action_inUse = true; //Lock out other actions

//Setup the progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_displayName];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do {
	if (animationState player != "CL3_anim_managerdoorlockpick") then {
		[player,"CL3_anim_managerdoorlockpick"] remoteexeccall ["life_fnc_animSync",-2];
		player playMoveNow "CL3_anim_managerdoorlockpick";
	};
	sleep 0.26;
	if (isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if (_cP >= 1 OR !alive player) exitWith {};
	if (life_istazed) exitWith {}; //Tazed
	if (life_interrupted) exitWith {};
	if ((player getVariable["restrained",false])) exitWith {};
	if (player distance _vehicle > _distance) exitWith {_badDistance = true;};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if (!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if ((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if (!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; life_action_inUse = false;};
if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
if (!([false,"lockpick",1] call life_fnc_handleInv)) exitWith {life_action_inUse = false;};

life_action_inUse = false;

_dice = random(100);
if(_dice < 30) then {
	titleText[localize "STR_ISTR_Lock_Success","PLAIN"];
	life_vehicles pushBack _vehicle;
	[getPlayerUID player,profileName,"487"] remoteexeccall ["life_fnc_wantedAdd",2];
} else {
	[getPlayerUID player,profileName,"215"] remoteexeccall ["life_fnc_wantedAdd",2];
	[0,"STR_ISTR_Lock_FailedNOTF",true,[profileName]] remoteexeccall ["life_fnc_broadcast",west];
	titleText[localize "STR_ISTR_Lock_Failed","PLAIN"];
};