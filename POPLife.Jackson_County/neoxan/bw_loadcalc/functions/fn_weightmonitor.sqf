private ["_currentWeight"];

_currentWeight = load player;

while {!IsNull (FindDisplay 602)} do {

_NewWeight = load player;
if (_NewWeight == _currentWeight) then {call BWLoadCalc_Fnc_MotherLoad_Display;};
sleep 0.1;
_currentWeight = load player;

};