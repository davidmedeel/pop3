

//playsound "Intro";

titleText ["", "PLAIN"];
sleep 3;
[
	parseText format
	["<t align='center' size='1.2'><t font='PuristaBold' size='1.6'>%1</t>", "Bienvenido a Plata o Plomo"],
	[0.35, 0.2, 0.3, 5],
	[10, 10],
	8,
	1.2,
	0
] spawn BIS_fnc_textTiles;
