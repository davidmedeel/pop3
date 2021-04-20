/////////////////////////////
// TDR ACJ
// Animaciones de baiele //
//////////////////////////

if (!isNil "life_fnc_animsync") then
{
[player,"A3L_Crazy_Dance"] remoteexeccall ["life_fnc_animsync",-2];
} else
{
player switchmove "A3L_Crazy_Dance"
};

[] spawn
{
sleep 40;
[player,""] remoteexeccall ["life_fnc_animsync",-2];
A3L_isDancing = false;
};