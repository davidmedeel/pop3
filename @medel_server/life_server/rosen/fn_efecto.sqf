/*
	Creado por Rosen
*/
if (_this select 0) then {
	a=1;
	createDialog "Tragaperras";
	disableSerialization;
};

bucle1 = {
	disableSerialization;
	_display = findDisplay 8750;
	_img1 = _display displayCtrl 8752;
	_img2 = _display displayCtrl 8753;
	_img3 = _display displayCtrl 8754;
	_array = [
	"\tragaperras\imagenes\slot_zero.jpg",
	"\tragaperras\imagenes\slot_one.jpg",
	"\tragaperras\imagenes\slot_two.jpg",
	"\tragaperras\imagenes\slot_three.jpg",
	"\tragaperras\imagenes\slot_four.jpg",
	"\tragaperras\imagenes\slot_five.jpg",
	"\tragaperras\imagenes\slot_six.jpg",
	"\tragaperras\imagenes\slot_seven.jpg"];

	while {a>0} do {
		_img11 = _array call BIS_fnc_selectRandom;
		_img12 = _array call Bis_fnc_selectRandom;
		_img13 = _array call Bis_fnc_selectRandom;
		_img1 ctrlsettext _img11;
		_img2 ctrlsettext _img12;
		_img3 ctrlsettext _img13;
		sleep 0.05;
	};
	_img1 ctrlSetText "\tragaperras\imagenes\0.jpg";
	_img2 ctrlSetText "\tragaperras\imagenes\0.jpg";
	_img3 ctrlSetText "\tragaperras\imagenes\0.jpg";
};

[] spawn bucle1;