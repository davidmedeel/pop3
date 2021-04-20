/////////////////////////////
// TDR ACJ
// Animaciones
//////////////////////////

if (!isNil "life_fnc_animsync") then
{
[player,"A3L_Threaten"] remoteexeccall ["life_fnc_animsync",-2];
} else
{
player switchmove "A3L_Threaten"
};

[] spawn
{
sleep 6;
[player,""] remoteexeccall ["life_fnc_animsync",-2];
A3L_isDancing = false;
};