
_param = param [0];

if (_param isEqualTo "Init") exitWith {

    if (("for" call ica_fnc_expToLevel) < 7) exitWith {
        titleText ["No sabes quitarte las esposas ...", "PLAIN"];
    };

    _esposado = player getVariable "restrained";

    if !(_esposado) exitWith {hint "No estás esposado";};

    if (vehicle player != player) exitWith {hint "No puedes estar en vehiculo para usar houdini"};
    if (!isNil {hudini}) exitWith {hint "Solo puedes intentar quitarte las esposas 1 vez cada 300s." };
    [] spawn {
        hudini = true;
        sleep 100;
        hudini = nil;
    };

    _base = 30;

    _t = round random _base * 5; // 30 segundos de base x 5 segundos aleatorios

    [_t, "Intentando forzar las esposas..."] spawn ica_fnc_barrita;

    sleep _t;

    if (vehicle player != player) exitWith {hint "Buen intento, pero no tienes espacio para quitarte las esposas"}; //No lo quites cabron que sino lloran. k lloren lo que quieran el script es mio, nada la poli always win

    player setVariable ["restrained",false,true];
    player setVariable ["Escorting",false,true];
    player setVariable ["transporting",false,true];
    detach player;

    titleText["PLAIN","Has conseguido abrir las esposas."];
};
