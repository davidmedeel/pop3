//Alarme Nucleaire
player say3D "Nukealarm";

dust = "#particlesource" createVehicleLocal getpos player;
dust setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 7, 48], "", "Billboard", 1, 5, [0,0,-25],
				[25, -25, 0], 0.1, 0, 5, 0.5, [5, 5], [[0.1, 0.1, 0.1, 0], 
				[0.1, 0.1, 0.1, 0.25], [0.15, 0.15, 0.15, 0], [1, 1, 1, 0]], [1,0.5], 0.1, 1, "", "", player,0,false];
dust setParticleRandom [15, [25, 25, 0], [5, 5, 0], 0.1, 0, [0, 0, 0, 0], 8, 0.1];
dust setParticleCircle [15, [0, 0, 0]];
dust setDropInterval 0.01;
sleep 2;