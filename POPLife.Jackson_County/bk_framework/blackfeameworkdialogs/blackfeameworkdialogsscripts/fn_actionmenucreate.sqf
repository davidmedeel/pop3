
// ***********************************************************
// PoP Police framework by Blakord
// Create dialog with selected items on array
// ***********************************************************

private ["_CtrsArray","_DlgID","_AllAddButonsArray","_AddingCounter","_DisCtrBut","_DisCtrIco","_TempPartArray","_DisButon","_DisIco","_TotalButonsToAdd","_TotalReady"];
_DlgID 				= param[0];
_AllAddButonsArray 	= param[1];
_AddingCounter = 0;
_CtrsArray = [ [1600,1201],[1601,1202],[1602,1203],[1603,1204],[1604,1205],[1605,1206],[1606,1207],[1607,1208],[1608,1209],[1609,1210],[1610,1211],[1611,1212] ];
_TotalButonsToAdd = count _AllAddButonsArray;
_SpeedComit = 0.1;

If ( _TotalButonsToAdd < 1 ) exitWith { closeDialog 0; };

disableSerialization;
_DisCtrIco = findDisplay _DlgID displayCtrl 1200;
_DisCtrIco ctrlSetTextColor [1, 1, 1, 0.1];
_DisCtrIco ctrlSetText format ["\pop_iconos\icons\MenuActionImgs\BGN\bgn_menu%1.paa",_TotalButonsToAdd];
_DisCtrIco ctrlSetFade -5;
_DisCtrIco ctrlCommit 0.3;
If ( _TotalButonsToAdd > 0 ) Then { _TotalButonsToAdd = _TotalButonsToAdd - 1 };
//hint format ["Botones %1 real %3 -------------------- array %2",_TotalButonsToAdd, _AllAddButonsArray, count _AllAddButonsArray];
{
	_DisButon = _x select 0;
	_DisIco = _x select 1;
	_DisCtrBut = findDisplay _DlgID displayCtrl _DisButon;
	_DisCtrIco = findDisplay _DlgID displayCtrl _DisIco;

	If ( _TotalButonsToAdd >= _AddingCounter ) Then {
		_TempPartArray = _AllAddButonsArray select _AddingCounter;
		_DisCtrBut ctrlSetText toUpper (_TempPartArray select 0);
		_DisCtrBut ctrlSetTooltip (_TempPartArray select 1);
		_DisCtrBut buttonSetAction format [" %1; closeDialog 0 ",_TempPartArray select 2] ;
		_DisCtrBut ctrlSetFade -10;
		_DisCtrBut ctrlCommit 1;
		//_DisCtrBut ctrlSetTextColor {1,1,1,1};
		//_DisCtrBut colorDisabled = {0.4,0.4,0.4,1};
		_DisCtrIco ctrlSetText format ["\pop_iconos\icons\MenuActionImgs\Icons\%1.paa",(_TempPartArray select 3)];
 		If ( !(_TempPartArray select 4) ) Then {
			_DisCtrBut ctrlEnable false;
			_DisCtrIco ctrlSetTextColor [1, 1, 1, 0.3];
		} Else {
			//_DisCtrBut ctrlSetTextColor [ 1, 1, 1, 1];
			//_DisCtrIco ctrlSetTextColor [ 1, 1, 1, 1];
			_SpeedComit = 0.2;
			If ( _AddingCounter > 3 ) Then { _SpeedComit = 0.9; };
			If ( _AddingCounter > 7 ) Then { _SpeedComit = 1.7; };
			_DisCtrBut ctrlSetTextColor [ 1, 1, 1, 0.1];
			_DisCtrBut ctrlSetFade -10;
			_DisCtrBut ctrlCommit _SpeedComit;
			_DisCtrIco ctrlSetTextColor [1, 1, 1, 0.1];
			_DisCtrIco ctrlSetFade -10;
			_DisCtrIco ctrlCommit _SpeedComit;
			_SpeedComit = _SpeedComit + 0.5;
		};
	} Else {
		_DisCtrBut ctrlEnable false;
		_DisCtrBut ctrlSetText "";
		_DisCtrBut ctrlSetTooltip "";
		_DisCtrIco ctrlSetTextColor [1, 1, 1, 0];
		_DisCtrIco ctrlSetText "";
	};
	_AddingCounter = _AddingCounter + 1;
} forEach _CtrsArray;

_DisCtrIco = findDisplay _DlgID displayCtrl 1213;
_DisCtrIco ctrlSetTextColor [1, 1, 1, 0.1];
_DisCtrIco ctrlSetFade -10;
_DisCtrIco ctrlCommit 0.3;
If ( _AddingCounter == 0 ) Then { closeDialog 0; };