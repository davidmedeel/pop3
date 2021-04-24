/*
Script hecho por Icaruk, si quieres usarlo sólo tienes que pedirme permiso en adri-rk@hotmail.com.
Script done by Icaruk, if you want to use it, you just have to ask me permission on adri-rk@hotmail.com.
*/


_ruta = {
	ruta = (group camello) addWaypoint [(getMarkerPos (_this select 0)), 0];
	ruta setWaypointType "MOVE";
	ruta setWaypointBehaviour "CARELESS";
	ruta setWaypointSpeed "LIMITED";
};

_1 = "rutacamello1"; 
_2 = "rutacamello2"; 

while {true} do {

	while {true} do {
		if ((camello distance (getMarkerPos _2)) < 30) exitWith {};
		[_2] spawn _ruta;
		sleep 60;
	};
	while {true} do {
		if ((camello distance (getMarkerPos _1)) < 30) exitWith {};
		[_1] spawn _ruta;
		sleep 60;
	};	
};
