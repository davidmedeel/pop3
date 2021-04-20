
// ***********************************************************
// PoP Police framework by Blakord
// RagDoll efect for failling players
// ***********************************************************

/* 
Disponibles
	Jonzie_Siren - Sirena de aire EMS // Jonzie
	Jonzie_LAPD_SIREN - Sirena de policia Wail / Jonzie
	jonzie_LAPD_WARNING_2 - Sirena de policia Yelp / Jonzie
	jonzie_LAPD_WARNING - Sirena de policia Prty / Jonzie
	bk_sirena1_Wail - Sirena de policia Wail / Blakord
	bk_sirena2_Yelp - Sirena de policia YELP / Blakord
	bk_sirena3_Prty - Sirena de policia Prty / Blakord 
	bk_sirenaRumbler1_Wail - Sirena de policia con Rumbler Wail / Blakord
	bk_sirenaRumbler2_Yelp - Sirena de policia con Rumbler YELP / Blakord
	bk_sirenaRumbler3_Prty - Sirena de policia con Rumbler Prty / Blakord 
	bk_sirenaEuropa_1 - Sirena EMS policia normal europea / Blakord
	bk_sirenaEuropa_2 - Sirena EMS policia de alta ganacia europea / Blakord
	bk_sirenaEuropa_3 - Sirena EMS Espana / Blakord
	bk_sirenaEuropa_4 - Sirena EMS policia de ganacia media europea / Blakord
	bk_sirenaTonoEsp1_Wail - Sirena tono bajo esp / Blakord
	bk_sirenaTonoEsp2_Yelp - Sirena tono bajo esp / Blakord
	bk_sirenaTonoEsp3_Prty - Sirena tono bajo esp / Blakord
	bk_sirenaAir1_Wail - Sirena de aire Wail / Blakord
	bk_sirenaAir2_Yelp - Sirena de aire Yelp / Blakord
	bk_sirenaAir3_Prty - Sirena de aire Prty / Blakord
	bk_sirenaEmsAlt1_Wail - Sirena EMS alterna Wail / Blakord
	bk_sirenaEmsAlt2_Yelp - Sirena EMS alterna Yelp / Blakord
	bk_sirenaEmsAlt3_Prty - Sirena EMS alterna Prty / Blakord
*/

private ["_PoP_Class","_MyVehicule","_TempSirenaON","_TempSound","_BkNewSiren","_Return","_vehChk","_myPos"];

_CallParam = param[0];
_ExtrParam = param[1];

_VehIsPoli = false;
_VehIsEMS = false;
_VehIsPoliAir = false;

_Return = false;
_vehChk = "";

if (isNil {BkSirenaDelay}) Then {BkSirenaDelay = 0};
If ( Time < BkSirenaDelay ) exitWith {true};
BkSirenaDelay = Time + 1;
//BkSirenaDelay = time + 1;

If ( _CallParam == "fin" ) exitWith {
	if ( vehicle player != player ) then {
		_MyVehicule = assignedVehicle player;
		_myPos = [player] call ica_fnc_vehiculoAsiento;
		//f (driver _MyVehicule == player) Then {
		If ( _myPos == "dri" OR (_myPos == "cop" AND side player == west ) ) Then {
			{ deleteVehicle _x; } forEach attachedObjects _MyVehicule; 
			//If ( !isNil "BkPoliSirenaCar" ) Then { { deleteVehicle _x; } forEach attachedObjects BkPoliSirenaCar; };
			BkPoliSirenaCar setVariable["SirenaData",false,true];
			_Return = true;
		};
	};
	_Return
};

//If ( _CallParam != "S1" AND _CallParam != "S2" AND _CallParam != "S3" ) exitWith {_Return};

if ( vehicle player != player ) then {
	_MyVehicule = assignedVehicle player;
	_PoP_Class = typeOf _MyVehicule;
	_myPos = [player] call ica_fnc_vehiculoAsiento;
	//If (driver _MyVehicule == player) Then {
	If ( _myPos == "dri" OR (_myPos == "cop" AND side player == west ) ) Then {
		_vehChk = [ "",_PoP_Class ] call ica_fnc_vehiculoValidar;
		If ( "poliveh" in _vehChk AND !("polinav" in _vehChk) AND !("polimoto" in _vehChk) ) Then {
			_Return = true;
			switch (_CallParam) do {
				case "S1": 	{ _TempSound = "jonzie_LAPD_siren" };
				case "S2": 	{ _TempSound = "jonzie_LAPD_WARNING_2" };
				case "S3": 	{ _TempSound = "jonzie_LAPD_WARNING" };
				case "S4": 	{ _TempSound = "bk_sirenaEuropa_4" };
				case "S21": { _TempSound = "bk_sirenaRumbler1_Wail" };
				case "S22": { _TempSound = "bk_sirenaRumbler2_Yelp" };
				case "S23": { _TempSound = "bk_sirenaRumbler3_Prty" };
				case "S24": { _Return = false; };
				//default 	{ _TempSound = "jonzie_LAPD_siren" };
			};
		};
		If ( "polinav" in _vehChk OR "polimoto" in _vehChk ) Then {
			_Return = true;
			switch (_CallParam) do {
				case "S1": 	{ _TempSound = "bk_sirena1_Wail" };
				case "S2": 	{ _TempSound = "bk_sirena2_Yelp" };
				case "S3": 	{ _Return = false; };
				case "S4": 	{ _Return = false; };
				case "S21": { _Return = false; };
				case "S22": { _Return = false; };
				case "S23": { _Return = false; };
				case "S24": { _Return = false; };
			}; 
		};
		If ( "emsveh" in _vehChk ) Then {
			_Return = true;
			switch (_CallParam) do {
				case "S1": 	{ _TempSound = "bk_sirenaEuropa_3" };
				case "S2": 	{ _TempSound = "bk_sirenaEuropa_2" }; 
				case "S3": 	{ _TempSound = "bk_sirenaEuropa_1" };
				case "S4": 	{ _Return = false; };
				case "S21": { _TempSound = "bk_sirenaTonoEsp1_Wail" };
				case "S22": { _TempSound = "bk_sirenaTonoEsp2_Yelp" };
				case "S23": { _TempSound = "bk_sirenaTonoEsp3_Prty" };
				case "S24": { _Return = false; };
			}; 
		};
		If ( "airveh" in _vehChk ) Then {
			_Return = true;
			switch (_CallParam) do {
				case "S1": 	{ _TempSound = "bk_sirenaAir1_Wail" };
				case "S2": 	{ _TempSound = "bk_sirenaAir2_Yelp" };
				case "S3": 	{ _TempSound = "bk_sirenaAir3_Prty" };
				case "S4": 	{ _TempSound = "bk_sirenaEuropa_2" };
				case "S21": { _Return = false; };
				case "S22": { _Return = false; };
				case "S23": { _Return = false; };
				case "S24": { _Return = false; };
			}; 
		};
		If ( _Return ) Then {
			{ deleteVehicle _x; } forEach attachedObjects _MyVehicule;
			_BkNewSiren = createSoundSource [_TempSound, position _MyVehicule, [], 20];
			_BkNewSiren synchronizeObjectsAdd [SirenaControl];
			_BkNewSiren attachTo [_MyVehicule, [0, 0, 1] ]; 
			BkPoliSirenaCar setVariable["SirenaData",true,true];
		};
	};
};

_Return

//_Types = ["type1","type2",...];
//_AllUnits= [unit1,unit2,...];

// _AllUnitsOfType = [];

// {
	// _tmptype = _x;
	// {
		// if (_x isKindOf _tmptype) then {_AllUnitsOfType = _AllUnitsOfType + [_x]}	
	// } forEach _AllUnits
// } forEach _Types;



