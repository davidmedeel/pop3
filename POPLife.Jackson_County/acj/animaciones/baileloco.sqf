/////////////////////////////
// TDR ACJ
// Animaciones de baiele //
//////////////////////////

if (!isNil "life_fnc_animsync") then
{
[player,"cl3_crazydrunkdance"] remoteexeccall ["life_fnc_animsync",-2];
} else
{
player switchmove "cl3_crazydrunkdance"
};

[] spawn
{
sleep 50;
[player,""] remoteexeccall ["life_fnc_animsync",-2];
A3L_isDancing = false;
};