
/*
Sistema de incendios de POP 4 fixeado y modificado por Medel
*/

_param = param[0];

_incendiosEnCurso = missionNamespace getVariable "incendiosEnCurso";
_emsON = {side _x == independent} count playableUnits;

if(_param isEqualTo "Init") exitWith {
    hint "asd 1";
    while {true} do {
        sleep (60 * 5);
        ["crearIncendio"] spawn ica_fnc_generarIncendio;
    }
};

if (_param isEqualTo "crearIncendio") exitWith {

    //if (_emsON < 2) exitWith {};
    if (_incendiosEnCurso >= 1) exitWith {};

    _zonaIncendio = selectRandom ["Incendio_1","incendio_2","incendio_3","incendio_4"];
    _pos = getMarkerPos _zonaIncendio;
    pos_incendio = _pos;
    publicVariable "pos_incendio";
    _coord = mapGridPosition _pos;
    [10,"Cuerpo de Bomberos de Plata o Plomo",[1,0,0,1],2,(format["Atención a todos los ciudadanos, Se ha iniciado un incendio en coordenadas %1", _coord]),[1,1,1,1],1.5] remoteexec ["ica_fnc_anuncio",0];
    anunciado = nil; // debug

    markerFuego = format["marker_%1",floor(random 1000)];
    _marker = createMarker [markerFuego, _pos];
    _marker setMarkerColor "ColorRed";
    _marker setMarkerText "!ATENCIÓN! Un incendio por esta zona!";
    _marker setMarkerType "hd_dot";

    missionNamespace setVariable ["incendiosEnCurso", 1, true];

    _fireDiametro = 50;
    _quemar = false;
    _humo = false;

    _trg = createTrigger ["EmptyDetector", _pos];
    _trg setTriggerArea [50, 50, 0, false];
    _trg setTriggerActivation ["CIV", "PRESENT", true];
    _trg setTriggerStatements ["this", "hint 'Cuidado estás cerca de un incendio, no te acerques o puedes quedar inconsciente por el humo.'", ""];
        
    _trgd = createTrigger ["EmptyDetector", _pos];
    _trgd setTriggerArea [10, 10, 0, false];
    _trgd setTriggerActivation ["CIV", "PRESENT", true];
    _trgd setTriggerStatements ["this", "_dano = getDammage player; player setDamage (_dano + 0.1)", ""];

    {
        _quemar = true;
        _arbol = false;

        if (str _x find ": t_" > -1) then {
            _quemar = false;
            _humo = false;
            _arbol = false;
        };

        if (_x isKindOf "house") then {
            _quemar = false;
            if (str _x find "lampstreet_small_f" > -1) then {
                _quemar = false;
            };
        };

        if(_quemar) then {
            missionNamespace setVariable ["efectos",[]];

            /*if (_arbol) then {
                _pos = [(getPos _x) select 0,(getPos _x) select 1,0];
            } else {
                _pos = getPos _x;
            };*/

            _fuente01 = "#particlesource" createVehicle _pos;
            _fuente01 setParticleClass "ObjectDestructionFire1Smallx";
            _fuente01 setParticleFire [0.3,1.0,0.1];

            _fuente07 = "#particlesource" createVehicle _pos;
            _fuente07 setParticleClass "BigDestructionFire";

            _fuente02 = "#particlesource" createVehicle _pos;
            _fuente02 setParticleClass "ObjectDestructionSmokeSmallx";

            _fuente06 = "#particlesource" createVehicle _pos;
            _fuente06 setParticleClass "ObjectDestructionSmoke2x";

            _li = "#lightpoint" createVehicle _pos;
            _li setLightBrightness 0.08;
            _li setLightAmbient [1,0.28,0.05];
            _li setLightColor [1,0.28,0.05];
            _li lightAttachObject [_x, [0,0,0]];

            /*if(random 100 > 70) then {
                _c4 = "DemoCharge_Remote_Ammo_Scripted" createVehicle position  _x;
                _c4 setDamage 1;
            };*/

            missionNamespace setVariable ["efectos",[_fuente01,_fuente02,_fuente06,_fuente07,_li]];

            /*if(random 100 > 60) then {
                _x setDamage 1
            };*/

           // sleep 20;
        };

    } forEach nearestObjects [_pos, [], _fireDiametro];
};
