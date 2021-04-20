WaitUntil {sleep 2; !IsNull (FindDisplay 602)}; 
		
call BWLoadCalc_Fnc_MotherLoad_Display;
nul = [] spawn BWLoadCalc_Fnc_WEIGHTMONITOR;

WaitUntil {IsNull (FindDisplay 602)};

nul = [] spawn BWLoadCalc_fnc_GEARMONITOR;