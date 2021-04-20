
// ***********************************************************
// PoP Police framework by Blakord
// Main common dialog script
// ***********************************************************

private ["_ChangeTimer","_ChangeEvery","_ChangeXCounter","_ChangeXCounterEvery","_ChangeLedIsOn"];
_ChangeTimer = 10;
_ChangeEvery = 1;
_ChangeXCounter = 0;
_ChangeXCounterEvery = 0;
_ChangeLedIsOn = false;
//Hint "** INICIA";
while {BK_DialogOpen} do {
	_ChangeXCounter = _ChangeXCounter + 1;
	If (_ChangeXCounter >= _ChangeTimer) Then {
		_ChangeXCounterEvery = _ChangeXCounterEvery + 1;
		_ChangeXCounter = 0;
	};
	If (_ChangeXCounterEvery >= _ChangeEvery) Then {
		_ChangeXCounterEvery = 0;
		If (_ChangeLedIsOn) Then {
			ctrlSetText [1200, "BlackFeameWorkImages\DialogHeaderOff.jpg"];
			_ChangeLedIsOn = false;
		} Else {
			ctrlSetText [1200, "BlackFeameWorkImages\DialogHeaderOn.jpg"];
			_ChangeLedIsOn = true;
		};
	};
	Sleep 0.1;
};
//Hint "Cerrando script de dialogos animados";