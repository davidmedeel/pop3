
// ***********************************************************
// PoP Police framework by Blakord
// Identificar posicion del jugador en el vehiculo
// ***********************************************************

private ["_Target","_MyVehicule","_tempMsg"];

_Target  = param[0];

if ( ! isPlayer _Target ) exitWith { nil; };
if ( vehicle _Target == _Target ) exitWith { nil; };

_MyVehicule = assignedVehicle _Target;

If (_Target in (crew _MyVehicule)) Then { 
	If ( isNil "_tempMsg" ) Then { _tempMsg = "na"; };
	If (_MyVehicule getCargoIndex _Target >= 0 ) Then {
		If (_MyVehicule getCargoIndex _Target == 0 ) Then {
			_tempMsg = "cop";
		} Else {
			_tempMsg = "car";
		};
	} Else {
		If (driver _MyVehicule == _Target) Then { _tempMsg = "dri"; };
		If (commander _MyVehicule == _Target) Then { _tempMsg = "com"; };
		If (gunner _MyVehicule == _Target) Then { _tempMsg = "gun"; };
		//If (_Target in (crew _MyVehicule)) Then { _tempMsg = "Unknow"; };
	};
};

_tempMsg;

