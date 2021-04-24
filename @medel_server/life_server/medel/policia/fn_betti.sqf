
/*
por Medel
*/

_param = param [0];

if (_param isEqualTo "prenso") exitWith {

    private ["_veh"];

    disableSerialization;

    _cosa = nearestObject [player, "pop_prensa"];
    if !(side player in [east,west,independent]) exitWith {};
    _veh = (nearestObjects [_cosa, ["air","car"],20] select 0);

    if (isNil {_veh}) exitWith {
        hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>AVISO<br/><t color='#21618C'><t size='1.2'><t align='center'>No hay ningún vehículo cerca</t>";
    };

    [15, "Destruyendo Vehículo..."] spawn ica_fnc_barrita;

    sleep 15;

    if (!alive player) exitWith {};
    _crew = crew _veh; {
        {player action ["Eject", vehicle player]} remoteexec ["Bis_fnc_spawn", _x];
    } forEach _crew;
    waitUntil {count (crew _veh) isEqualTo 0};
    _veh setPos [0,0,1000];
    _veh setDamage 1;
};
