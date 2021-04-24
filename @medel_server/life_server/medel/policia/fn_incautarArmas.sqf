
/*
por: Medel
*/

_param = _this select 0;

if (_param isEqualTo "menu") exitWith {
  if !(playerSide isEqualTo west) exitWith {hint "No eres Policía";};
  disableSerialization;

  createDialog "incautarArmas";
};

if (_param isEqualTo "fusil") exitWith {
  _rifle = primaryWeapon player;

  if(_rifle isEqualTo "") exitWith {
    titleText["No tienes fusiles equipados para vender.", "PLAIN"];
    closeDialog 0;
  };

  if(_rifle isEqualTo "pop_linterna" or _rifle == "a_rifle_MX_F" or _rifle == "cl_fishing_rod" or _rifle == "cl_picket_rtp" or _rifle == "cl_picket_mlnw" or _rifle == "cl_picket_ftp") exitWith {hint "No seas troll";};

  if(_rifle != "") then {

  player removeWeapon _rifle;

  medel_din = medel_din + 4000;

  closeDialog 0;

  ["<t size='0.8' shadow='1' color='#FF6600'>Has incautado un fusil por 4000€</t>", 0, 1, 5, 1, 0, 1] spawn BIS_fnc_dynamicText;

  ["+ 4000 €"] spawn ica_fnc_infolog;
  };
};

if (_param isEqualTo "pistola") exitWith {
  _pistola = handgunWeapon player;

  if(_pistola isEqualTo "") exitWith {
    titleText["No tienes pistolas equipadas para vender.", "PLAIN"];
    closeDialog 0;
  };

  if(_pistola isEqualTo "Taser_26" or _pistola=="hgun_P07_F") exitWith {hint "No seas troll";};

  if(_pistola != "") then {

  player removeWeapon _pistola;

  medel_din = medel_din + 2000;

  ["<t size='0.8' shadow='1' color='#FF6600'>Has incautado una pistola por 2000€</t>", 0, 1, 5, 1, 0, 1] spawn BIS_fnc_dynamicText;

  closeDialog 0;

	["+ 2000 €"] spawn ica_fnc_infolog;
  };
};
