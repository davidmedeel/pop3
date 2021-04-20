/*
por: Icaruk
	0 spawn ica_fnc_talando;
*/
private ["_arbol","_pos2D","_pos3D","_cantidad","_arbolesX"];

if (currentweapon player != "cl_axe") exitwith {};

If ( count (player nearRoads 50) > 0 ) exitWith { hint "Por orden del alcalde no puedes talar junto a las vias publicas." };

if (!isNil {talandoarboles}) exitWith {hint "Tan rápido cansa..."};
[] spawn {
    talandoarboles = true;
    sleep 2;
    talandoarboles = nil;
};
_arbol = cursorObject;
if ((damage _arbol) >= 1) exitWith {hint "Ya esta roto..."};


 if( (handgunWeapon player) != "cl_axe") exitWith {};
 
player selectWeapon "cl_axe";
if (isNull _arbol) exitWith {hint "Qué quieres practicar? mejor apunta a un árbol."};
if (!([" t_",str _arbol] call ica_fnc_inString)) exitWith {hint "Esto no parece un árbol para talar."};

_pos3D = getPos _arbol;
_pos2D = [_pos3D select 0, _pos3D select 1, 0];
if ((getPosATL player) distance _pos2D > 10) exitWith {hint "No la tienes tan larga... el hacha."};

_altoarb = _pos2D distance _pos3D;

_cantidad = round (_altoarb / 3);
if (_cantidad > 4) then {_cantidad = 4};

playSound3D ["pop_animaciones\sounds\Swing.wav", player, false, getPosASL player, 1, 1, 50];
player playActionNow "GestureSwing"; 
sleep 1.5;



if ((damage _arbol) < 0.8) exitWith {
    _arbol setDamage (damage _arbol) + 0.2;
};
_arbol setDamage 1;

deleteCollection _arbol;

if (dialog) exitwith {closedialog 0};
if ((random 100) < 30) then {
	_exp = 1;
	["exp",_exp] call ica_fnc_arrayexp;  
};
	
_cantMadera = _cantidad * 3;

titleText [format["Has talado un árbol que medía %1m.", round(_altoarb * 100) / 100],"PLAIN"];

_lena = "Land_WoodenLog_F" createVehicleLocal (getPos _arbol);
_lena setDir (getDir player);
sleep 0.1;
[_lena, [random 1, 2 + (random 3), 2 + (random 2)]] call ica_fnc_setVelocity;

_lena addAction ["Recoger", '
    player playActionNow "PutDown";
    sleep 1;
    deleteVehicle (_this select 0);	
    ["pop_tronco",2] call ica_fnc_item;']; 

_lena = "Land_WoodenLog_F" createVehicleLocal (getPos _arbol);
_lena setDir (getDir player);
sleep 0.1;
[_lena, [random 1, 2 + (random 3), 2 + (random 2)]] call ica_fnc_setVelocity;

_lena addAction ["Recoger", '
    player playActionNow "PutDown";
    sleep 1;
    deleteVehicle (_this select 0);	
    ["pop_tronco",1] call ica_fnc_item;']; 
	
_lena = "Land_WoodenLog_F" createVehicleLocal (getPos _arbol);
//_lena setPos [getPos _arbol select 0, getPos _arbol select 1, (getPos _arbol select 2) + 3];
_lena setDir (getDir player);
sleep 0.1;
[_lena, [random 1, 2 + (random 3), 2 + (random 2)]] call ica_fnc_setVelocity;
_lena addAction ["Recoger", '
    player playActionNow "PutDown";
    sleep 1;
    deleteVehicle (_this select 0);	
    ["pop_tronco",2] call ica_fnc_item;']; 
