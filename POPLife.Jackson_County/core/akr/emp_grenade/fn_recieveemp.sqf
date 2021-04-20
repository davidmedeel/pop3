/*
	File: fn_recieveEMP.sqf
	Author: Akryllax
	Desc:
	
	Params: 
		_time
*/

_this spawn {

	["EMP_Hit",["Has sido alcanzado por un EMP"]] call bis_fnc_showNotification;

	PP_film = ppEffectCreate ["FilmGrain",2000];
	PP_film ppEffectEnable true;
	PP_film ppEffectAdjust [0.593,5.228,0,1.71,10,true];
	PP_film ppEffectCommit 0.5;
	// Time: 7:1. Overcast: 0. Fog: 0 
	// GF PostProcess Editor parameters: Copy the following line to clipboard and click Import in the editor.
	//[[false,100,[0.05,0.05,0.3,0.3]],[false,200,[0.1,0.1,true]],[false,300,[2,0.4,0.4,2,1,-2,-1,0.1,0.01,0.1,0.01,0.02,0.05,1,1]],[false,1500,[1,1,0,[0,0,0,0],[1,1,1,1],[0,0,0,0],[0,0,0,0,0,0,4]]],[false,500,[10]],[true,2000,[0.593,5.228,0,1.71,10,true]],[false,2500,[1,1,1]]]
	
	sleep 60;

	PP_film ppEffectEnable true;
	PP_film ppEffectAdjust [0,0,0,0,0,true];
	PP_film ppEffectCommit 0.5;
	// Time: 7:1. Overcast: 0. Fog: 0 
	// GF PostProcess Editor parameters: Copy the following line to clipboard and click Import in the editor.
	//[[false,100,[0.05,0.05,0.3,0.3]],[false,200,[0.1,0.1,true]],[false,300,[2,0.4,0.4,2,1,-2,-1,0.1,0.01,0.1,0.01,0.02,0.05,1,1]],[false,1500,[1,1,0,[0,0,0,0],[1,1,1,1],[0,0,0,0],[0,0,0,0,0,0,4]]],[false,500,[10]],[true,2000,[0,0,0,0,0,true]],[false,2500,[1,1,1]]]
};