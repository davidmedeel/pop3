
/*
por: Icaruk
	[veh] spawn ica_fnc_hab_reparar;
*/
if !("ToolKit" in (items player)) exitWith {hint "No tienes ningún kit de reparaciones"; };
if (vehicle player != player) exitWith {};

private ["_veh", "_porcent", "_miNivel"];
_veh = cursorTarget;

_con = "con" call ica_fnc_expToLevel;
_porcent = switch (true) do {
	case (_con >= 4): {70};
	case (_con >= 2): {35};
	case (_con >= 0): {0};
};

if ((round (random 100)) <= _porcent) then {
	hint "No has gastado kit reparación";
} else {
	player removeItem "ToolKit";
};
reparando = true; 
reparado = true;
if(currentWeapon player != "") then { 
	life_curWep_h = currentWeapon player; 
    player action ["SwitchWeapon", player, player, 100]; 
    player switchcamera cameraView; 
};

[25, "Reparando..."] spawn ica_fnc_barrita;
player playMove "CL3_anim_RepairCrouch";
[player, "reparar"] call CBA_fnc_globalsay3d;
[player,"CL3_anim_RepairCrouch"] remoteexeccall ["life_fnc_animSync",-2];
[] spawn {
	while {reparando} do {
		if (animationState player != "CL3_anim_RepairCrouch" && reparado) then {
			reparando = false;
		};
	};
};
sleep 25;
reparado = true;
if (vehicle player != player) exitWith {hint "No puedes reparar desde dentro"};
if !(reparando) exitWith {hint "Has intentado reparar el vehículo con la mente y te ha salido mal"}; 
if (player distance _veh > 5) exitWith {hint "El vehiculo esta demasiado lejos"};
_veh setDamage ((damage _veh) - 0.9);
