		disableSerialization;
		
		private ["_uniform","_uniformp","_uniformcont","_uniformmax","_uniformcargo","_vest","_vestp","_vestcont","_vestmax","_vestcargo","_backpack","_backpackp","_backpackmax","_backpackcargo","_cargo","_maxcargo","_veh","_vehcargo","_WeightText"];
		
		_uniform = uniform player;
		_uniformp = loaduniform player;
		_uniformcont = gettext (configFile >> "CfgWeapons" >> _uniform >> "iteminfo" >> "containerclass");
		_uniformmax = getnumber (configFile >> "CfgVehicles" >> _uniformcont >> "maximumload");
		_uniformcargo = _uniformp*_uniformmax;
		_vest = vest player;
		_vestp = loadvest player;
		_vestcont = gettext (configFile >> "CfgWeapons" >> _vest >> "iteminfo" >> "containerclass");
		_vestmax = getnumber (configFile >> "CfgVehicles" >> _vestcont >> "maximumload");
		_vestcargo = _vestp*_vestmax;
		_backpack = backpack player;
		_backpackp = loadbackpack player;
		_backpackmax = getnumber (configFile >> "CfgVehicles" >> _backpack >> "maximumload");
		_backpackcargo = _backpackp*_backpackmax;
		_cargo = _uniformcargo + _vestcargo + _backpackcargo;
		_maxcargo = _uniformmax + _vestmax + _backpackmax;
		
		_6381 = (findDisplay 602) displayCtrl 6381;
		_6191 = (findDisplay 602) displayCtrl 6191;
		_6382 = (findDisplay 602) displayCtrl 6382;
		_6192 = (findDisplay 602) displayCtrl 6192;
		_6305 = (findDisplay 602) displayCtrl 6305;
		_6306 = (findDisplay 602) displayCtrl 6306;
		_632 = (findDisplay 602) displayCtrl 632;
		_619 = (findDisplay 602) displayCtrl 619;
		_TEXT1 = (findDisplay 602) displayCtrl 111;
		if (vehicle player == player) then {
		_WeightText = formatText ["Inventario: %1/%2",_cargo, _maxcargo];
		}
		else {
		_veh = typeof vehicle player;
		_vehcargo = getNumber (configFile >> "Cfgvehicles" >> _veh >> "maximumload");
		_WeightText = formatText ["Inventario: %1/%2 | Maletero: %3",_cargo, _maxcargo, _vehcargo];
		/*_6381 ctrlSetFade 1;
		_6381 ctrlCommit 0;
		_6381 ctrlEnable false;

		_6191 ctrlSetFade 1;
		_6191 ctrlCommit 0;
		_6191 ctrlEnable false;
	
		_6382 ctrlSetFade 1;
		_6382 ctrlCommit 0;
		_6382 ctrlEnable false;
	
		_6192 ctrlSetFade 1;
		_6192 ctrlCommit 0;
		_6192 ctrlEnable false;
	
		_6305 ctrlSetFade 1;
		_6305 ctrlCommit 0;
		_6305 ctrlEnable false;

		_6306 ctrlSetFade 1;
		_6306 ctrlCommit 0;
		_6306 ctrlEnable false;*/

		/*_632 ctrlSetFade 0.7;
		_632 ctrlCommit 0;
		_632 ctrlEnable false;

		_619 ctrlSetFade 0.7;
		_619 ctrlCommit 0;
		_619 ctrlEnable false;
		Habilitar para que no se cojan cosas del coche
		*/
		};
		_TEXT1 ctrlsettext str _WeightText;
		if (_cargo < 200) then {_TEXT1 ctrlSetTextColor [1, 1, 1, 1];}; // WHITE
		if (_cargo > 200) then {_TEXT1 ctrlSetTextColor [0, 1, 0, 1];}; // GREEN 
		if (_cargo > 400) then {_TEXT1 ctrlSetTextColor [0, 0, 1, 1];}; // BLUE
		if (_cargo > 600) then {_TEXT1 ctrlSetTextColor [1, 0, 0, 1];}; // RED
		
		/*
		20kg 650m
		25kg 650m
		30kG 500m
		35kg 450m
		40kg 400m
		45kg 245m