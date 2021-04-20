
/*
por: Icaruk
	
*/

player addEventHandler ["Put", {_this call ica_fnc_pongoItem}];

ica_fnc_dblClick = {
	_idc = ctrlIDC (_this select 0);
	_selectedIndex = _this select 1;
	_data = format ["%1",lbData [_idc, _selectedIndex]];
	_text = format ["%1",lbText [_idc, _selectedIndex]];
	_value = format ["%1",lbValue [_idc, _selectedIndex]];

	[_data, _text] call ica_fnc_usoItemFis;
	
	false
};
while {true} do {
	waituntil {!(isnull (findDisplay 602))}; // espero a que se abra
	((findDisplay 602) displayCtrl 633) ctrlSetEventHandler ["LBDblClick", "_this call ica_fnc_dblClick"]; // uniforme
	((findDisplay 602) displayCtrl 638) ctrlSetEventHandler ["LBDblClick", "_this call ica_fnc_dblClick"]; // chaleco
	((findDisplay 602) displayCtrl 619) ctrlSetEventHandler ["LBDblClick", "_this call ica_fnc_dblClick"]; // mochila
	// ((findDisplay 602) displayCtrl 640) ctrlSetEventHandler ["LBDblClick", "_this call ica_fnc_dblClick"]; // suelo
	waituntil {isnull (findDisplay 602)}; // espero a que se cierre
};



/*

player addBackpack "b_huntingbackpack"; ["pop_c4"] call ica_fnc_item; player additem "FirstAidKit";

handle = [] spawn {
    fnc_test = { 
        _idc = ctrlIDC (_this select 0);
        _selectedIndex = _this select 1;
        _data = format ["Data\n%1\n________\n",lbData [_idc, _selectedIndex]];
        _text = format ["Text\n%1\n________\n",lbText [_idc, _selectedIndex]];
        _value = format ["Value\n%1\n________\n",lbValue [_idc, _selectedIndex]];
        _pic = format ["Picture\n%1\n________\n",lbPicture [_idc, _selectedIndex]]; 
        hint format["Selected Uniform Index: %1\n%2%3%4%5",_selectedIndex,_data,_text,_value,_pic];
        false
    };
    while {true} do {
        waituntil {!(isnull (finddisplay 602))};
        hint "Inventory has been opened\nAdding event to uniform listbox";
        ((findDisplay 602) displayCtrl 633) ctrlSetEventHandler ["LBSelChanged", "_this call fnc_test"];
        waituntil {isnull (finddisplay 602)};
    };
};

progressPosition ((findDisplay 602) displayCtrl 6308) // barrita de peso

*/

