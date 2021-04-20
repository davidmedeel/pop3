
class pesca {
	idd = -1;
	movingEnable = 0;
	onLoad = "abierto = true; ";
	onUnLoad = "if (count (ropes (vehicle player)) != 0) then {ropeDestroy (ropes (vehicle player) select 0)}; abierto = nil; ";
	onMouseZChanged = "['tira'] spawn ica_fnc_pesca; ";
	
	class controls {
        class medel: RscText
        {
            idc = -1;
            text = "Medel"; //--- ToDo: Localize;
            x = 0.964445 * safezoneW + safezoneX;
            y = -0.0166667 * safezoneH + safezoneY;
            w = 0.0412603 * safezoneW;
            h = 0.055 * safezoneH;
           colorBackground[] = {0,0,0,0};
        };
	};
};
