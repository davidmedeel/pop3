
// ***********************************************************
// PoP Police framework by Blakord
// Police Fx blips, calls, prioritary and horn
// ***********************************************************

private ["_MyVehicule","_PoP_Class","_PoliceVehicles","_EMSAirVehicles","_EMSModVehicles","_VehIsPoli","_VehIsPoliAir","_VehIsEMS","_MyMsg","_SoundType","_Gosound","_GosoundAir","_SndTime","_SndAirTime",
		"_SndArray","_SndEmsArray","_SndEmsTime","_SndAirArray","_vehChk","_SndBarArray","_SndBarTime","_SndYatArray","_SndYatTime","_GoTimer","_return","_myPos"];
_SoundType = _This select 0;
_VehIsPoli = false;
_VehIsEMS = false;
_VehIsPoliAir = false;

_MyMsg = "";
_Gosound = "";
_GosoundAir = "";
_vehChk = "";

if (isNil {LastPoliceCall}) Then {LastPoliceCall = 0};
If ( (time < LastPoliceCall) ) exitWith { If (PoPFwDebug) Then { hint "no abuses de la sirena"} };

switch (_SoundType) do {
	case "blip": {
		_SndArray = ["Blip_1","Blip_2","Blip_3","Blip_4","Blip_5","Blip_6","Blip_7","Blip_8"]; _SndTime = [3,4,4,3,3,3,6,4];
		_SndEmsArray = ["EMSBlip_1","EMSBlip_2","EMSBlip_3"]; _SndEmsTime = [4,4,6];
		_SndAirArray = ["Air_Blip_1","Air_Blip_2","Air_Blip_3"]; _SndAirTime = [11,9,20];
		_SndBarArray = []; _SndBarTime = [];
		_SndYatArray = []; _SndYatTime = [];
	};
	case "horn": {
		_SndArray = ["Horn_1","Horn_2","Horn_3","Horn_4","Horn_5"]; _SndTime = [5,3,4,4,3];
		_SndEmsArray = ["EMS_Horn_1","EMS_Horn_2","EMS_Horn_3","EMS_Horn_4"]; _SndEmsTime = [3,3,4,3];
		_SndAirArray = ["Air_Horn_1","Air_Horn_2","Air_Horn_3","Air_Horn_4","Air_Horn_5"]; _SndAirTime = [3,3,3,6,3];
		_SndBarArray = ["hornBarcoGrande","hornBarcoMedio"]; _SndBarTime = [15,15];
		_SndYatArray = ["hornYate","hornYate2"]; _SndYatTime = [15,15];
	};
	case "prty": {
		_SndArray = ["PRTY_1", "PRTY_2","PRTY_3"]; _SndTime = [3,4,3];
		_SndEmsArray = []; _SndEmsTime = [];
		_SndAirArray = ["Air_PRTY_1", "Air_PRTY_2"]; _SndAirTime = [10,11];
		_SndBarArray = []; _SndBarTime = [];
		_SndYatArray = []; _SndYatTime = [];
	};
	case "voice": {
		_SndArray = ["VoiceQ1", "VoiceQ2"]; _SndTime = [8,6];
		_SndEmsArray = []; _SndEmsTime = [];
		_SndAirArray = []; _SndAirTime = [];
		_SndBarArray = []; _SndBarTime = [];
		_SndYatArray = []; _SndYatTime = [];
	};
};

_GoTimer = 0;
_return = false;

if ( vehicle player != player ) then {
	_MyVehicule = assignedVehicle player;
	_PoP_Class = typeOf _MyVehicule;
	_myPos = [player] call ica_fnc_vehiculoAsiento;
	//If (driver _MyVehicule == player) Then {
		_vehChk = [ "",_PoP_Class ] call ica_fnc_vehiculoValidar;
		If ( "poliveh" in _vehChk AND !("polinav" in _vehChk) AND !("polimoto" in _vehChk) AND (_myPos == "dri" OR (_myPos == "cop" AND side player == west )) ) Then {
			_Gosound = selectRandom _SndArray;
			_GoTimer = time + ( _SndTime select ( _SndArray find _Gosound )) ;
			[_MyVehicule, _Gosound] call CBA_fnc_globalSay3d;
			LastPoliceCall = time + ( _SndTime select ( _SndArray find _Gosound )) ;
		};
		If ( "emsveh" in _vehChk AND !("emshel" in _vehChk) AND !("emsnav" in _vehChk) AND _myPos == "dri" ) Then {
			_Gosound = selectRandom _SndEmsArray;
			_GoTimer = time + ( _SndEmsTime select ( _SndEmsArray find _Gosound )) ;
		};
		If ( "airveh" in _vehChk  AND _myPos == "dri" ) Then {
			_Gosound = selectRandom _SndAirArray;
			_GoTimer = time + ( _SndAirTime select ( _SndAirArray find _Gosound )) ;
		};
		If ( "yate" in _vehChk AND _myPos == "dri" ) Then {
			_Gosound = selectRandom _SndYatArray;
			_GoTimer = time + ( _SndYatTime select ( _SndYatArray find _Gosound )) ;
		};
		If ( "navio" in _vehChk AND _myPos == "dri" ) Then {
			_Gosound = selectRandom _SndBarArray;
			_GoTimer = time + ( _SndBarTime select ( _SndBarArray find _Gosound )) ;
		};
		If (_GoTimer > 0) Then {
			[_MyVehicule, _Gosound] call CBA_fnc_globalSay3d;
			LastPoliceCall = _GoTimer ;
			_return = true;
		};
	//};
};

_return




