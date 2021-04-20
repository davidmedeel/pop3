/*
	File: fn_onIngameKilled.sqf
	Author: Akryllax
	Desc: This is a custom EH. Triggers when players is dead by any mean (life_is_alive == false)
*/

[] spawn { //Dead screen effect
	PP_deadEffect = ppEffectCreate ["ColorCorrections",1500];
	PP_deadEffect ppEffectEnable true;
	PP_deadEffect ppEffectAdjust [0.67,1,0.01,[0.328,0.403,0,-0.34],[1.8,3.117,2.589,0.7],[0.407,-0.498,0.407,0],[0.559,0.571,0,0,0,0,4.076]];
	PP_deadEffect ppEffectCommit 1;
};