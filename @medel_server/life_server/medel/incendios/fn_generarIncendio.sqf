
/*
Creado por Medel
Para Plata o Plomo
*/

_param = param[0];

_incendiosEnCurso = missionNamespace getVariable "incendiosEnCurso";
_emsON = {side _x == independent} count playableUnits;

if (_param isEqualTo "Init") exitWith {
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
    [10,"Cuerpo de Bomberos de Plata o Plomo",[1,0,0,1],2,(format["Atención a todos los ciudadanos, Se ha iniciado un incendio en coordenadas %1", _coord]),[1,1,1,1],1.5] remoteexec ["ica_fnc_anuncio", 0];
    anunciado = nil; // debug

    markerFuegoR = format["marker_%1",floor(random 1000)];
    marcadorIncendio = createMarker [markerFuegoR, _pos];
    marcadorIncendio setMarkerColor "ColorRed";
    marcadorIncendio setMarkerText "!ATENCIÓN! Un incendio por esta zona!";
    marcadorIncendio setMarkerType "hd_dot";

    missionNamespace setVariable ["incendiosEnCurso", 1, true];

    _trg = createTrigger ["EmptyDetector", _pos];
    _trg setTriggerArea [50, 50, 0, false];
    _trg setTriggerActivation ["CIV", "PRESENT", true];
    _trg setTriggerStatements ["this", "hint 'Cuidado estás cerca de un incendio, no te acerques o puedes quedar inconsciente por el humo.'", ""];
        
    _trgd = createTrigger ["EmptyDetector", _pos];
    _trgd setTriggerArea [10, 10, 0, false];
    _trgd setTriggerActivation ["CIV", "PRESENT", true];
    _trgd setTriggerStatements ["this", "_dano = getDammage player; player setDamage (_dano + 0.1)", ""];

    incendiop1 = "#particlesource" createVehicle _pos;
    incendiop1 setParticleClass "ObjectDestructionFire1Smallx";
    incendiop1 setParticleFire [0.3,1.0,0.1];

    incendiop2 = "#particlesource" createVehicle _pos;
    incendiop2 setParticleClass "ObjectDestructionSmokeSmallx";

    incendiop3 = "#particlesource" createVehicle _pos;
    incendiop3 setParticleClass "BigDestructionFire";

    incendiop4 = "#particlesource" createVehicle _pos;
    incendiop4 setParticleClass "ObjectDestructionSmoke2x";

    incendio5 = "#lightpoint" createVehicle _pos;
    incendio5 setLightBrightness 0.08;
    incendio5 setLightAmbient [1,0.28,0.05];
    incendio5 setLightColor [1,0.28,0.05];
    incendio5 lightAttachObject [_x, [0,0,0]];
};
