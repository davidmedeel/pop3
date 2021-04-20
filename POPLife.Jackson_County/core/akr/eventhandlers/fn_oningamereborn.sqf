/*
	File: fn_onIngameKilled.sqf
	Author: Akryllax
	Desc: This is a custom EH. Triggers when players is reborn (fully respawned) by any mean (life_is_alive == true)
*/

[] spawn { //Dead screen effect
	PP_deadEffect ppEffectEnable true;
	PP_deadEffect ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,1],[0,0,0,0],[0,0,0,0,0,0,4]];
	PP_deadEffect ppEffectCommit 1;
};