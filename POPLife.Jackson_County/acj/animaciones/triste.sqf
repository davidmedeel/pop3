/////////////////////////////
// TDR ACJ
// Animaciones de triste //
//////////////////////////

if (!isNil "life_fnc_animsync") then
{
[player,"A3L_Facepalm"] remoteexeccall ["life_fnc_animsync",-2];
} else
{
player switchmove "A3L_Facepalm"
};

[] spawn
{
sleep 2;
[player,""] remoteexeccall ["life_fnc_animsync",-2];

A3L_isDancing = false;
};