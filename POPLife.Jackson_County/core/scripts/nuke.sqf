
ppColorNukeExplode = ppEffectCreate ["colorCorrections", 2000];
ppColorNukeExplode ppEffectAdjust [5, 1.5, -0.08, [0.5, -0.2,0.3, 0.1], [0.9, 0.1, -3, 1.5], [0.1, 0.5, -1, 1]];
ppColorNukeExplode ppEffectCommit 1;
ppColorNukeExplode ppEffectEnable true;

ppColorNukeLight = ppEffectCreate ["LightShafts", 2001];
ppColorNukeLight ppEffectAdjust [3,1,10,0.95];
ppColorNukeLight ppEffectCommit 1;
ppColorNukeLight ppEffectEnable true;

enableEnvironment false;
titleText ["", "WHITE IN", 5];
sleep 1.7;
0 setOvercast 0.25;
0 setFog [1,1,-1];
0 setWaves 1;

forceWeatherChange;
//skipTime 8.2;
ppColorNukeExplode ppEffectAdjust [1, 0.8, -0.08, [0.5, -0.2,0.3, 0.1], [0.9, 0.1, -3, 1.5], [0.1, 0.5, -1, 1]];
ppColorNukeExplode ppEffectCommit 3;
ppColorNukeExplode ppEffectEnable true;


nukeColumn = "#particlesource" createVehicleLocal getPos player;
nukeColumn setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0.1, [0, 0, 0, 0.5], 0, 0];
nukeColumn setParticleCircle [5, [5, 0, 10]];
nukeColumn setDropInterval 0.01;


nukeCap = "#particlesource" createVehicleLocal getPos player;
nukeCap setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0.1, [0, 0, 0, 0.5], 0, 0];
nukeCap setParticleCircle [50, [10, 10, 15]];
nukeCap setDropInterval 0.01;

NukeBase = "#particlesource" createVehicleLocal getPos player;
NukeBase setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 7, 48], "", "Billboard", 1, 5, [0,0,-15],
				[0, 0, 0], 1, 25, 3, 0.5, [20, 20], [[0.1, 0.1, 0.1, 0], 
				[0.1, 0.1, 0.3, 0.25], [0.15, 0.15, 0.15, 0.25], [1, 1, 1, 0]], [1.5,1], 0.3, 1, "", "", player,0,false];
NukeBase setParticleRandom [0, [15, 15, 25], [25, 25, 0], 0.25, 1, [0, 0, 0, 0.5], 1, 0.1];
NukeBase setDropInterval 0.001;

NukeBlast = "#particlesource" createVehicleLocal getPos player;
NukeBlast setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract", 16, 7, 48], "", "Billboard", 1, 0.5, [0,0,0],
				[300, 300, 0], 0, 25, 5, 0, [100, 100], [[1,1,1,0], 
				[1,1,1, 1], [1, 1, 1, 1], [1, 1, 1, 0]], [1.5,0.5], 1, 1, "", "", player,0,true];
NukeBlast setParticleRandom [5, [0, 0, 0], [0, 0, 0], 0, 1, [0, 0, 0, 0], 0, 0,90];
NukeBlast setDropInterval 0.001;
NukeBlast setParticleCircle [50, [500, 500, 0]];

NukeBlast2 = "#particlesource" createVehicleLocal getPos player;
NukeBlast2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 7, 48], "", "Billboard", 1, 0.5, [0,0,0],
				[300, 300, 0], 0, 25, 5, 0, [100, 100], [[1,1,1,0], 
				[1,1,1,0.5], [1, 1, 1, 0.1], [1, 1, 1, 0]], [1.5,0.5], 1, 1, "", "", player,0,true];
NukeBlast2 setParticleRandom [5, [0, 0, 0], [0, 0, 0], 0, 1, [0, 0, 0, 0], 0, 0,90];
NukeBlast2 setDropInterval 0.001;
NukeBlast2 setParticleCircle [30, [500, 500, 0]];

0 fadeSound 1;
playSound "Nuke_Explosion";
sleep 4;
deleteVehicle NukeBlast;
deleteVehicle NukeBlast2;
2 setFog [0.5,0.05,5];
player setDamage 1;
0 setOvercast 0;
0 setWaves 0;
2 setFog [0,0,0];