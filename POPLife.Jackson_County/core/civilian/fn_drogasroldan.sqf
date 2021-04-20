waitUntil {!isNull player};

_din = 35000;
_unit = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;


if(isNull _unit) exitWith {}; //if not the thief get bent
	
//puede pagar?¿
_t = if (("log" call ica_fnc_expToLevel) >= 5) then {3} else {12};
 if(medel_din - _din < 0) exitWith { hint "No tienes suficiente dinero";[] spawn { sleep 5;hint "";} };

//equipar clase cocaina



medel_din = medel_din-_din;
/*
removeAllWeapons _unit;
removeallassigneditems _unit;
removeallcontainers _unit;
removeuniform _unit;
removevest _unit;
removebackpack _unit;
removeHeadgear _unit;


_unit addGoggles "G_Balaclava_Lowprofile"; 
_unit  addVest "V_HarnessO_brn";
_unit  forceAddUniform "U_OG_Guerilla2_1";*/

 
/*_unit addWeapon 'Binocular';

_unit additem 'ItemWatch';
_unit assignItem "ItemWatch"; 
_unit addItem "ItemRadio"; 
_unit assignItem "ItemRadio"; 
_unit addItem "ItemGPS";
_unit assignItem "ItemGPS";
_unit addItem "ItemMap";
_unit assignItem "ItemMap";
_unit addItem "ItemCompass"; 
_unit assignItem "ItemCompass"; 

_unit  addWeapon "arifle_SDAR_F";

_unit addMagazines ["30Rnd_556x45_Stanag", 5];
   

_unit  addItem "NVGoggles_OPFOR"; 
_unit  assignItem "NVGoggles_OPFOR";*/


/*_unit  addBackPack "B_TacticalPack_oli"; */
mybackpack = unitBackpack _unit ;
mybackpack addItemCargoGlobal ["pop_coca_t", 25]; 
//mybackpack addItemCargoGlobal ["FirstAidKit", 2];


/*solo para altis
[true,"water",2] call life_fnc_handleInv;
[true,"tbacon",2] call life_fnc_handleInv;
[true,"redgull",2] call life_fnc_handleInv;
*/
reload _unit;
//if(true) exitWith{hint "Ti Ladron equipada";[] spawn { sleep 5;hint "";} };
[[["YA TIENES LA DROGA, LLEVASELA AL VIEJO EN SAN CRISTOBAL"]], "BIS_fnc_typeText", true, true, false] call BIS_fnc_MP;