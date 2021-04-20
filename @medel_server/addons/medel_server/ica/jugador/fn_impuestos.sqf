
/*
por: Icaruk
*/

while {true} do {
	sleep (60 * 10);
	_i = floor (medel_atmdin * 0.0005);
	medel_atmdin = medel_atmdin - _i;

	systemChat format ["Se te han deducido %1€ de impuestos, hacienda somos todos.", _i];
};
