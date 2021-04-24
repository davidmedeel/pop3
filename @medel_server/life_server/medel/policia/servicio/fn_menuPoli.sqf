
/*
por: Medel
*/

#include <macro.h>

if (__GETC__(life_coplevel) < 0) exitWith {hint "No eres policia"; closeDialog 0;};

_tipo = param [0,0,[0]];

createDialog "entrarServicio";
_display = findDisplay 8000;
_list = _display displayCtrl 8004;
_rango = (__GETC__(life_coplevel));

switch (_rango) do {
	case 1: {_rango = "Recluta";};
	case 2: {_rango = "Agente";};
	case 3: {_rango = "Oficial";};
	case 4: {_rango = "Sub Inspector";};
	case 5: {_rango = "Inspector";};
	case 6: {_rango = "Inspector Jefe";};
	case 7: {_rango = "Comisario";};
};

_controls = allControls (_display);
{
    _x ctrlSetFade 1; 
    _x ctrlCommit 0;
    _x ctrlSetFade 0;
    _x ctrlCommit 1;
} forEach _controls;

switch (_tipo) do {
    case 0 : {
        (_display displayCtrl 1000) ctrlSetStructuredText parseText format ["<t align = 'center' size='1.7' shadow='0' font='RobotoCondensedBold' color='#0f0f23'>%1</t>","Policia"];

        (_display displayCtrl 8001) ctrlSetText "fotos\policia\policias.paa";
		if (PoliON >= 1) then {_list lbAdd "Policias de Servicio"};
       // PoliON = 0;
        {
            _nombre = name _x;
           if ((side _x) isEqualTo west) then {
                _list lbAdd format["%1 (%2)",_nombre,_rango];
                //PoliON = PoliON + 1;
            };
        } foreach playableUnits;

        if (PoliON isEqualTo 0) then {_list lbAdd "No hay policias de servicio"};
        (_display displayCtrl 8002) buttonSetAction "if (player getVariable ""EMSON"") exitwith {hint ""No puedes estar de EMS a la vez."";}; if !(player getvariable ""PoliON"") then {PoliON = PoliON + 1; publicvariable ""PoliON"";}; [""entrar""] spawn ica_fnc_entrarServicio; closeDialog 0; ";
        (_display displayCtrl 8003) buttonSetAction "if (player getvariable ""PoliON"")then {PoliON = PoliON - 1; publicvariable ""PoliON"";}; [""salir""] spawn ica_fnc_entrarServicio; closeDialog 0;";
    };
};
