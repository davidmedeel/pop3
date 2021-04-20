/*
By Borjamed.

Para atacar las zonas de otras mafias.

fn_zonamafia.sqf
*/

_zona = param [0];
_mafia = param [1];

switch (_zona) do {
	case 1: {
		if (group player getVariable "gang_id" isEqualTo _mafia) exitWith {hint "No puedes atacar tu propia zona"};
		if ((count (units (group player))) < 8) exitWith {hint "Necesitas a mas miembros de tu grupo para atacar"};
		if (call mafia <= 0 && call terrorista <= 0) exitWith {hint "Necesitas estar en una mafia para poder hacer esto"}; 
		if !(isNil {zonas_mafia getVariable "zona1"}) exitwith {hint "Ya estan atacando esta zona"};
		_i = [];
		_grupo = grpnull;
		{
			if (_x getVariable "gang_id" isEqualTo _mafia) then {_i = (units _x);_grupo = _x;}; 
		} forEach allGroups;
		
		if ((count _i) < 5) exitWith {hint "No son demasiados"}; 
		if !(isnil {_grupo getvariable ["atacando",nil]}) exitwith {};
		zonas_mafia setVariable ["zona1",true,true];
		[10,"Alerta",[1,0,0,1],2,("Van a atacar tu zona mafiosa"),[1,1,1,1],1.5] remoteexec ["ica_fnc_anuncio",units _grupo];
		hint "Podras atacar esta zona en 10 min\nMira la marca en el mapa para ver el tiempo restante";
		[15,"zona1",2] remoteExec ["ica_fnc_robodesconexion",2];
		_grupo setvariable ["atacando",true,true];
		[15,_grupo,3] remoteExec ["ica_fnc_robodesconexion",2];
		createMarker ["zona1", [2264.12,2044.52,0.00183105]];
		"zona1" setMarkerType "mil_warning";
		"zona1" setMarkerColor "ColorRed";
		_tiempo = 10; //minutos para poder empezar a atacar
		while {_tiempo >= 1} do {
			"zona1" setMarkerText format ["Atacaran esta zona en %1 minutos",_tiempo];
			if (_tiempo isEqualTo 1) then {"zona1" setMarkerText "Cuidado, van a empezar a atacar";};
			sleep 60;
			_tiempo = _tiempo - 1;
		};
		"zona1" setMarkerText "Ataque en marcha";
	};
	case 2: {
		if (group player getVariable "gang_id" isEqualTo _mafia) exitWith {hint "No puedes atacar tu propia zona"};
		if ((count (units (group player))) < 8) exitWith {hint "Necesitas a mas miembros de tu grupo para atacar"};
		if (call mafia <= 0 && call terrorista <= 0) exitWith {hint "Necesitas estar en una mafia para poder hacer esto"}; 
		if !(isNil {zonas_mafia getVariable "zona2"}) exitwith {hint "Ya estan atacando esta zona"};
		_i = [];
		_grupo = grpnull;
		
		{
			if (_x getVariable "gang_id" isEqualTo _mafia) then {_i = (units _x);_grupo = _x;}; 
		} forEach allGroups;
		
		if ((count _i) < 5) exitWith {hint "No son demasiados"};
		
		if !(isnil {_grupo getvariable ["atacando",nil]}) exitwith {};
		
		zonas_mafia setVariable ["zona2",true,true];
		[10,"Alerta",[1,0,0,1],2,("Van a atacar tu zona mafiosa"),[1,1,1,1],1.5] remoteexec ["ica_fnc_anuncio",units _grupo];
		hint "Podras atacar esta zona en 10 min\nMira la marca en el mapa para ver el tiempo restante";
		[15,"zona2",2] remoteExec ["ica_fnc_robodesconexion",2];
		_grupo setvariable ["atacando",true,true];
		[15,_grupo,3] remoteExec ["ica_fnc_robodesconexion",2];
		createMarker ["zona2", [2861.71,5562.34,0.00125122]];
		"zona2" setMarkerType "mil_warning";
		"zona2" setMarkerColor "ColorRed";
		_tiempo = 10; //minutos para poder empezar a atacar
		while {_tiempo >= 1} do {
			"zona2" setMarkerText format ["Atacaran esta zona en %1 minutos",_tiempo];
			if (_tiempo isEqualTo 1) then {"zona2" setMarkerText "Cuidado, van a empezar a atacar";};
			sleep 60;
			_tiempo = _tiempo - 1;
		};
		"zona2" setMarkerText "Ataque en marcha";
	};
	case 3: {
		if (group player getVariable "gang_id" isEqualTo _mafia) exitWith {hint "No puedes atacar tu propia zona"};
		if ((count (units (group player))) < 8) exitWith {hint "Necesitas a mas miembros de tu grupo para atacar"};
		if (call mafia <= 0 && call terrorista <= 0) exitWith {hint "Necesitas estar en una mafia para poder hacer esto"}; 
		if !(isNil {zonas_mafia getVariable "zona3"}) exitwith {hint "Ya estan atacando esta zona"};
		_i = [];
		_grupo = grpnull;
		{
			if (_x getVariable "gang_id" isEqualTo _mafia) then {_i = (units _x);_grupo = _x;}; 
		} forEach allGroups;
		if ((count _i) < 5) exitWith {hint "No son demasiados"}; 
		if !(isnil {_grupo getvariable ["atacando",nil]}) exitwith {};
		zonas_mafia setVariable ["zona3",true,true];
		[10,"Alerta",[1,0,0,1],2,("Van a atacar tu zona mafiosa"),[1,1,1,1],1.5] remoteexec ["ica_fnc_anuncio",units _grupo];
		hint "Podras atacar esta zona en 10 min\nMira la marca en el mapa para ver el tiempo restante";
		[15,"zona3",2] remoteExec ["ica_fnc_robodesconexion",2];
		_grupo setvariable ["atacando",true,true];
		[15,_grupo,3] remoteExec ["ica_fnc_robodesconexion",2];
		createMarker ["zona3", [5245.96,9414.27,0.00137329]];
		"zona3" setMarkerType "mil_warning";
		"zona3" setMarkerColor "ColorRed";
		_tiempo = 10; //minutos para poder empezar a atacar
		while {_tiempo >= 1} do {
			"zona3" setMarkerText format ["Atacaran esta zona en %1 minutos",_tiempo];
			if (_tiempo isEqualTo 1) then {"zona3" setMarkerText "Cuidado, van a empezar a atacar";};
			sleep 60;
			_tiempo = _tiempo - 1;
		};
		"zona3" setMarkerText "Ataque en marcha";
	};
	case 4: {
		if (group player getVariable "gang_id" isEqualTo _mafia) exitWith {hint "No puedes atacar tu propia zona"};
		if ((count (units (group player))) < 8) exitWith {hint "Necesitas a mas miembros de tu grupo para atacar"};
		if (call mafia <= 0 && call terrorista <= 0) exitWith {hint "Necesitas estar en una mafia para poder hacer esto"}; 
		if !(isNil {zonas_mafia getVariable "zona4"}) exitwith {hint "Ya estan atacando esta zona"};
		_i = [];
		_grupo = grpnull;
		{
			if (_x getVariable "gang_id" isEqualTo _mafia) then {_i = (units _x);_grupo = _x;}; 
		} forEach allGroups;
		if ((count _i) < 5) exitWith {hint "No son demasiados"}; 
		if !(isnil {_grupo getvariable ["atacando",nil]}) exitwith {};
		zonas_mafia setVariable ["zona4",true,true];
		[10,"Alerta",[1,0,0,1],2,("Van a atacar tu zona mafiosa"),[1,1,1,1],1.5] remoteexec ["ica_fnc_anuncio",units _grupo];
		hint "Podras atacar esta zona en 10 min\nMira la marca en el mapa para ver el tiempo restante";
		[15,"zona4",2] remoteExec ["ica_fnc_robodesconexion",2];
		_grupo setvariable ["atacando",true,true];
		[15,_grupo,3] remoteExec ["ica_fnc_robodesconexion",2];
		createMarker ["zona4", [9947.47,912.699,0.00138855]];
		"zona4" setMarkerType "mil_warning";
		"zona4" setMarkerColor "ColorRed";
		_tiempo = 10; //minutos para poder empezar a atacar
		while {_tiempo >= 1} do {
			"zona4" setMarkerText format ["Atacaran esta zona en %1 minutos",_tiempo];
			if (_tiempo isEqualTo 1) then {"zona4" setMarkerText "Cuidado, van a empezar a atacar";};
			sleep 60;
			_tiempo = _tiempo - 1;
		};
		"zona4" setMarkerText "Ataque en marcha";
	};
	case 5: {
		if (group player getVariable "gang_id" isEqualTo _mafia) exitWith {hint "No puedes atacar tu propia zona"};
		if ((count (units (group player))) < 8) exitWith {hint "Necesitas a mas miembros de tu grupo para atacar"};
		if (call mafia <= 0 && call terrorista <= 0) exitWith {hint "Necesitas estar en una mafia para poder hacer esto"}; 
		if !(isNil {zonas_mafia getVariable "zona5"}) exitwith {hint "Ya estan atacando esta zona"};
		_i = [];
		_grupo = grpnull;
		{
			if (_x getVariable "gang_id" isEqualTo _mafia) then {_i = (units _x);_grupo = _x;}; 
		} forEach allGroups;
		if ((count _i) < 5) exitWith {hint "No son demasiados"}; 
		if !(isnil {_grupo getvariable ["atacando",nil]}) exitwith {};
		zonas_mafia setVariable ["zona5",true,true];
		[10,"Alerta",[1,0,0,1],2,("Van a atacar tu zona mafiosa"),[1,1,1,1],1.5] remoteexec ["ica_fnc_anuncio",units _grupo];
		hint "Podras atacar esta zona en 10 min\nMira la marca en el mapa para ver el tiempo restante";
		[15,"zona5",2] remoteExec ["ica_fnc_robodesconexion",2];
		_grupo setvariable ["atacando",true,true];
		[15,_grupo,3] remoteExec ["ica_fnc_robodesconexion",2];
		createMarker ["zona5", [418.758,8227.36,0.00144196]];
		"zona5" setMarkerType "mil_warning";
		"zona5" setMarkerColor "ColorRed";
		_tiempo = 10; //minutos para poder empezar a atacar
		while {_tiempo >= 1} do {
			"zona5" setMarkerText format ["Atacaran esta zona en %1 minutos",_tiempo];
			if (_tiempo isEqualTo 1) then {"zona5" setMarkerText "Cuidado, van a empezar a atacar";};
			sleep 60;
			_tiempo = _tiempo - 1;
		};
		"zona5" setMarkerText "Ataque en marcha";
	};
};