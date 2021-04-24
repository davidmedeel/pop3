/*
Animación de llenar botella con la rueda del ratón
by: Icaruk

["menu"] spawn ica_fnc_llenaBotella;
*/


_param = _this select 0;

if (_param isEqualTo "menu") exitWith {
	if !(playerSide isEqualTo civilian) exitWith {hint "No eres civil ¿Que intentas?";};
	if (deServicio == 1) exitwith {hint "Estás de sercivio, ¿Te parece poco la paguita de admin?";};
	disableSerialization;
	createDialog "llenandoBotella";
	_ui = uiNameSpace getVariable "llenandoBotella";
	EHbotella = _ui displayAddEventHandler ["MouseZChanged", "['llena'] spawn ica_fnc_llenaBotella; "];	
	
	titleText ["Usa la rueda del ratón para llenar la botella", "PLAIN DOWN", 0.6];
};

if (_param isEqualTo "llena") exitWith {
	
	if (!isNil {llena}) exitWith {
		(uiNameSpace getVariable "llenandoBotella") displayRemoveEventHandler ["MouseZChanged", EHbotella];
		sleep 1.5;
		closeDialog 0;
		if (vehicle player == player) then {
			["pop_aguasucia"] call ica_fnc_item;
		};
		["+1 agua"] call ica_fnc_infolog;
	};	
	
	disableSerialization;
	_ui = uiNameSpace getVariable "llenandoBotella";
	_barrita = (_ui displayCtrl 4058);
	
	_n = progressPosition _barrita;
	_barrita progressSetPosition (_n + 0.020);
	if (_n >= 0.99) then {llena = true};
};
