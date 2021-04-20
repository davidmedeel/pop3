/*
	Creado por Rosen
	
*/
private["_total","_slot1","_slot2","_slot3","_ganancias","_ganancias","_apuesta","_display","_premio","_exit"];
_apuesta = param[0];
if(medel_din < _apuesta) exitWith {hint format["No tienes suficiente dinero para jugar (%1€)",_apuesta];};
medel_din = medel_din - _apuesta;
disableSerialization;
_display = findDisplay 8750;
_img1 = _display displayCtrl 8752;
_img2 = _display displayCtrl 8753;
_img3 = _display displayCtrl 8754;
_textoGanancias = _display displayCtrl 8755;
_exit = _display displayCtrl 8756;
_apuesta = _display displayCtrl 8757;
_fondo = _display displayCtrl 8751;
_apuesta ctrlEnable false;

a = 0;

playSound "spin";
sleep 1;
_numero = ceil(random 7);
switch _numero do {
	
	case 0: {_slot1 = 0; _img1 ctrlSetText "\tragaperras\imagenes\slot_zero.jpg";};
	case 1: {_slot1 = 100; _img1 ctrlSetText "\tragaperras\imagenes\slot_one.jpg";};
	case 2: {_slot1 = 200; _img1 ctrlSetText "\tragaperras\imagenes\slot_two.jpg";};
	case 3: {_slot1 = 300; _img1 ctrlSetText "\tragaperras\imagenes\slot_three.jpg";};
	case 4: {_slot1 = 400; _img1 ctrlSetText "\tragaperras\imagenes\slot_four.jpg";};
	case 5: {_slot1 = 500; _img1 ctrlSetText "\tragaperras\imagenes\slot_five.jpg";};
	case 6: {_slot1 = 600; _img1 ctrlSetText "\tragaperras\imagenes\slot_six.jpg";};
	case 7: {_slot1 = 700; _img1 ctrlSetText "\tragaperras\imagenes\slot_seven.jpg";};
	default {_slot1 = 0;};
};

sleep 0.5;
_numero = ceil(random 7);

switch _numero do {
	
	case 0: {_slot2 = 0; _img2 ctrlSetText "\tragaperras\imagenes\slot_zero.jpg";};
	case 1: {_slot2 = 10; _img2 ctrlSetText "\tragaperras\imagenes\slot_one.jpg";};
	case 2: {_slot2 = 20; _img2 ctrlSetText "\tragaperras\imagenes\slot_two.jpg";};
	case 3: {_slot2 = 30; _img2 ctrlSetText "\tragaperras\imagenes\slot_three.jpg";};
	case 4: {_slot2 = 40; _img2 ctrlSetText "\tragaperras\imagenes\slot_four.jpg";};
	case 5: {_slot2 = 50; _img2 ctrlSetText "\tragaperras\imagenes\slot_five.jpg";};
	case 6: {_slot2 = 60; _img2 ctrlSetText "\tragaperras\imagenes\slot_six.jpg";};
	case 7: {_slot2 = 70; _img2 ctrlSetText "\tragaperras\imagenes\slot_seven.jpg";};
	default {_slot2 = 0;};
};

sleep 0.5;
_numero = ceil(random 7);

switch _numero do {
	
	case 0: {_slot3 = 0; _img3 ctrlSetText "\tragaperras\imagenes\slot_zero.jpg";};
	case 1: {_slot3 = 1; _img3 ctrlSetText "\tragaperras\imagenes\slot_one.jpg";};
	case 2: {_slot3 = 2; _img3 ctrlSetText "\tragaperras\imagenes\slot_two.jpg";};
	case 3: {_slot3 = 3; _img3 ctrlSetText "\tragaperras\imagenes\slot_three.jpg";};
	case 4: {_slot3 = 4; _img3 ctrlSetText "\tragaperras\imagenes\slot_four.jpg";};
	case 5: {_slot3 = 5; _img3 ctrlSetText "\tragaperras\imagenes\slot_five.jpg";};
	case 6: {_slot3 = 6; _img3 ctrlSetText "\tragaperras\imagenes\slot_six.jpg";};
	case 7: {_slot3 = 7; _img3 ctrlSetText "\tragaperras\imagenes\slot_seven.jpg";};
	default {_slot3 = 0;};
};

_total = _slot1 + _slot2 + _slot3;

switch _total do {
	case 111:{_premio = 100;}; 
	case 110:{_premio = 100;};
	case 123:{_premio = 100;};
	case 211:{_premio = 100;};
	case 123:{_premio = 200;};
	case 234:{_premio = 200;};
	case 345:{_premio = 200;};
	case 456:{_premio = 200;};
	case 567:{_premio = 500;};
	case 311:{_premio = 500;};
	case 411:{_premio = 500;};
	case 511:{_premio = 500;};
	case 611:{_premio = 800;};
	case 110:{_premio = 800;};
	case 112:{_premio = 800;};
	case 113:{_premio = 800;};
	case 114:{_premio = 800;};
	case 115:{_premio = 800;};
	case 116:{_premio = 800;};
	case 121:{_premio = 600;};
	case 131:{_premio = 600;};
	case 141:{_premio = 600;};
	case 151:{_premio = 600;};
	case 171:{_premio = 600;};
	case 121:{_premio = 600;};
	case 222:{_premio = 1000;};
	case 333:{_premio = 2000;};
	case 444:{_premio = 3000;};
	case 555:{_premio = 5000;};
	case 666:{_premio = 8000;};
	case 777:{_premio = 10000;};
	default {_premio = 0;}
};

if(_total == 777) then {
	_fondo ctrlShow false;
	_img1 ctrlShow false;
	_img2 ctrlShow false;
	_img3 ctrlShow false;
	_textoGanancias ctrlShow false;
	_exit ctrlShow false;
	_apuesta ctrlShow false;
	sleep 0.5;
	playSound "win";
	titleText ["!!!!PREMIO GORDO!!!!", "BLACK FADED", 1.5];
	sleep 2;
	_video = ["\tragaperras\video.ogv"] spawn BIS_fnc_playVideo;
	waitUntil {scriptDone _video};
	hint "Disfruta del premio!. Creado por Rosen";
	_fondo ctrlShow true;
	_img1 ctrlShow true;
	_img2 ctrlShow true;
	_img3 ctrlShow true;
	_textoGanancias ctrlShow true;
	_exit ctrlShow true;
	_apuesta ctrlShow true;
};


if(_premio > 0 ) then {
	playSound "win";
};
medel_din = medel_din + medel_dsin_premio;
_textoGanancias ctrlSetText format["Has ganado %1",_premio];
sleep 3;
_apuesta ctrlEnable true;

a = 1;

[] spawn ica_fnc_efecto;