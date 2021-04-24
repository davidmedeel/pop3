
/*
Creado por Medel
Para Plata o Plomo
*/

_tipo = param[0];

_obj = param[1];

_target = param[2];

_dineroRecompensa = 20000;
_expRecompensa = 20;

if (_tipo isEqualTo "camion") exitWith {
  if ((player distance pos_incendio) > 50) exitwith { hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>AVISO<br/><t color='#21618C'><t size='1.2'><t align='center'>Aún estás muy lejos del incendio</t>";};
  
  //if !(cursorObject isKindOf "Land_DustMask_F") exitWith { hint "hola"; };

  if (cameraOn == _obj && cameraView == "External") then {
    _obj switchCamera "Internal";
  };

  _indirect = true;
  _repeats = 10;
  _projectileSpeed = 30;
  _projectileRange = 70;
  _lifetime = 4;

  _targetpos = _obj selectionPosition "agua";
  _opos = _obj modelToWorld _targetpos;
  _tPos = ASLtoATL getPosASL _target;

  _heading = [ATLtoASL  positionCameraToWorld[0,0,-4], ATLtoASL positionCameraToWorld[0,0,10]] call BIS_fnc_vectorFromXToY;
  _velocity = [_heading, _projectileSpeed] call BIS_fnc_vectorMultiply;
  _velocidad = velocity _obj;
  _velocity = _velocity vectorAdd _velocidad;

  _src = createVehicle ["Land_DustMask_F", _oPos, [], 0, "CAN_COLLIDE"];

  [_src, 8.5] spawn {

    _target = param[0];
    _duracion = 6; 

    if (isNull _target || _duracion < 0) exitWith {};

    _pos = (ASLtoATL visiblePositionASL _target);
    _isVisible = [_pos, _duracion] call ica_fnc_efectoEsVisible;

    if (!_isVisible) exitWith {};

    [_target, 1, 0.1] spawn ica_fnc_magneto;

    _fuente2 = "#particlesource" createVehicle _pos;
    _fuente2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 14, 48, 1], "cl_water", "Billboard", 1, 5, [0, 0, 0],
    [0, 0, 0.5], 0, 8.277, 0.2, 0.025, [0.5, 0.5, 0.5, 0.5], [[0, 255, 255, 0.7],[0, 255, 255, 0.5], [0, 255, 255, 0.25], [0, 255, 255, 0]],
    [0.2], 1, 0.04, "", "", _target];
    _fuente2 setParticleRandom [2, [3.3, 3.3, 3.3], [1.5, 1.5, 1], 20, 0.2, [0, 0, 0, 0.1], 0, 0, 360];
    _fuente2 setDropInterval 0.015;
    _fuente2 attachTo [_target];

    _fuente4 = "#particlesource" createVehicle _pos;
    _fuente4 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 14, 20, 1], "cl_water", "Billboard", 1, 3, [0, 0, 0],
    [0, 0, 0.5], 0, 1.277, 0.2, 0.025, [0.8, 0.8, 0.8, 0.8], [[0, 195, 255, 0.7],[0, 255, 195, 0.5], [0, 255, 255, 0.25], [0, 255, 195, 0]],
    [0.2], 1, 0.04, "", "", _target];
    _fuente4 setParticleRandom [2, [4.3, 4.3, 4.3], [1.5, 1.5, 1], 20, 0.2, [0, 0, 0, 0.1], 0, 0, 360];
    _fuente4 setDropInterval 0.015;
    _fuente4 attachTo [_target];

    _fuente5 = "#particlesource" createVehicle _pos;
    _fuente5 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 15, 20, 1], "cl_water", "Billboard", 1, 3, [0, 0, 0],
    [0, 0, 0.5], 0, 1.277, 0.2, 0.025, [1.2, 0.9, 0.7, 0.1], [[0, 245, 245, 0.7],[0, 245, 245, 0.5], [0, 245, 245, 0.25], [0, 245, 245, 0]],
    [0.2], 1, 0.04, "", "", _target];
    _fuente5 setParticleRandom [2, [0.3, 0.3, 0.3], [1.5, 1.5, 1], 20, 0.2, [0, 0, 0, 0.1], 0, 0, 360];
    _fuente5 setDropInterval 0.015;
    _fuente5 attachTo [_target];

    _escala = 0.1;

    _fuente3  = "#particlesource" createvehicle _pos;
    _fuente3 setParticleCircle [0, [0, 0, 0]];
    _fuente3 setParticleRandom [0.2, [15 * _escala, 15 * _escala, 0], [0, 0, 0], 1, 0.5, [0, 0, 0, 0], 0, 0];
    _fuente3 setDropInterval 0.04;
    _fuente3 attachTo [_target];

    _fuente6 = "#particlesource" createVehicle _pos;
    _fuente6 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 14, 48, 1], "cl_water", "Billboard", 1, 5, [0, 0, 0],
    [0, 0, 0.5], 0, 8.277, 0.2, 0.025, [1.8, 1.8, 1.8, 1.8], [[224,255,255, 0.7],[255,250,250, 0.5], [255,250,250, 0.25], [224,255,255, 0]],
    [0.2], 1, 0.04, "", "", _target];
    _fuente6 setDropInterval 0.015;
    _fuente6 attachTo [_target];

    _fuente7 = "#particlesource" createVehicle _pos;
    _fuente7 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 9, 48, 1], "cl_water", "Billboard", 1, 3, [0, 0, 0],
    [0, 0, 0.5], 0, 1.277, 0.2, 0.025, [0.8, 0.8, 0.8, 0.8], [[255,255,255, 0.7],[255,255,255, 0.5], [255,255,255, 0.25], [224,255,255, 0]],
    [0.2], 1, 0.04, "", "", _target];
    _fuente7 setDropInterval 1.015;
    _fuente7 attachTo [_target];

    _fuente8 = "#particlesource" createVehicle _pos;
    _fuente8 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 15, 20, 1], "cl_water", "Billboard", 1, 3, [0, 0, 0],
    [0, 0, 0.5], 0, 1.277, 0.2, 0.025, [0.4, 0.7, 0.5, 0.6], [[224,255,255, 0.7],[224,255,255, 0.5], [224,255,255, 0.25], [224,255,255, 0]],
    [0.2], 1, 0.04, "", "", _target];
    _fuente8 setParticleRandom [2, [0.8, 0, 0.9], [1.5, 1.5, 1], 20, 0.2, [0, 0, 0, 0.1], 0, 0, 360];
    _fuente8 setDropInterval 0.015;
    _fuente8 attachTo [_target];

    _fuente9 = "#particlesource" createVehicle _pos;
    _fuente9 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 14, 48, 1], "cl_water", "Billboard", 1, 5, [0, 0, 0],
    [0, 0, 0.5], 0, 8.277, 0.2, 0.025, [0.4, 0.4, 0.4, 0.4], [[224,255,255, 0.7],[255,250,250, 0.5], [255,250,250, 0.25], [224,255,255, 0]],
    [0.2], 1, 0.04, "", "", _target];
    _fuente9 setDropInterval 0.015;
    _fuente9 attachTo [_target];

    _fuente10 = "#particlesource" createVehicle _pos;
    _fuente10 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 9, 48, 1], "cl_water", "Billboard", 1, 3, [0, 0, 0],
    [0, 0, 0.5], 0, 1.277, 0.2, 0.025, [0.8, 0.8, 0.8, 0.8], [[255,255,255, 0.7],[255,255,255, 0.5], [255,255,255, 0.25], [224,255,255, 0]],
    [0.2], 1, 0.04, "", "", _target];
    _fuente10 setDropInterval 0.015;
    _fuente10 attachTo [_target];

    _fuente11 = "#particlesource" createVehicle _pos;
    _fuente11 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 15, 20, 1], "cl_water", "Billboard", 1, 3, [0, 0, 0],
    [0, 0, 0.5], 0, 1.277, 0.2, 0.025, [0.4, 0.7, 0.5, 0.6], [[224,255,255, 0.7],[224,255,255, 0.5], [224,255,255, 0.25], [224,255,255, 0]],
    [0.2], 1, 0.04, "", "", _target];
    _fuente11 setParticleRandom [2, [0.8, 0, 0.9], [1.5, 1.5, 1], 20, 0.2, [0, 0, 0, 0.1], 0, 0, 360];
    _fuente11 setDropInterval 0.015;
    _fuente11 attachTo [_target];

    _escala = 0.1;

    _fuente12  = "#particlesource" createvehicle _pos;
    _fuente12 setParticleCircle [0, [0, 0, 0]];
    _fuente12 setParticleRandom [0.2, [15 * _escala, 15 * _escala, 0], [0, 0, 0], 1, 0.5, [0, 0, 0, 0], 0, 0];
    _fuente12 setDropInterval 0.04;
    _fuente12 attachTo [_target];

    sleep _duracion;

    deleteVehicle _fuente2;
    deleteVehicle _fuente3;
    deleteVehicle _fuente4;
    deleteVehicle _fuente5;
    deleteVehicle _fuente6;
    deleteVehicle _fuente7;
    deleteVehicle _fuente8;
    deleteVehicle _fuente9;
    deleteVehicle _fuente10;
    deleteVehicle _fuente11;
    deleteVehicle _fuente12;
  };

  _src setVectorDir _heading;
  _src setVelocity _velocity;

  sleep 3;

  deleteVehicle _src;
  deleteVehicle incendiop1;
  deleteVehicle incendiop2;
  deleteVehicle incendiop3;
  deleteVehicle incendiop4;
  deleteVehicle incendio5;
  deleteMarker marcadorIncendio;
  pos_incendio = [0.174907,0.183105,0];
  missionNamespace setVariable["incendiosEnCurso", 0, true];

  medel_din = medel_din + _dineroRecompensa;
  ["exp", _expRecompensa] spawn ica_fnc_arrayEXP;
  hint parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>BOMBEROS<br/><t color='#21618C'><t size='1.2'><t align='center'>Has apagado un incendio, se te ha recompensado con %1€ y %2 de EXP.</t>", _dineroRecompensa, _expRecompensa];
  true;
};

if (_tipo isEqualTo "extintor") exitWith {
  if ((player distance pos_incendio) > 50) exitwith { hint parsetext "<t color='#DE2828'><t size='3.4'><t align='center'>AVISO<br/><t color='#21618C'><t size='1.2'><t align='center'>Aún estás muy lejos del incendio</t>";};
  
  //if !(cursorObject isKindOf "Land_DustMask_F") exitWith { hint "hola"; };

  if (cameraOn == _obj && cameraView == "External") then {
    _obj switchCamera "Internal";
  };

  _indirect = true;
  _repeats = 10;
  _projectileSpeed = 30;
  _projectileRange = 70;
  _lifetime = 4;

  _targetpos = _obj selectionPosition "agua";
  _opos = _obj modelToWorld _targetpos;
  _tPos = ASLtoATL getPosASL _target;

  _heading = [ATLtoASL  positionCameraToWorld[0,0,-4], ATLtoASL positionCameraToWorld[0,0,10]] call BIS_fnc_vectorFromXToY;
  _velocity = [_heading, _projectileSpeed] call BIS_fnc_vectorMultiply;
  _velocidad = velocity _obj;
  _velocity = _velocity vectorAdd _velocidad;

  _src = createVehicle ["Land_DustMask_F", _oPos, [], 0, "CAN_COLLIDE"];

  [_src, 8.5] spawn {

    _target = param[0];
    _duracion = 6; 

    if (isNull _target || _duracion < 0) exitWith {};

    _pos = (ASLtoATL visiblePositionASL _target);
    _isVisible = [_pos, _duracion] call ica_fnc_efectoEsVisible;

    if (!_isVisible) exitWith {};

    [_target, 1, 0.1] spawn ica_fnc_magneto;

    _fuente2 = "#particlesource" createVehicle _pos;
    _fuente2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 14, 48, 1], "cl_water", "Billboard", 1, 5, [0, 0, 0],
    [0, 0, 0.5], 0, 8.277, 0.2, 0.025, [0.5, 0.5, 0.5, 0.5], [[0, 255, 255, 0.7],[0, 255, 255, 0.5], [0, 255, 255, 0.25], [0, 255, 255, 0]],
    [0.2], 1, 0.04, "", "", _target];
    _fuente2 setParticleRandom [2, [3.3, 3.3, 3.3], [1.5, 1.5, 1], 20, 0.2, [0, 0, 0, 0.1], 0, 0, 360];
    _fuente2 setDropInterval 0.015;
    _fuente2 attachTo [_target];

    _fuente4 = "#particlesource" createVehicle _pos;
    _fuente4 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 14, 20, 1], "cl_water", "Billboard", 1, 3, [0, 0, 0],
    [0, 0, 0.5], 0, 1.277, 0.2, 0.025, [0.8, 0.8, 0.8, 0.8], [[0, 195, 255, 0.7],[0, 255, 195, 0.5], [0, 255, 255, 0.25], [0, 255, 195, 0]],
    [0.2], 1, 0.04, "", "", _target];
    _fuente4 setParticleRandom [2, [4.3, 4.3, 4.3], [1.5, 1.5, 1], 20, 0.2, [0, 0, 0, 0.1], 0, 0, 360];
    _fuente4 setDropInterval 0.015;
    _fuente4 attachTo [_target];

    _fuente5 = "#particlesource" createVehicle _pos;
    _fuente5 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 15, 20, 1], "cl_water", "Billboard", 1, 3, [0, 0, 0],
    [0, 0, 0.5], 0, 1.277, 0.2, 0.025, [1.2, 0.9, 0.7, 0.1], [[0, 245, 245, 0.7],[0, 245, 245, 0.5], [0, 245, 245, 0.25], [0, 245, 245, 0]],
    [0.2], 1, 0.04, "", "", _target];
    _fuente5 setParticleRandom [2, [0.3, 0.3, 0.3], [1.5, 1.5, 1], 20, 0.2, [0, 0, 0, 0.1], 0, 0, 360];
    _fuente5 setDropInterval 0.015;
    _fuente5 attachTo [_target];

    _escala = 0.1;

    _fuente3  = "#particlesource" createvehicle _pos;
    _fuente3 setParticleCircle [0, [0, 0, 0]];
    _fuente3 setParticleRandom [0.2, [15 * _escala, 15 * _escala, 0], [0, 0, 0], 1, 0.5, [0, 0, 0, 0], 0, 0];
    _fuente3 setDropInterval 0.04;
    _fuente3 attachTo [_target];

    _fuente6 = "#particlesource" createVehicle _pos;
    _fuente6 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 14, 48, 1], "cl_water", "Billboard", 1, 5, [0, 0, 0],
    [0, 0, 0.5], 0, 8.277, 0.2, 0.025, [1.8, 1.8, 1.8, 1.8], [[224,255,255, 0.7],[255,250,250, 0.5], [255,250,250, 0.25], [224,255,255, 0]],
    [0.2], 1, 0.04, "", "", _target];
    _fuente6 setDropInterval 0.015;
    _fuente6 attachTo [_target];

    _fuente7 = "#particlesource" createVehicle _pos;
    _fuente7 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 9, 48, 1], "cl_water", "Billboard", 1, 3, [0, 0, 0],
    [0, 0, 0.5], 0, 1.277, 0.2, 0.025, [0.8, 0.8, 0.8, 0.8], [[255,255,255, 0.7],[255,255,255, 0.5], [255,255,255, 0.25], [224,255,255, 0]],
    [0.2], 1, 0.04, "", "", _target];
    _fuente7 setDropInterval 1.015;
    _fuente7 attachTo [_target];

    _fuente8 = "#particlesource" createVehicle _pos;
    _fuente8 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 15, 20, 1], "cl_water", "Billboard", 1, 3, [0, 0, 0],
    [0, 0, 0.5], 0, 1.277, 0.2, 0.025, [0.4, 0.7, 0.5, 0.6], [[224,255,255, 0.7],[224,255,255, 0.5], [224,255,255, 0.25], [224,255,255, 0]],
    [0.2], 1, 0.04, "", "", _target];
    _fuente8 setParticleRandom [2, [0.8, 0, 0.9], [1.5, 1.5, 1], 20, 0.2, [0, 0, 0, 0.1], 0, 0, 360];
    _fuente8 setDropInterval 0.015;
    _fuente8 attachTo [_target];

    _fuente9 = "#particlesource" createVehicle _pos;
    _fuente9 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 14, 48, 1], "cl_water", "Billboard", 1, 5, [0, 0, 0],
    [0, 0, 0.5], 0, 8.277, 0.2, 0.025, [0.4, 0.4, 0.4, 0.4], [[224,255,255, 0.7],[255,250,250, 0.5], [255,250,250, 0.25], [224,255,255, 0]],
    [0.2], 1, 0.04, "", "", _target];
    _fuente9 setDropInterval 0.015;
    _fuente9 attachTo [_target];

    _fuente10 = "#particlesource" createVehicle _pos;
    _fuente10 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 9, 48, 1], "cl_water", "Billboard", 1, 3, [0, 0, 0],
    [0, 0, 0.5], 0, 1.277, 0.2, 0.025, [0.8, 0.8, 0.8, 0.8], [[255,255,255, 0.7],[255,255,255, 0.5], [255,255,255, 0.25], [224,255,255, 0]],
    [0.2], 1, 0.04, "", "", _target];
    _fuente10 setDropInterval 0.015;
    _fuente10 attachTo [_target];

    _fuente11 = "#particlesource" createVehicle _pos;
    _fuente11 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 15, 20, 1], "cl_water", "Billboard", 1, 3, [0, 0, 0],
    [0, 0, 0.5], 0, 1.277, 0.2, 0.025, [0.4, 0.7, 0.5, 0.6], [[224,255,255, 0.7],[224,255,255, 0.5], [224,255,255, 0.25], [224,255,255, 0]],
    [0.2], 1, 0.04, "", "", _target];
    _fuente11 setParticleRandom [2, [0.8, 0, 0.9], [1.5, 1.5, 1], 20, 0.2, [0, 0, 0, 0.1], 0, 0, 360];
    _fuente11 setDropInterval 0.015;
    _fuente11 attachTo [_target];

    _escala = 0.1;

    _fuente12  = "#particlesource" createvehicle _pos;
    _fuente12 setParticleCircle [0, [0, 0, 0]];
    _fuente12 setParticleRandom [0.2, [15 * _escala, 15 * _escala, 0], [0, 0, 0], 1, 0.5, [0, 0, 0, 0], 0, 0];
    _fuente12 setDropInterval 0.04;
    _fuente12 attachTo [_target];

    sleep _duracion;

    deleteVehicle _fuente2;
    deleteVehicle _fuente3;
    deleteVehicle _fuente4;
    deleteVehicle _fuente5;
    deleteVehicle _fuente6;
    deleteVehicle _fuente7;
    deleteVehicle _fuente8;
    deleteVehicle _fuente9;
    deleteVehicle _fuente10;
    deleteVehicle _fuente11;
    deleteVehicle _fuente12;
  };

  _src setVectorDir _heading;
  _src setVelocity _velocity;

  sleep 3;

  deleteVehicle _src;

  ["debugIncendio"] remoteexec ['ica_fnc_incendiosDebug', 0];

  medel_din = medel_din + _dineroRecompensa;
  ["exp", _expRecompensa] spawn ica_fnc_arrayEXP;
  hint parsetext format ["<t color='#DE2828'><t size='3.4'><t align='center'>BOMBEROS<br/><t color='#21618C'><t size='1.2'><t align='center'>Has apagado un incendio, se te ha recompensado con %1€ y %2 de EXP.</t>", _dineroRecompensa, _expRecompensa];
  true
};
