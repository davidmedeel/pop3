/*
    File: fn_raceConf.sqf
    Author: Akryllax
    Desc:
*/

private["_trackID"];

_trackID = [_this, 0, "", [""]] call BIS_fnc_param;

_ret = switch (_trackID) do {
    
    case "race_01": {
        [
                   0,    //modo
               50000,    //precio
         [200000,180],   //1er premio / tiempo
           [150000,220],   //2o  premio / tiempo
          [65000,250]    //3er premio / tiempo
        ]
    };
    
    case "race_02": { //Autoescuela
        [
                   1,    //modo
               3000,    //precio
         [-1,100]   // Ignorar primer valor / Tiempo minimo para obtener el titulo.
        ]
    };
	
	case "race_03": { //Autoescuela
        [
                   2,    //modo
               15000,    //precio
         [-1,120]   // Ignorar primer valor / Tiempo minimo para obtener el titulo.
        ]
    };
    
    default {
        []
    };
};

_ret