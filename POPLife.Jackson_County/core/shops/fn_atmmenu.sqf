
/*
#include <macro.h>

if (!isNil {DDoS}) exitWith {hint "Server is under attack"};
if ((isNil {medel_din}) OR (isNil {medel_atmdin})) exitWith {["errorica", FALSE, TRUE] call BIS_fnc_endMission;};

private["_display","_text","_units","_type","_isBank","_isGov","_rnd"];

if (!isNil {DDoS}) exitWith {hint "Parece que no funciona..."};
if(!life_use_atm) exitWith {
	hint localize "STR_Shop_ATMRobbed";
};

/*if (!isNil {profileNamespace getVariable "dineroBloqueado"}) exitWith {
	hint "Hace poco que has cometido un crimen, sería algo sospechoso utilizar tu cuenta bancaria tan pronto. También puedes blanquear el dinero.";
};*/
/*
if(!dialog) then {
	if(!(createDialog "Life_atm_management")) exitWith {};
};

disableSerialization;

_display = findDisplay 2700;
_text = _display displayCtrl 2701;
_units = _display displayCtrl 2703;

lbClear _units;
_text ctrlSetStructuredText parseText format["<img size='1.7' image='\pop_iconos\icons\bank.paa'/>  %1 €<br/><img size='1.6' image='\pop_iconos\icons\money.paa'/>  %2 €",[medel_atmdin] call life_fnc_numberText,[medel_din] call life_fnc_numberText];

{
	if(alive _x) then {
		switch (side _x) do {
			case west: {_type = "Policía"};
			case civilian: {_type = "Civil"};
			case independent: {_type = "EMS"};
			case east: {_type = "OP"};
		};
		_units lbAdd format["%1 (%2)",_x getVariable["realname",name _x],_type];
		_units lbSetData [(lbSize _units)-1,str(_x)];
	};
} foreach playableUnits;

lbSetCurSel [2703,0];

if(isNil {(grpPlayer getVariable "gang_bank")}) then {
	(getControl(2700,2705)) ctrlEnable false;
    (getControl(2700,2706)) ctrlEnable false;
};






*/





/*
    File: fn_atmMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens and manages the bank menu.
*/
#include <macro.h>

if (!isNil {DDoS}) exitWith {hint "Server is under attack"};
if ((isNil {medel_din}) OR (isNil {medel_atmdin})) exitWith {["errorica", FALSE, TRUE] call BIS_fnc_endMission;};

private["_display","_text","_units","_type","_isBank","_isGov","_rnd"];

if (!isNil {DDoS}) exitWith {hint "Parece que no funciona..."};
if(!life_use_atm) exitWith {
    hint localize "STR_Shop_ATMRobbed";
};
/*if (!isNil {profileNamespace getVariable "dineroBloqueado"}) exitWith {
    hint "Hace poco que has cometido un crimen, sería algo sospechoso utilizar tu cuenta bancaria tan pronto. También puedes blanquear el dinero.";
};*/

if(!dialog) then {
    if(!(createDialog "Life_atm_management")) exitWith {};
};

disableSerialization;

_display = findDisplay 2700;
_text = _display displayCtrl 2701;
_units = _display displayCtrl 2703;
_find = _display displayCtrl 2704;

lbClear _units;
_text ctrlSetStructuredText parseText format["<img size='1.7' image='\pop_iconos\icons\bank.paa'/>  %1 €<br/><img size='1.6' image='\pop_iconos\icons\money.paa'/>  %2 €",[medel_atmdin] call life_fnc_numberText,[medel_din] call life_fnc_numberText];

[] spawn {
    _display = findDisplay 2700;
    _find = _display displayCtrl 2704;
    _textofind = ctrlText _find;
    _units = _display displayCtrl 2703;
    _type = "Civil";

    while {!isNull (findDisplay 2700)} do {

        lbClear _units;

        if (_textofind isEqualTo "") then {

            {
                if(alive _x) then    {
                    switch (side _x) do {
                        case west: {_type = "Policia"};
                        case civilian: {_type = "Civil"};
                        case independent: {_type = "EMS"};
                    };
                    _units lbAdd format["%1 (%2)",_x getVariable["realname",name _x],_type];
                    _units lbSetData [(lbSize _units)-1,str(_x)];
                };
            } foreach playableUnits;
        } else {

            lbClear _units;


            {
                if(alive _x) then {

                    _nombreslipt = name _x splitString "";

                    _nombreslipt resize count _textofind;

                    _nombreslipt = _nombreslipt joinstring "";

                    if (tolower _nombreslipt isEqualTo tolower _textofind) then {

                        switch (side _x) do {
                            case west: {_type = "Policia"};
                            case civilian: {_type = "Civil"};
                            case independent: {_type = "EMS"};
                        };

                        _units lbAdd format["%1 (%2)",_x getVariable["realname",name _x],_type];
                        _units lbSetData [(lbSize _units)-1,str(_x)];

                    };


                };
            } foreach playableUnits;


        };

        waitUntil {sleep 0.1; _textofind != ctrlText _find || (isNull (findDisplay 2700))};
        _textofind = ctrlText _find;

    };
};

lbSetCurSel [2703,0];

if(isNil {(grpPlayer getVariable "gang_bank")}) then {
	(getControl(2700,2705)) ctrlEnable false;
    (getControl(2700,2706)) ctrlEnable false;
};
