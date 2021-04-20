#include <macro.h>
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called by the server saying that we have a response so let's
	sort through the information, validate it and if all valid
	set the client up.
*/
life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

titleText [localize "STR_Session_Received","PLAIN"];


//Error handling and  junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(typeName _this == "STRING") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(count _this == 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((_this select 0) == "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((getPlayerUID player) != _this select 0) exitWith {[] call SOCK_fnc_dataQuery;};

if(profileName != _this select 1) exitWith {
hintSilent parsetext format ["<br/><t color='#084aff' size='2' shadow='1'shadowColor='#b7bfd6'>~FRONTERA~<br/></t><t color='#faff00' size='1.5' shadow='1'shadowColor='#f61010'><br/>Tu nombre anterior es: %1</t>", _this select 1];
[format["Estás pasando la frontera con otro nombre que no es el tuyo. Si quieres cambiarte el nombre, acude a nuestro TS3 (ts3.plataoplomo.es).",
_this select 1],
"Nuevo Nombre Registrado",
"Aceptar"
] call BIS_fnc_guiMessage;
["Frontera",false,false] call BIS_fnc_endMission;
};

//Lets make sure some vars are not set before hand.. If they are get rid of them, hopefully the engine purges past variables but meh who cares.
/*if(!isServer && (!isNil "life_adminlevel" OR !isNil "life_coplevel" OR !isNil "life_donator")) exitWith {
	[[profileName,getPlayerUID player,"VariablesAlreadySet"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
	[[profileName,format["Variables set before client initialization...\nlife_adminlevel: %1\nlife_coplevel: %2\nlife_donator: %3",life_adminlevel,life_coplevel,life_donator]],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
	sleep 0.9;
	["SpyGlass",false,false] execVM "\a3\functions_f\Misc\fn_endMission.sqf";
};
*/
//Parse basic player information.
medel_din = parseNumber (_this select 2);
medel_atmdin = parseNumber (_this select 3);
__CONST__(life_adminlevel,parseNumber(_this select 4));
__CONST__(life_donator,parseNumber(_this select 5));

//Loop through licenses
if(count (_this select 6) > 0) then {
	{missionNamespace setVariable [(_x select 0),(_x select 1)];} foreach (_this select 6);
};

// Cuando el jugador entra con un nombre que no coincide con la base de datos
// Se le echa y se le muestra un mensaje.
// Por: Heisenberg
/*if(parseNumber(_this select 4) == 0) then { // Comprobar solo si no es admin
	if(profileName != _this select 1) exitWith {
		[_this select 1] spawn {
			hint format["Tu nombre anterior: %1",_this select 0];
			[format["Estás intentando atravesar la frontera con otro nombre. ¡Necesitas ponerte tu nombre anterior!<br/><br/>Tu nombre anterior: <t color='#b20303'>%1</t><br/><br/>Si tienes algún problema con el cambio entra en nuestro TeamSpeak (<t color='#665bff'>ts3.plataoplomo.wtf</t>)",
			_this select 0],
			"Otro nombre detectado",
			"Aceptar"
			] call BIS_fnc_guiMessage;
			sleep 5;
			[format ["%1",(getPlayerUID player)]] remoteexeccall ["ica_fnc_kick",2];
		};
	};
};*/

life_gear = _this select 8;
[true] call life_fnc_loadGear;

if(count (_this select 9) > 0) then {
	experiencia = _this select 9;
} else {
	experiencia = [0,0,0,0,0,0,0,0,0,0,0,0,0,0];
};
//Parse side specific information.
switch(playerSide) do {
	case west: {
		__CONST__(life_coplevel, parseNumber(_this select 7));
		__CONST__(life_medicLevel,0);
		__CONST__(life_opLevel,0);
	};

	case civilian: {
		life_is_arrested = _this select 7;
		//life_arrestMinutes = _this select 10;
		//life_arrestReason = _this select 11;

		__CONST__(life_coplevel, parseNumber(_this select 14));
		__CONST__(life_medicLevel, 0);
		__CONST__(life_opLevel,0);
		__CONST__(mafia,parseNumber(_this select 12));
		__CONST__(terrorista,parseNumber(_this select 13));
		jailtime = _this select 10;
		//arrest_reason = _this select 11;
		life_houses = _this select 16;
		{
			_house = nearestObject [(call compile format["%1", _x select 0]),"house"];
			if (typeof _house in listaCasas || typeof _house in listaGarajes) then {
				life_vehicles pushBack _house;
			};
		} foreach life_houses;

		life_gangData = _This select 17;
		if(count life_gangData != 0) then {
			[] spawn life_fnc_initGang;
		};
		[] spawn life_fnc_initHouses;
	};


	case independent: {
		__CONST__(life_medicLevel, parseNumber(_this select 7));
		__CONST__(life_coplevel,0);
		__CONST__(life_opLevel,0);
	};

	case east: {
		__CONST__(life_opLevel,parseNumber(_this select 7));
		op_gear = _this select 8;
		[] spawn life_fnc_loadGearop;
		__CONST__(life_copLevel,0);
		__CONST__(life_medicLevel,0);
	};

};

if(count (_this select 18) > 0) then {
	{life_vehicles pushBack _x;} foreach (_this select 15);
};

life_session_completed = true;
