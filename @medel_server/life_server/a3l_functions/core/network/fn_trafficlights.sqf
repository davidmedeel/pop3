


A3L_Fnc_TraflightA = {

IF(isServer) THEN {
private ["_trafficlight"];

_trafficlight = _this select 0;
if (!(typeOf _trafficlight IN ["Land_E76_trafficlight01a","Land_E76_trafficlight03a"])) exitwith {};

sleep 3;

WHILE{true} DO {

_trafficlight animate ["switchyellow",0];

sleep 6;
_trafficlight animate ["switchred",1];
_trafficlight animate ["switchyellow",1];
_trafficlight animate ["switchgreen",0];

sleep 20;

_trafficlight animate ["switchgreen",1];
_trafficlight animate ["switchyellow",0];

sleep 6;

_trafficlight animate ["switchyellow",1];
_trafficlight animate ["switchred",0];

sleep 32;
};
};

};

A3L_Fnc_TraflightB = {

IF(isServer) THEN {
private ["_trafficlight"];
_position2 = [8678.62,6827.37,0.00143909];

_trafficlight = _this select 0;
if (!(typeOf _trafficlight IN ["Land_E76_trafficlight01b","Land_E76_trafficlight02a"])) exitwith {};

_sleep = 3;
if (
(_trafficlight == _position2 nearestObject 1018986)
OR (_trafficlight == _position2 nearestObject 1018987)
OR (_trafficlight == _position2 nearestObject 1019849)
OR (_trafficlight == _position2 nearestObject 1019761)) then {
_sleep = 30;
};


sleep _sleep;

WHILE{true} DO {

_trafficlight animate ["switchyellow",1];
_trafficlight animate ["switchred",0];

sleep 32;

_trafficlight animate ["switchyellow",0];

sleep 6;

_trafficlight animate ["switchred",1];
_trafficlight animate ["switchyellow",1];
_trafficlight animate ["switchgreen",0];

sleep 20;

_trafficlight animate ["switchgreen",1];
_trafficlight animate ["switchyellow",0];

sleep 6;
};
};

};

private ["_position","_objectsA","_objectsB","_2a1","_2a2"];

_position = [8684.98,6939.83,0.00143909];


_objectsA = nearestObjects [_position, ["Land_E76_trafficlight01a","Land_E76_trafficlight03a"], 1000];
_objectsB = nearestObjects [_position, ["Land_E76_trafficlight01b","Land_E76_trafficlight02a"], 1000];


{
[_x] spawn A3L_Fnc_TraflightA;
} foreach _objectsA;

{
[_x] spawn A3L_Fnc_TraflightB;
} foreach _objectsB;