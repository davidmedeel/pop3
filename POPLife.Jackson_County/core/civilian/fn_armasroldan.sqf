
#include <macro.h>
waitUntil {!isNull player};

_precio = 100000;
_unit = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;


if(isNull _unit) exitWith {}; //if not the thief get bent

//puede pagar?¿
 if(life_atmcash - _precio < 100000) exitWith { hint "No tienes suficiente dinero";[] spawn { sleep 5;hint "";} };


 /*//nivel de poli
  if(playerSide != west) exitWith { hint "No eres poli!"; []spawn { sleep 5;hint "";} };
 if(__GETC__(life_coplevel) < 2) exitWith { hint "No tienes rango suficiente";[] spawn { sleep 5;hint "";}; };
*/

//equipar clase admin
life_atmcash = life_atmcash-_precio;

//_unit  addVest "GEO_CHALECO";
//_unit  forceAddUniform "A3L_SECRET";
//_unit  addBackpack "mochila_mediana";

_unit  addWeapon "RH_g19";
_unit  addWeapon "RH_g19";
/*_unit  addItem "pop_coca_t";
_unit  addItem "pop_coca_t";
_unit  addItem "pop_coca_t";
_unit  addItem "pop_coca_t";
_unit  addItem "pop_coca_t";
_unit  addItem "pop_coca_t";
_unit  addItem "pop_coca_t";
_unit  addItem "pop_coca_t";
_unit  addItem "pop_coca_t";
_unit  addItem "pop_coca_t";
_unit  addItem "pop_coca_t";
_unit  addItem "pop_coca_t";
_unit  addItem "pop_coca_t";
_unit  addItem "pop_coca_t";
_unit  addItem "pop_coca_t";
_unit  addItem "pop_coca_t";
_unit  addItem "pop_coca_t";
_unit  addItem "pop_coca_t";
_unit  addItem "pop_coca_t";
_unit  addItem "pop_coca_t";
_unit  addItem "pop_coca_t";
_unit  addItem "pop_coca_t";
_unit  addItem "pop_coca_t";
_unit  addItem "pop_coca_t";
_unit  addItem "pop_coca_t";*/

//_unit addMagazines ["RH_17Rnd_9x19_g17", 10];

//solo para Royal


reload _unit;
if(true) exitWith{hint "Ya Tienes La Droga! Ve A Venderla!";[] spawn { sleep 5;hint "";} };