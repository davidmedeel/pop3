/*
    File: fn_restrain.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Restrains the client.
*/
private ["_cop","_player","_vehicle"];
_cop = _this select 0;
_player = player;
_vehicle = vehicle player;
if (isNull _cop) exitWith {};

//Monitor excessive restrainment
[] spawn {
    private "_time";
    for "_i" from 0 to 1 step 0 do {
        _time = time;
        waitUntil {(time - _time) > (5 * 60)};

        if (!(player getVariable ["restrained",false])) exitWith {};
        if (!([west,getPos player,30] call life_fnc_nearUnits) && (player getVariable ["restrained",false]) && isNull objectParent player) exitWith {
            player setVariable ["restrained",false,true];
            player setVariable ["Escorting",false,true];
            player setVariable ["transporting",false,true];
            detach player;
            titleText[localize "STR_Cop_ExcessiveRestrain","PLAIN"];
        };
    };
};

//titleText[format [localize "STR_Cop_Restrained",_cop getVariable ["realname",name _cop]],"PLAIN"];
[player,"Cuffed"] remoteExec ["A3L_Fnc_NearestSound",2];
life_disable_getIn = true;
life_disable_getOut = false;

while {player getVariable  "restrained"} do {
    if (vehicle player isEqualTo player) then {
        player playMove "AmovPercMstpSnonWnonDnon_Ease";
    };
    
    waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getVariable "restrained") || vehicle player != player};

    if (!alive player) exitWith {
        player setVariable ["restrained",false,true];
        player setVariable ["Escorting",false,true];
        player setVariable ["transporting",false,true];
        detach _player;
    };

    if (!alive _cop) then {
        player setVariable ["Escorting",false,true];
        detach player;
    };
};

//disableUserInput false;

if (alive player) then {
    player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
    player setVariable ["Escorting",false,true];
    player setVariable ["transporting",false,true];
    detach player;
};
