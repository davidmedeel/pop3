#include <macro.h>
/*
        File: fn_actionKeyHandler.sqf
        Author: Bryan "Tonic" Boardwine

        Description:
        Master action key handler, handles requests for picking up various items and
        interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private ["_curTarget", "_veh"];

_curTarget = cursorTarget;
if (life_action_inUse) exitWith {};	// Action is in use, exit to prevent spamming.
if (life_interrupted) exitWith { life_interrupted = false; };
_listabusca = [];
_listabusca append listacasas;
_listabusca append listaGarajes;
if (player getVariable ["isEscorting",false]) exitWith {
	_curTarget = player getVariable "escortingplayer";
	if (playerSide isEqualTo west) then {
		[_curTarget, "cop"] call bk_fnc_Actions_Arrest;
	}else{
		[_curTarget, "civ"] call bk_fnc_Actions_Arrest;
	};
};
if ((typeof _curTarget) in _listabusca  && {player distance _curTarget < 12}) exitWith {
	closeDialog 0;
	[_curTarget] call bk_fnc_Actions_House;
};
    if (dialog) exitWith {};	// Don't bother when a dialog is open.
    if (vehicle player != player) exitWith {};	// He's in a vehicle, cancel!
    life_action_inUse = true;

	// Temp fail safe.
    [] spawn {
	    sleep 60;
	    life_action_inUse = false;
    };
    if (typeOf _curtarget in [
		"POP_tetrapodo",
		"POP_tetrapodo_x3",
		"POP_tetrapodo_x5",
		"POP_tetrapodo_x7",
		"POP_electroflare",
		"POP_banda",
		"POP_senal_alcoholemiagc",
		"POP_senal_control_policia",
		"POP_senal_izquierda",
		"POP_senal_derecha",
		"POP_senal_stop",
		"POP_senal_estrechamiento",
		"POP_senal_velocidad20",
		"POP_senal_velocidad40",
		"Land_PortableLight_single_F",
		"Land_PortableLight_double_F",
		"POP_BandaClavos"
	]) then {
		if(isNil "_curtarget") exitWith {};
		titleText["Recogiendo...","PLAIN"];
		sleep 0.5;
		_micur = format["%1_i", typeOf _curtarget];

		if ([_micur] call ica_fnc_item) then {
			deleteVehicle _curtarget;
			war_objetos_colocados = war_objetos_colocados - 1;
			publicVariable "war_objetos_colocados";

		} else {
			titleText["No tienes espacio en el inventario...","PLAIN"];
			//sleep 0.5;
		};


		//[_curtarget] call war_fnc_objetos_quitar;
	};
	if (player distance ((nearestObjects [player, ["POP_tetrapodo_x3","POP_tetrapodo_x5","POP_tetrapodo_x7"], 5]) select 0) < 3) then {
		_cosa = ((nearestObjects [player, ["POP_tetrapodo_x3","POP_tetrapodo_x5","POP_tetrapodo_x7"], 5]) select 0);
		if(isNil "_curtarget") exitWith {};
		titleText["Recogiendo...","PLAIN"];
		_micosa = format["%1_i", typeOf _cosa];
		sleep 0.5;
		if ([_micosa] call ica_fnc_item) then {
			deleteVehicle _cosa;
			war_objetos_colocados = war_objetos_colocados - 1;
			publicVariable "war_objetos_colocados";
		} else {
			titleText["No tienes espacio en el inventario...","PLAIN"];
		};
	};
	if ((typeOf ((nearestObjects [player, ["pop_electroflare"], 5]) select 0)) == "POP_electroflare") then {


		if (["POP_electroflare_i"] call ica_fnc_item) then {
			deleteVehicle ((nearestObjects [player, ["pop_electroflare"], 5]) select 0);
			war_objetos_colocados = war_objetos_colocados - 1;
			publicVariable "war_objetos_colocados";

		} else {
			titleText["No tienes espacio en el inventario...","PLAIN"];
			//sleep 0.5;
		};
	};


	if (isNull _curTarget) then {
		_zonasPlantables = ["TPHacido1", "TPHacido2", "TPHacido3", "TPHbasico1",
		"TPHbasico2", "TPHbasico3", "TPHneutro1", "TPHneutro2", "TPHneutro3"];
		if ((([_zonasPlantables call ica_fnc_masCercano] call ica_fnc_getPos) distance player) < 30) then {
			call ica_fnc_agricultura;
		};
	};

	_plantasx = [
	"pop_flower_roja",
	"pop_flower_verd",
	"pop_flower_azul",
	"pop_flower_amar",
	"pop_flower_rosa",
	"pop_flower_mora",
	"pop_flower_nara",
	"pop_flower_marr",
	"pop_flower_negr"
];

_cercaniax = nearestObjects [player, _plantasx, 3];
    if !(isNull (_cercaniax select 0)) then {["recolecta",_cercaniax select 0] spawn ica_fnc_pandemia};

	// If target is a player then check if we can use the cop menu.
    if (isPlayer _curTarget && _curTarget isKindOf "Man") then {
		if ((_curTarget getVariable ["restrained", false]) && {!(player getVariable ["restrained", false])} && !dialog && playerSide == west) then
			{
				[_curTarget, "cop"] call bk_fnc_Actions_Arrest;
			};
		if ((_curTarget getVariable ["restrained", false]) && {!(player getVariable ["restrained", false])} && !dialog && playerSide == civilian) exitWith
			{
				[_curTarget, "civ"] call bk_fnc_Actions_Arrest;
			};
    } else {
		// OK, it wasn't a player so what is it?
		private ["_isVehicle", "_money"];
		_isVehicle = if ((_curTarget isKindOf "landVehicle")OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
		_money = "Land_Money_F";

		// It's a vehicle! open the vehicle interaction key!
		if (_isVehicle) then {
				if (!dialog) then {
					if (playerSide == west && player distance _curTarget < (((boundingBox _curTarget select 1)select 0) + 2)) then {
						[_curTarget, "cop"] call bk_fnc_Actions_Vehicles;
					};
					if (playerSide == civilian && player distance _curTarget < (((boundingBox _curTarget select 1)select 0) + 2)) then {
						[_curTarget, "civ"] call bk_fnc_Actions_Vehicles;
					};
					if (playerSide == independent && player distance _curTarget < (((boundingBox _curTarget select 1)select 0) + 2)) then {
						[_curTarget, "med"] call bk_fnc_Actions_Vehicles;
					};
				};
		} else {
			// It wasn't a misc item so is it money?
			if ((typeOf _curTarget) == _money && {!(_curTarget getVariable ["inUse", false])}) then {
				//extra cheek by quic
				if ((count (nearestObjects [player, ["man"], 5]))>1) exitwith {hint "Hay demasiada gente para recoger el dinero"};
				private ["_handle"];
				_curTarget setVariable ["inUse", TRUE, TRUE];
				_handle = [_curTarget] spawn life_fnc_pickupMoney;
				waitUntil {scriptDone _handle};

				//extra borrado by quick
				deleteVehicle _curTarget;


			};
		};
    };
