
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

if(isNil 'nombresAdminCheck') then {
    nombresadmin = addMissionEventHandler ["Draw3D",{
    _arr = nearestObjects [player, ["Man", "Car"], 60];
    if ((count _arr) > 1) then {
        {
            _dist = player distance _x;
            _dist = if (_dist < 1.5) then {1.5} else {_dist};
 
            drawIcon3D [
                "\a3\ui_f\data\map\Markers\System\dummy_ca.paa",
                [1,0.2,0.2, (60 - _dist) / 50],
                [((getPos _x) select 0), ((getPos _x) select 1), 2+(1.8/(60/_dist))],
                1,
                1,
                0,
                //format ["%1 - %2",_x getVariable "realname", getplayeruid _x],
                format ["%1 - %2",name _x, getplayeruid _x], 
                1.8,
                0.036,
                "TahomaB"
            ];
        } forEach _arr;
    };
}];
nombresAdminCheck = 1;
hint "Nombres Activados";
["Admin Log",format ["%1 - (%2) ha activado los nombres en la cabeza de los jugadores",profileName,(getPlayerUID player)]] remoteexeccall ["ica_fnc_customlog",2];
} else {
    hint "Nombres Desactivados";
	nombresAdminCheck = nil;
    removeMissionEventHandler ['Draw3D', nombresadmin];
    ["Admin Log",format ["%1 - (%2) ha desactivado los nombres en la cabeza de los jugadores",profileName,(getPlayerUID player)]] remoteexeccall ["ica_fnc_customlog",2];
};
