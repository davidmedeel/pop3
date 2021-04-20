private ["_source"];

_source = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

drop [
	["A3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 15, 5, 1],
	"",
    "Billboard",
    10,
    3,
    [
		0,0,0
	],
    [
		0,0,
		-6
	],
    300,
    0.02,
    0.0045,
	1,
    [
		0.3,
		5,
		7
	],
	[
		[       
			0.8,
			0.8,
			0.8,
			0.5
		],
		[     
			0.7,
			0.7,
			0.7,
			0.5
		],
		[     
			0.239,
			0.239,
			0.239,
			0.239
		]
	],
	[    
		0,
		1,
		0,
		1,
		0,
		1
	],
	0.2,
    0.2,
    "",
    "",
    _source,
	0,
	false,
	0.1
];