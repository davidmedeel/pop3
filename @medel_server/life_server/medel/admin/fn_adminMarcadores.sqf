
#include "..\..\script_macros.hpp"

params [
    ["_reOpen", false, [false]]
];

if (FETCH_CONST(life_adminlevel) < 1) exitWith {
	closeDialog 0; 
	hint parsetext
	"<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
	<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes suficiente nivel de admin</t>";
};

if (deServicio == 0) exitwith {hint "No estás de servicio";};

life_markers_active = true;

if !(_reOpen) then {
    life_markers = !life_markers;
    hint localize (["STR_ANOTF_MDisabled", "STR_ANOTF_MEnabled"] select life_markers);
};

for "_i" from 0 to 1 step 0 do {
    if !(life_markers && {life_markers_active}) exitWith {};
    private _markers = [];

    {
        private _colour = switch (side _x) do {
            case west: {"ColorBlue"};
            case independent: {"ColorGreen"};
            case east: {"colorOPFOR"};
            default {"colorWhite"};
        };

        private _name = name _x;
        createMarkerLocal[_name, position _x];
        _name setMarkerTypeLocal "mil_dot";
        _name setMarkerColorLocal _colour;
        _name setMarkerTextLocal _name;
        _markers pushBack _name;
        true

    } count (allPlayers - entities "HeadlessClient_F");

    sleep 0.5;
    {deleteMarkerLocal _x} count _markers;
};
