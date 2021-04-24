
/*
por: Medel
*/

#include "..\..\script_macros.hpp"

if (FETCH_CONST(life_adminlevel) < 1) exitWith {
	closeDialog 0; 
	hint parsetext
	"<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
	<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes suficiente nivel de admin</t>";
};

if (deServicio == 0) exitwith {hint "No estás de servicio";};

if ((cursorObject isKindOf "landVehicle") OR (cursorObject isKindOf "Ship") OR (cursorObject isKindOf "Air")) then {
    vehicle cursorTarget setFuel 100;
	hint parsetext "<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>ADMIN</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Has llenado de gasolina un vehículo.</t>";
	["Admin Log",format ["%1 - (%2) ha llenado de gasolina un vehículo.",profileName,(getPlayerUID player)]] remoteexeccall ["ica_fnc_customlog",2];
} else {
    hint parsetext "<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>AVISO</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>No estás apuntando a ningún vehículo</t>";
};
