
/*
por: Medel
*/

_param = _this select 0;

if (_param isEqualTo "menu") exitwith {
  if !(playerSide isEqualTo independent) exitWith {hint "No eres EMS";};
  disableSerialization;

  createDialog "ventaOrganos";
};

  //Ojos
  if (_param isEqualTo "ojos") exitWith {

  if (["pop_ojos_item"] call ica_fnc_tengo == 0) exitWith {hint "No tienes ningún ojo para vender"; closeDialog 0;};

  ["pop_ojos_item", -1] call ica_fnc_item;

  ["<t size='0.8' shadow='1' color='#FF6600'>Has vendido un ojo por 5000€</t>", 0, 1, 5, 1, 0, 1] spawn BIS_fnc_dynamicText;

  medel_din = medel_din + 5000;

	["+ 5000 €"] spawn ica_fnc_infolog;
  };

  //Corazon
  if (_param isEqualTo "corazon") exitWith {

  if (["pop_corazon_item"] call ica_fnc_tengo == 0) exitWith {hint "No tienes ningún corazón para vender"; closeDialog 0;};

  ["pop_corazon_item", -1] call ica_fnc_item;

  ["<t size='0.8' shadow='1' color='#FF6600'>Has vendido un corazón por 10000€</t>", 0, 1, 5, 1, 0, 1] spawn BIS_fnc_dynamicText;

  medel_din = medel_din + 10000;

	["+ 10000 €"] spawn ica_fnc_infolog;
  };

  //Estomago
  if (_param isEqualTo "estomago") exitWith {

  if (["pop_estomago_item"] call ica_fnc_tengo == 0) exitWith {hint "No tienes ningún estomago para vender"; closeDialog 0;};

  ["pop_estomago_item", -1] call ica_fnc_item;

  ["<t size='0.8' shadow='1' color='#FF6600'>Has vendido un estomago por 8000€</t>", 0, 1, 5, 1, 0, 1] spawn BIS_fnc_dynamicText;

  medel_din = medel_din + 8000;

	["+ 8000 €"] spawn ica_fnc_infolog;
  };
