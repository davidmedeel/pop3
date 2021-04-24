#include <macro.h>
/*
File: fn_weaponShopBuySell.sqf
Author: Bryan "Tonic" Boardwine
Description:
Master handling of the weapon shop for buying / selling an item.
*/
private["_price","_item","_itemInfo","_bad","_frais","_prixcb","_gangbank"];
if((lbCurSel 38403) == -1) exitWith {hint "Debe seleccionar un elemento de compra o venta"};
_price = lbValue[38403,(lbCurSel 38403)]; if(isNil "_price") then {_price = 0;};
_item = lbData[38403,(lbCurSel 38403)];
_itemInfo = [_item] call life_fnc_fetchCfgDetails;
_bad = "";
_frais = _price * 0.05; //5% de frais bancaire
_prixcb = _price + _frais;
_gangbank = (grpPlayer getVariable "gang_bank");
if(isNil "_gangbank") then {_gangbank = 0;};
if((["pop_tarjeta"] call ica_fnc_tengo == 0) && (medel_din < _price)) exitWith {hint "No tiene suficiente dinero en efectivo y no tiene tarjeta de credito !"};

if((_itemInfo select 6) != "CfgVehicles") then
{
    if((_itemInfo select 4) in [4096,131072]) then
    {
        if(!(player canAdd _item) && (uiNamespace getVariable["Weapon_Shop_Filter",0]) != 1) exitWith {_bad = "No tiene espacio suficiente para este articulo."};
    };
};
if(_bad != "") exitWith {hint _bad};
if((uiNamespace getVariable["Weapon_Shop_Filter",0]) == 1) then
{
    medel_din = medel_din + _price;
    [_item,false] call life_fnc_handleItem;
    hint parseText format["Ha vendido %1 Por <t color='#8cff9b'>%2$</t>",_itemInfo select 1,[_price] call life_fnc_numberText];
    [nil,(uiNamespace getVariable["Weapon_Shop_Filter",0])] call life_fnc_weaponShopFilter; //Update the menu.
}
else
{
if((["pop_tarjeta"] call ica_fnc_tengo == 0) && (medel_din < _price)) exitWith {hint "No tiene suficiente dinero en efectivo y no tiene una tarjeta de credito !"};
if((_gangbank >= _prixcb) && (["pop_tarjeta"] call ica_fnc_tengo > 0)) then {
        _action = [
            format["Dinero de la Mafia : <t color='#8cff9b'>%1$</t><br/>CUENTA BANCARIA : <t color='#8cff9b'>%5$</t><br/>Efectivo : <t color='#8cff9b'>%2$</t><br/><br/>Precio en Efectivo : <t color='#8cff9b'>%3$</t><br/>Precio por Trajeta : <t color='#8cff9b'>%4$</t>",
                [(grpPlayer getVariable "gang_bank")] call life_fnc_numberText,
                [medel_din] call life_fnc_numberText,
                [_price] call life_fnc_numberText,
                [_prixcb] call life_fnc_numberText,
                [medel_atmdin] call life_fnc_numberText
            ],
    "Comprar con la Cuenta de la Mafia?",
    "Si",
    "Mi dinero"
        ] call BIS_fnc_guiMessage;
        if(_action) then {
        _owner = (grpPlayer getVariable "gang_owner");
            hint parseText format["Compro un %1 Por <t color='#8cff9b'>%2$ + %3$</t> gastos con la cuenta de la mafia. La mafia ha sido advertido de esta compra",_itemInfo select 1,[_price] call life_fnc_numberText,[_frais] call life_fnc_numberText];
            [0,format["Un arma %1 fue comprado por %3 por %2$ Con el dinero de la mafia",_itemInfo select 1,[_prixcb] call life_fnc_numberText,name player]] remoteexeccall ["life_fnc_broadcast",_owner];
            _funds = grpPlayer getVariable "gang_bank";
            _funds = _funds - _prixcb;
            grpPlayer setVariable["gang_bank",_funds,true];
            [_item,true] spawn life_fnc_handleItem;
            [1,grpPlayer] remoteexeccall ["TON_fnc_updateGang",2];
    } else {
        _action = [format["CUENTA BANCARIA : <t color='#8cff9b'>%1$</t><br/>EFECTIVO : <t color='#8cff9b'>%2$</t><br/><br/>Precio en Efectivo : <t color='#8cff9b'>%3$</t><br/>Precio con Tarjeta : <t color='#8cff9b'>%4$</t>",
                    [medel_atmdin] call life_fnc_numberText,
                    [medel_din] call life_fnc_numberText,
                    [_price] call life_fnc_numberText,
                    [_prixcb] call life_fnc_numberText
                ],
                    "Eliga la forma de pago",
                    "Tarjeta",
                    "Efectivo"
                ] call BIS_fnc_guiMessage;
        if(_action) then {

                if(_prixcb > medel_atmdin) exitWith {hint "No tiene suficiente dinero en su cuenta !"};
                medel_atmdin = medel_atmdin - _prixcb;
                hint parseText format["Compro un %1 con<t color='#8cff9b'>%2$ + %3$</t> tarjeta de credito",_itemInfo select 1,[_price] call life_fnc_numberText,[_frais] call life_fnc_numberText];
                [_item,true] spawn life_fnc_handleItem;
        } else {
                if(_price > medel_din) exitWith {hint "No tiene suficiente dinero en efectivo !"};
                medel_din = medel_din - _price;
                hint parseText format["compro un %1 por <t color='#8cff9b'>%2$</t>",_itemInfo select 1,[_price] call life_fnc_numberText];
                [_item,true] spawn life_fnc_handleItem;
        };
    };
} else {
        if((["pop_tarjeta"] call ica_fnc_tengo == 0)) then {
                if(_price > medel_din) exitWith {hint "no tiene suficiente dinero en efectivo y no dispone de una tarjeta de credito !"};
                medel_din = medel_din - _price;
                hint parseText format["Compro un %1 por <t color='#8cff9b'>%2$</t>",_itemInfo select 1,[_price] call life_fnc_numberText];
                [_item,true] spawn life_fnc_handleItem;
        } else {
        _action = [format["CUENTA BANCARIA : <t color='#8cff9b'>%1$</t><br/>EFECTIVO : <t color='#8cff9b'>%2$</t><br/><br/>En efectivo : <t color='#8cff9b'>%3$</t><br/>Con Tarjeta : <t color='#8cff9b'>%4$</t>",
                    [medel_atmdin] call life_fnc_numberText,
                    [medel_din] call life_fnc_numberText,
                    [_price] call life_fnc_numberText,
                    [_prixcb] call life_fnc_numberText
                ],
                    "Eliga la forma de pago",
                    "Tarjeta",
                    "Efectivo"
                ] call BIS_fnc_guiMessage;
        if(_action) then {
                if(_prixcb > medel_atmdin) exitWith {hint "no tiene suficiente dinero en su cuenta !"};
                medel_atmdin = medel_atmdin - _prixcb;
                hint parseText format["compró un %1 por <t color='#8cff9b'>%2$ + %3$</t> tarifas bancarias",_itemInfo select 1,[_price] call life_fnc_numberText,[_frais] call life_fnc_numberText];
                [_item,true] spawn life_fnc_handleItem;
        } else {
                if(_price > medel_din) exitWith {hint "no tiene suficiente dinero en efectivo !"};
                medel_din = medel_din - _price;
                hint parseText format["Compro un %1 por <t color='#8cff9b'>%2$</t>",_itemInfo select 1,[_price] call life_fnc_numberText];
                [_item,true] spawn life_fnc_handleItem;
        };
    };
    };
};
[] call life_fnc_saveGear;