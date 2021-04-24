
private["_display","_ret","_text","_unit","_prim","_sec","_vest","_uni","_bp","_attach","_tmp"];

_ret = _this;
disableSerialization;
_display = findDisplay 2900;
_text = _display displayCtrl 2903;
_unit = _ret select 3;
_prim = if(primaryWeapon _unit != "") then { getText(configFile >> "CfgWeapons" >> (primaryWeapon _unit) >> "DisplayName")} else {"Ninguna"};
_sec = if(handgunWeapon _unit != "") then { getText(configFile >> "CfgWeapons" >> (handgunWeapon _unit) >> "DisplayName")} else {"Ninguna"};
_vest = if(vest _unit != "") then { getText(configFile >> "CfgWeapons" >> (vest _unit) >> "DisplayName")} else {"No"};
_uni = if(uniform _unit != "") then { getText(configFile >> "CfgWeapons" >> (uniform _unit) >> "DisplayName")} else {"No"};
_bp = if(backpack _unit != "") then { getText(configFile >> "CfgWeapons" >> (backpack _unit) >> "DisplayName")} else {"No"};

_attach = [];
if(primaryWeapon _unit != "") then
{
	{
		if(_x != "") then
		{
			_tmp = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
			_attach pushBack _tmp;
		};
	} foreach (primaryWeaponItems _unit);
};

_sangre = (1 - (damage _unit)) * 100, "%";

if(count _attach == 0) then {_attach = "Ninguno"};

_nombreFalsificado = _unit getvariable "nombreFake";

if(_nombreFalsificado isEqualTo "any" OR _nombreFalsificado isEqualTo "") then {_nombreFalsificado == "Ninguno" };

_text ctrlSetStructuredText parseText format["Nombre: %1<br/>Banco: %2<br/>Cartera: %3<br/>Uniforme: %4<br/>Ropa: %5<br/>Sangre: %6<br/>Primaria: %7<br/>Secundaria: %8<br/>Nombre falsificado: %9<br/><t align='center'>Objetos Principales</t><br/>%10",
_unit getVariable["realname",name _unit],[_ret select 0] call life_fnc_numberText,[_ret select 1] call life_fnc_numberText, _uni,_vest,_sangre,_prim,_sec,_nombreFalsificado,_attach];

/*_text ctrlSetStructuredText parseText format["Nombre: %1<br/>Banco: %2<br/>Cartera: %3<br/>Uniforme: %4<br/>Ropa: %5<br/>Sangre: %6<br/>Primaria: %7<br/>Secundaria: %8<br/><t align='center'>Objetos Principales</t><br/>%9",
	_unit getVariable["realname",name _unit],[_ret select 0] call life_fnc_numberText,[_ret select 1] call life_fnc_numberText, _uni,_vest,_sangre,_prim,_sec,_attach];*/