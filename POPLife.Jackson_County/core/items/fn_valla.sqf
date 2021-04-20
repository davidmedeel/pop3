/*
	File: fn_valla.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Creates a spike strip and preps it.
*/

/* DEPRECADO - ESTA VALLA NO LA TENEMOS AHORA EN EL MOD */

private["_position","_valla"];
_valla = "A3L_BarrierFence" createVehicle [0,0,0];
_valla attachTo[player,[0,1.3,0.8]];
_valla setDir 0;
_valla setVariable["item","vallaDeployed",true];

life_action_vallaDeploy = player addAction["Poner Valla Peatonal",{if(!isNull life_valla) then {detach life_valla; life_valla = ObjNull;}; player removeAction life_action_vallaDeploy; life_action_vallaDeploy = nil;},"",999,false,false,"",'!isNull life_valla'];
life_valla = _valla;
waitUntil {isNull life_valla};
if(!isNil "life_action_vallaDeploy") then {player removeAction life_action_vallaDeploy;};
if(isNull _valla) exitWith {life_valla = ObjNull;};
_valla setPos [(getPos _valla select 0),(getPos _valla select 1),0];
_valla setDamage 1;
life_action_vallaPickup = player addAction["Quitar valla",life_fnc_packupValla,"",0,false,false,"",
' _vallas = nearestObjects[getPos player,["A3L_BarrierFence"],3] select 0; !isNil "_vallas" && !isNil {(_vallas getVariable "item")}'];
[_valla] remoteexeccall ["TON_fnc_valla",2];