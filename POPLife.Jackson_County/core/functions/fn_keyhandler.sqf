#include <Keycodes.h>
#include <macro.h>

/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;
_tiempo = serverTime;

_mapKey = actionKeys "ShowMap" select 0;
//hint str _code;
_interruptionKeys = [17,30,31,32,44,16]; //A,S,W,D,Z,Q

_userKey9 = if(count (actionKeys "User9") != 0) then [{(actionKeys "User9") select 0},{-99}];

// ica
_puedo = true;

if ((_code in (actionKeys "GetOver")) OR (_code in (actionKeys "SwimDown")) OR (_code in (actionKeys "MoveUp")) OR (_code in (actionKeys "Crouch"))) then {
	_puedo = switch (true) do {
		case ((player distance joyeria) < 17): {false};
		case ((player distance banco) < 23): {false};
		case (player distance (getMarkerPos "jail_marker") < 24): {false};
	};
};

if (_code in (actionKeys "Gear")) then {
	_tio = nearestObjects [getPos player, ["Man"], 3.5];
	_veh = nearestObjects [getPos player, ["Car", "Air", "Ship","pop_caja_armariog_box","pop_caja_armariop_box"], 6.1];
	if (((count _tio) <= 1) AND (count _veh < 1)) exitWith {};

	_puedo = false;
};

if (_code in (actionKeys "Diary")) then {
	_puedo = false;
};


if (_code in (actionKeys "tacticalView")) then {
	hint "Modo comandante deshabilitado";
	_handled = true;
};

if !(_puedo) exitWith {
	true;
};

//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player getVariable ["restrained",false])}) exitWith {
	true;
};

if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if(count (actionKeys "User10") != 0 && {(inputAction "User10" > 0)}) exitWith {
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	if(!life_action_inUse) then {
		[] spawn
		{
			private["_handle"];
			_handle = [] spawn life_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			life_action_inUse = false;
		};
	};
	true;
};

switch (_code) do {

	//Map Key
    case _mapKey: {
        switch (playerSide) do {
            case independent: {
                if(visibleMap) then {            
                    {

                        deleteMarkerLocal _x;

                    } forEach MedMarkes;

                } else {
                    ["Med"] spawn ica_fnc_marcadores;
                };
            };
        };
    };
	case 57: {
        if (isNil "jumpActionTime") then {jumpActionTime = 0;};
        if (_shift && {!(animationState player isEqualTo "AovrPercMrunSrasWrflDf")} && {isTouchingGround player} && {stance player isEqualTo "STAND"} && {speed player > 2} && {!life_is_arrested} && {((velocity player) select 2) < 2.5} && {time - jumpActionTime > 1.5}) then {
            jumpActionTime = time; //Update the time.
            [player] remoteExec ["life_fnc_jumpFnc",0]; //Global execution
            _handled = true;
        };
    };
	If ( ( _code == 16 Or _code == 18 Or _code == 19 ) and (vehicle player != player) ) Then {
		If (_shift && !_ctrlKey) Then {
			_handled = true;
			switch (_code) do {
				case 16: { ["blip"] Call ica_fnc_SonidosPolicia ; };
				case 18: { ["horn"] Call ica_fnc_SonidosPolicia ; };
				case 19: { ["voice"] Call ica_fnc_SonidosPolicia ; };
			};
		};
	};

    case DIK_0 : {
		if (__GETC__(life_adminlevel) > 0) then {
			{profileNamespace setVariable ["rutome", 0]} remoteExec ["bis_fnc_call", player];
			["Admin Log",format ["%1 - (%2) se ha revivido",name player,(getPlayerUID player)]] remoteexeccall ["ica_fnc_customlog",2];
		}
	};

    case DIK_5 : {
			_handled = ["fin"] Call ica_fnc_SonidosNewSiren ;
		};
    case DIK_4 : {
			If (_shift) Then { _handled = ["S24"] Call ica_fnc_SonidosNewSiren ; } Else { _handled = ["S4"] Call ica_fnc_SonidosNewSiren ; };
		};
    case DIK_3 : {
			If (_shift) Then { _handled = ["S23"] Call ica_fnc_SonidosNewSiren ; } Else { _handled = ["S3"] Call ica_fnc_SonidosNewSiren ; };
		};
    case DIK_2 : {
			If (_shift) Then { _handled = ["S22"] Call ica_fnc_SonidosNewSiren ; } Else { _handled = ["S2"] Call ica_fnc_SonidosNewSiren ; };
		};
    case DIK_1 : {
			If ( vehicle player != player ) Then {
				If (_shift) Then { _handled = ["S21"] Call ica_fnc_SonidosNewSiren ; } Else { _handled = ["S1"] Call ica_fnc_SonidosNewSiren ; };
			} else {
				if (side player isEqualTo west) then {
					[] call life_fnc_showDNI;
				}else{
					if (__GETC__(mafia) > 0 && player getVariable ["sp_enservicio",false]) then {
						[] call life_fnc_showSpDNI;
					};
					if (life_gangZona > 0) then {
						[] call life_fnc_showMafiaDNI;
					};
				};
			};
		};

	//H Holster / recall weapon /casas
	case DIK_H: {

		if(_shift && !_ctrlKey && currentWeapon player != "") then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchcamera cameraView;
		};

		if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
			if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon life_curWep_h;
			};
		};
    if(!_alt && !_ctrlKey && !_shift) then {
			if(vehicle player == player) then {
				_veh = cursorTarget;
			} else {
				_veh = vehicle player;
			};
			_listaventa = listaCasas + listaGarajes;
			if((typeof _veh) in _listaventa) then {
				if(_veh in life_vehicles && player distance _veh < 8) then {
					_door = [_veh] call life_fnc_nearestDoor;
					// if(_door == 0) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					if(_locked == 0) then {
						// _veh animate [format["door%1",_door],0];
						{
							_veh setVariable[format["bis_disabled_Door_%1",_x],1,true];
						} forEach [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];

						systemChat localize "STR_House_Door_Lock";
					} else {
						// _veh animate [format["door%1",_door],1];
						{
							_veh setVariable[format["bis_disabled_Door_%1",_x],0,true];
						} forEach [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];

						systemChat localize "STR_House_Door_Unlock";
					};
				};
			};
		};
	};

	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case DIK_LWIN:	{
		_veh = vehicle player;
		if (_veh != player) then {
			if (("con" call ica_fnc_expToLevel) >= 5) then {
				if ((driver _veh) == player) then {
					if ((speed _veh) > 30) then {
						if (!isNil {CDturbo}) exitWith {hint format ["Tiempo de reutilización restante %1s", CDturbo]};
						0 spawn {
							CDturbo = 60;
							while {true} do {
								if (CDturbo <= 0) exitWith {CDturbo = nil};
								CDturbo = CDturbo - 1;
								sleep 1;
							};
						};

						[_veh, [0, 30, 1]] call ica_fnc_setVelocityRas;
					};

				};
			};
		} else {
			if (!life_action_inUse) then {
				[] spawn {
					private["_handle"];
					_handle = [] spawn life_fnc_actionKeyHandler;
					waitUntil {scriptDone _handle};
					life_action_inUse = false;
				};
			};
		};
	};

	case DIK_RWIN: {
		if(!life_action_inUse) then {
			[] spawn {
				private["_handle"];
				_handle = [] spawn life_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};

	case DIK_J: {
        ["buscarTesoro"] spawn life_fnc_cazatesoros;
   };

	//F5 Surrender
	case 63: {
		if (vehicle player == player && !(player getVariable ["restrained", false]) && !life_istazed) then	{
				if (player getVariable ["surrender", false]) then {
					player setVariable ["surrender", false, true];
				} else {
					[] spawn life_fnc_surrender;
				};
			};
			_handled = true;
	};

	//Restraining (Shift + R)
	case DIK_R: {
    if (_shift && !(player getVariable ["restrained", false]) && !life_istazed) then {_handled = true;};
		[] call life_fnc_restrainAction;
	};

	//Knock out, this is experimental and yeah...
	case DIK_G: {
    if (_shift) then {_handled = true;};

	if (
		(_shift) AND (currentWeapon player == "") AND !(life_knockout) AND
		!(player getVariable["restrained",false]) AND (!life_istazed)
	) then {
		if (("for" call ica_fnc_expToLevel) >= 5) then {
			["pego"] call ica_fnc_hab_Golpe;
		};
	};

	if (
		_shift && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget &&
		cursorTarget distance player < 4 && speed cursorTarget < 1 && !(cursorTarget getVariable "restrained")
	) then {
		if (
			(animationState cursorTarget) != "Incapacitated" &&
			(currentWeapon player == primaryWeapon player || currentWeapon player == handgunWeapon player) &&
			currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed && !(currentWeapon player in ["cl_fishing_rod","cl_axe","cl_pick_axeweap","cl_shovel","cl_picket_ftp","cl_picket_mlnw","cl_picket_rtp","pop_linterna"])
		) then {
			[cursorTarget] spawn life_fnc_knockoutAction;
		};
	};
};

	// O, police gate opener
	case DIK_O: {
		if (!_shift && !_alt && !_ctrlKey && (playerSide == west) && (vehicle player != player)) then {
			[] call life_fnc_copOpener;
		};
 		if (!_shift && !_alt && _ctrlKey) then {
			if (!isnil "reporteUsado") exitwith {};
			0 spawn ica_fnc_reporte;
		};
	};


    case DIK_SUBTRACT: {
	    if (_ctrlKey) then {
				if (!isNil {Distanciazo}) exitWith {hint "Sólo puedes hacer esto cada 5 segundos"};
				0 spawn {Distanciazo = true; sleep 5; Distanciazo = nil};

				if (isNil {Vision_distancia}) then {Vision_distancia = 2000};
				switch (Vision_distancia) do
				{
					case (500):
					{
					    hint "Tu vision ya es la minima!";
						setViewDistance 500;
					};
					case (1000):
					{
					    hint "Ahora tu vision es de 500m";
						setViewDistance 500;
						Vision_distancia = 500;
					};
					case (1500):
					{
					    hint "Ahora tu vision es de 1000m";
						setViewDistance 1000;
						Vision_distancia = 1000;
					};
					case (2000):
					{
					    hint "Ahora tu vision es de 1500m";
						setViewDistance 1500;
						Vision_distancia = 1500;
					};
				};
		};
 	};
    case DIK_ADD: {
	    if (_ctrlKey) then {
				if (!isNil {Distanciazo}) exitWith {hint "Sólo puedes hacer esto cada 5 segundos"};
				0 spawn {Distanciazo = true; sleep 5; Distanciazo = nil};

				if (isNil {Vision_distancia}) then {Vision_distancia = 2000};
				switch (Vision_distancia) do
				{
					case (500):
					{
					    hint "Ahora tu vision es de 1000m";
						setViewDistance 1000;
						Vision_distancia = 1000;
					};
					case (1000):
					{
					    hint "Ahora tu vision es de 1500m";
						setViewDistance 1500;
						Vision_distancia = 1500;
					};
					case (1500):
					{
					    hint "Ahora tu vision es de 2000m";
						setViewDistance 2000;
						Vision_distancia = 2000;
					};
					case (2000):
					{
					    hint "Tu vision ya es la maxima!";
						setViewDistance 2000;
					};
				};
		};
 	};


	//T Key (Trunk)
	// ica revelar todo a 5m
	case DIK_T: {
		["Init"] spawn ica_fnc_houdini;
	};

	//L Key
	case DIK_L: {};
	//Y Player Menu
	case DIK_Y:
	{
		if (dialog) exitWith {closeDialog 0};
		if(!_alt && _ctrlKey && !dialog) then {
			// [] call fnc_opentablet;
			if (!isNil {hierbeado}) exitWith {hint "Sólo puedes hacer esto cada 20 segundos"};
			0 spawn {hierbeado = true; sleep 20; hierbeado = nil};

			if (isNil {hierba}) then {hierba = false};
			if (hierba) then {
				hint "Ahora ves hierba";
				setTerrainGrid 25;
			} else {
				hint "Ahora no ves hierba";
				setTerrainGrid 50;
			};
			hierba = !hierba;
		};
		if(!_alt && !_ctrlKey && !dialog) then {
			["menu"] spawn ica_fnc_menuY;
		};
	};
	//Shift+P = Menu Trol
	case DIK_P: {
		if(_shift) then {
			createdialog "Menutrol_dialog";
			_handled = true;
		};
	};

    //F Key
    case 33: {
		[] spawn life_fnc_radar;
	};
	//U Key
	case DIK_U: {
		if(!_alt && !_ctrlKey) then {

			if(vehicle player == player) then {
				_veh = cursorTarget;
			} else {
				_veh = vehicle player;
			};

				_locked = locked _veh;
				if(_veh in life_vehicles && player distance _veh < 8) then {

					if(_locked == 2) then {

						if(local _veh) then {
							_veh lock 0;
						} else {
							[_veh,0] remoteexeccall ["life_fnc_lockVehicle",_veh];
									hint composeText [ image "\pop_iconos\icons\unlock.paa", "Vehículo abierto" ];
									[player,"abrecoche"] remoteexeccall ["life_fnc_say3D",-2];
						};

					} else {
						if(local _veh) then {
							_veh lock 2;
						} else {
							[_veh,2] remoteexeccall ["life_fnc_lockVehicle",_veh];
									hint composeText [ image "\pop_iconos\icons\lock.paa", "Vehículo cerrado" ];
									[player,"cierracoche"] remoteexeccall ["life_fnc_say3D",-2];
						};
					};
				};
			};
		};

	case DIK_C: {
		if(vehicle player != player) then {
			if(!cinturon) then {
				cinturon = true;
				hintSilent "Cinturon abrochado";
				player say3D "cierracoche";
				0 spawn {
				waitUntil { sleep 1; vehicle player == player;};
				cinturon = false;
				};
			}
			else {
				cinturon = false;
				hintSilent "Cinturon desabrochado";
				player say3D "cierracoche";
			};
		};
	};

	// F1 - TAPONES
	case DIK_F1: {
		switch (player getVariable["Tapones",0]) do {
			case 0: {hintSilent "Tapones Nivel 3"; 1 fadeSound 0.01; player setVariable ["Tapones", 10];};
			case 10: {hintSilent "Tapones Nivel 2"; 1 fadeSound 0.2; player setVariable ["Tapones", 40]};
			case 40: {hintSilent "Tapones Nivel 1"; 1 fadeSound 0.5; player setVariable ["Tapones", 70]};
			case 70: {hintSilent "Tapones Quitados"; 1 fadeSound 1; player setVariable ["Tapones", 0];};
		    };
		_handled = true;
	};


 // ALT + F4
	case DIK_F4:
	{
		if (playerSide isEqualTo west) then {
			["menu"] spawn ica_fnc_centralita;
		};
		_handled = true;
	};

	// ANTI CTRL + ALT + DEL
	case DIK_DELETE: {
		if (__GETC__(life_adminlevel) > 0) then {
			[] spawn ica_fnc_adminBorrar;
		};
		_handled = true;
	};

	// ANTI CTRL + ESC
	case DIK_ESCAPE: {
		if( _ctrlKey )  then {
			//
		};
	};
	// Tabulando
	case DIK_TAB: {
		if (!_alt && !_ctrlKey) then {
			["menu"] call ica_fnc_diagnostico;
		};
		if(_alt) then {
			//diag_log format ["SERVIDOR: %1 usando ALT+TABULADOR SOSPECHOSO....",(_tiempo),player getVariable["realname",name player]];
		};
	};

	//F2 DEBUG Admin
	case DIK_F2: {
		if(primaryWeapon player isEqualTo "cl_fishing_rod") then {
			[] spawn ica_fnc_pescar;
		} else {
			if (__GETC__(life_adminlevel) > 3) then {
				[] call fnc_consola;
			};
		};
		_handled = true;
	};
	// F3
	case DIK_F3: {
		if (__GETC__(life_adminlevel) > 0) then {
			[] spawn life_fnc_adminmenu;
		};
		_handled = true;
	};

	// F6
	case DIK_F6: {
		[] spawn ica_fnc_informacion;
	};

	case DIK_F8: {
		if (isnil {dayz_mod}) then {
			PP_colorC = ppEffectCreate ["ColorCorrections",1500];
			PP_colorC ppEffectEnable true;
			PP_colorC ppEffectAdjust [1,1.35,-0.1,[0.4,0.2,-0.3,0.1],[0,0,0,1],[20,20,20,1],[0,0,0,0,0,0,0.59]];
			PP_colorC ppEffectCommit 0;
			PP_dynamic = ppEffectCreate ["DynamicBlur",500];
			PP_dynamic ppEffectEnable true;
			PP_dynamic ppEffectAdjust [0.1];
			PP_dynamic ppEffectCommit 0;
			PP_film = ppEffectCreate ["FilmGrain",2000];
			PP_film ppEffectEnable true;
			PP_film ppEffectAdjust [0.18,20,1,0.5,0.5,true];
			PP_film ppEffectCommit 0;
			dayz_mod = true;
		} else {
			ppEffectDestroy PP_colorC;
			ppEffectDestroy PP_dynamic;
			ppEffectDestroy PP_film;
			dayz_mod = nil;
		};
		_handled = true;
	};

	case DIK_F10: {
		if (getplayerUID player isEqualTo "76561198844937661") then {
			["menu"] spawn ica_fnc_consola;
		};
		_handled = true;
	};

case DIK_7: {
	if (!_shift) exitWith {};
	if (__GETC__(life_adminlevel) > 0) then {
		[] spawn ica_fnc_teleport5metros;
	};
	_handled = true;
};

case DIK_6: {
	if (!_shift) exitWith {};
	if (__GETC__(life_adminlevel) > 0) then {
		0 spawn ica_fnc_hab_pociondeadmin;
	};
	_handled = true;
};

	case 41 : {
		switch (side player) do
		{
			case west: {
			if (vehicle player != player) exitWith { 
                hint "No puedes enseñar la Placa desde un vehículo"; 
            };
				[] call life_fnc_showBadge;
			};

			case civilian: {
			if (vehicle player != player) exitWith { 
                hint "No puedes enseñar el DNI desde un vehículo"; 
            };
		    if(nombreCambiado == 1) then {
				["elegir"] spawn ica_fnc_nombreFake;
			} else {
					[] call life_fnc_showDNI;
				};
			};
			case independent: {
			if (vehicle player != player) exitWith {
                hint "No puedes enseñar la Placa desde un vehículo"; 
            };
				[] call life_fnc_showDNI;
			};
		};

		_handled = true;
	};
};

_handled;
