/*
	Script Made By  MacRae    
	Modded by [KH]Jman
	Tweaked by Quiksilver for MP compatibility
	
	Levantarse de la silla //Rosen
*/

player setVariable ['QS_seated',false];
[[player,""],"switchMove",TRUE,FALSE] spawn BIS_fnc_MP;
player removeAction standup;