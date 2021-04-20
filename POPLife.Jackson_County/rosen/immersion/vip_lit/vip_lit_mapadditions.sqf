/*
	Author: voiper
	
	Description: Make main map dark at night, enable a flashlight for use on the map, enable NVG use on map.
	
	Parameters: 
		0: Bool (optional); whether player will respawn; default false.
		1: Array:
			0: Scalar: flashlight size to use (0 = normal, 1 = large); default 0.
			1: Bool: whether to enable NVG on map; default true.
			2: Bool: whether player starts with flashlight item; default true.
	
	Returns:
		None.
*/

#define HAS_LIGHT (({(isNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "Flashlight" >> "Intensity"))} count (items player) > 0) || (isNumber (configFile >> "CfgWeapons" >> (secondaryWeaponItems player) select 1 >> "ItemInfo" >> "Flashlight" >> "Intensity")))

_respawn = [_this, 0, false, [true]] call BIS_fnc_param;
_mapLight = [_this, 1, [0, true, true], [[]]] call BIS_fnc_param;

if (count _mapLight < 1) exitWith {};

waitUntil {!isNull (finddisplay 12)};

////vars////

_arr = toArray str missionConfigFile; _arr resize (count _arr - 15);
_missionRoot = toString _arr;
vip_lit_var_cl_mapMousePos = [0,0];

vip_lit_var_cl_naturalLight = 0;
vip_lit_var_cl_artificialLight = [0, [0,0,0]];

//map size/scale
_worldSize = 0;
if (isNumber (configFile >> "CfgWorlds" >> worldName >> "mapSize")) then {_worldSize = getNumber (configFile >> "CfgWorlds" >> worldName >> "mapSize")} else {

	_worldSize = switch (toLower worldName) do {
	
		case ("vr"): {8192};
		case ("smd_sahrani_a2"): {20480};
		case ("takistan"): {12800};
		case ("chernarus"): {15360};
		case ("utes"): {5120};
	};
};
vip_lit_var_cl_mapWorldSize = _worldSize / 1280; //map sizes are multiples of 1280

//water vars
vip_lit_var_cl_mapOpen = [false, false, 0];
vip_lit_var_cl_mapRainSounds = [
	["vip_lit_snd_rain1_l", "vip_lit_snd_rain1_r"],
	["vip_lit_snd_rain1_hi_l", "vip_lit_snd_rain1_hi_r"],
	["vip_lit_snd_rain1_lo_l", "vip_lit_snd_rain1_lo_r"],
	["vip_lit_snd_rain2_l", "vip_lit_snd_rain2_r"],
	["vip_lit_snd_rain2_hi_l", "vip_lit_snd_rain2_hi_r"],
	["vip_lit_snd_rain2_lo_l", "vip_lit_snd_rain2_lo_r"],
	["vip_lit_snd_rain3_l", "vip_lit_snd_rain3_r"],
	["vip_lit_snd_rain3_hi_l", "vip_lit_snd_rain3_hi_r"],
	["vip_lit_snd_rain3_lo_l", "vip_lit_snd_rain3_lo_r"],
	["vip_lit_snd_rain4_l", "vip_lit_snd_rain4_r"],
	["vip_lit_snd_rain4_hi_l", "vip_lit_snd_rain4_hi_r"],
	["vip_lit_snd_rain4_lo_l", "vip_lit_snd_rain4_lo_r"]
];

vip_lit_var_cl_mapRainTypes = [
	_missionRoot + "rosen\immersion\vip_lit\resource\drop1.paa",
	_missionRoot + "rosen\immersion\vip_lit\resource\drop2.paa",
	_missionRoot + "rosen\immersion\vip_lit\resource\drop3.paa",
	_missionRoot + "rosen\immersion\vip_lit\resource\drop4.paa",
	_missionRoot + "rosen\immersion\vip_lit\resource\drop5.paa",
	_missionRoot + "rosen\immersion\vip_lit\resource\drop6.paa",
	_missionRoot + "rosen\immersion\vip_lit\resource\drop7.paa"
];

vip_lit_var_cl_mapRainArray = [];

//flashlight vars
vip_lit_var_cl_flashlightOn = false;
vip_lit_var_cl_flashlightKeyDown = false;
vip_lit_var_cl_mapFlashlightTex = _missionRoot + "rosen\immersion\vip_lit\resource\flashlight.paa";

//set flashlight keybind (or grab from profile)
if (count (profileNamespace getVariable ["vip_lit_var_cl_mapFlashlightKey", []]) > 0) then {
	vip_lit_var_cl_mapFlashlightKey = profileNamespace getVariable "vip_lit_var_cl_mapFlashlightKey";

} else {vip_lit_var_cl_mapFlashlightKey = [33, false, false, false]};

//size of flashlight; portion of the screen horizontal; bigger number = smaller beam
vip_lit_var_cl_mapFlashlightScale = switch (_mapLight select 0) do {

	case 0: {2.15};
	case 1: {1.75};
};

vip_lit_var_cl_mapNVGOn = false;

////EHs////

//EH: get mouse position on map while moving
vip_lit_eh_cl_mouseMoveMap = (findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["MouseMoving", {
	vip_lit_var_cl_mapMousePos = (_this select 0) ctrlMapScreenToWorld [_this select 1, _this select 2];
}];

//EH: get mouse position on map while idle
vip_lit_eh_cl_mouseHoldMap = (findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["MouseHolding", {
	vip_lit_var_cl_mapMousePos = (_this select 0) ctrlMapScreenToWorld [_this select 1, _this select 2];
}];

//EH: map lighting, flashlight, raindrops
vip_lit_eh_cl_drawFlashlight = (findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw", {

	_map = _this select 0;

	if !(vip_lit_var_cl_mapOpen select 0) then {[] spawn vip_lit_fnc_cl_mapOpen};
	
	//size & zoom
	_mapZoom = ctrlMapScale _map; 
	_size = 640 * safeZoneW; 
	//size of beam is portion of screen horizontal; after 5x zoom, it's simulated to be fixed (it actually gets bigger relative to zoom)
	_sizeBeam = 320 / vip_lit_var_cl_mapFlashlightScale; if (_mapZoom < 0.2) then {_sizeBeam = _sizeBeam / (_mapZoom * (1 / 0.2))}; // new 320 old _size
	
	//resolution params (every frame in case player changes res mid-game)
	_resArray = getResolution;
	_resX = _resArray select 0;
	_resY = _resArray select 1;
	_uiScale = _resArray select 5;
	_viewPortX = _resArray select 2;
	_viewPortY = _resArray select 3;
	_realViewPortY = _resY * _uiScale; //A3 engine rounds viewport ratio, when they should be fractions; this can cause problems
	_realViewPortX = _realViewPortY * 4/3;
	
	//assign corrective ratio to fix sub-pixel gaps/overlaps (symptom of 2D viewport X/Y resolution rounding)
	_viewPortRatioFixY = 1;
	if (_realViewPortY != _viewPortY) then { 
		_viewPortRatioFixY = _realViewPortX / (_realViewPortY / _viewPortY * _viewPortX)
	} else { 
		if (_realViewPortX != _viewPortX) then {_viewPortRatioFixY = _realViewPortX / _viewPortX}
	};
	
	//offset the squares
	_offsetX = _mapZoom * vip_lit_var_cl_mapWorldSize * (_size * 2 + _sizeBeam);
	_offsetY = _mapZoom * vip_lit_var_cl_mapWorldSize * (_size + _sizeBeam) * _viewPortRatioFixY;
	_offsetYUp = _mapZoom * vip_lit_var_cl_mapWorldSize * (_size * 4 + _sizeBeam) * _viewPortRatioFixY; //up is bigger because of a potential exploit
	
	//colour the squares, set textures
	_c = vip_lit_var_cl_naturalLight;
	if ((vip_lit_var_cl_mapOpen select 2) < 0) then {_c = _c + (vip_lit_var_cl_mapOpen select 2) / 250; if (_c < 0) then {_c = 0}};
	_a = 1 - _c;
	_blankTex = "#(rgb,8,8,3)color(0,0,0,1)";
	_flashTex = if (vip_lit_var_cl_flashlightOn && HAS_LIGHT) then {vip_lit_var_cl_mapFlashlightTex} else {_blankTex};
	
	//fill colour
	_r = 0; _g = 0; _b = 0; _a2 = 0;
	if ((vip_lit_var_cl_artificialLight select 0) > vip_lit_var_cl_naturalLight) then {
	
		_colour = vip_lit_var_cl_artificialLight select 1;
		_r = _r + (_colour select 0);
		_g = _g + (_colour select 1);
		_b = _b + (_colour select 2);
		_a = 1 - (vip_lit_var_cl_artificialLight select 0);
		_a2 = 0.5;
		//_a2 = (_r + _g + _b);
	};
	
	//draw rain
	if (vip_lit_var_cl_mapOpen select 1) then {
		{
			_diff = diag_tickTime - (_x select 0);
			_map drawIcon [_x select 1, [1,1,1,(1 - (_diff / 1))], [_x select 2, _x select 3], (_x select 4) / _mapZoom, (_x select 4) / _mapZoom, _x select 5, "", 0];
		} forEach vip_lit_var_cl_mapRainArray;
	};
	
	//draw the squares
	if !(vip_lit_var_cl_mapNVGOn) then {
		_mousePos = vip_lit_var_cl_mapMousePos;
		_map drawIcon [format["#(rgb,8,8,3)color(%1,%2,%3,0.6)", _r, _g, _b], [1,1,1,_a2], _mousePos, _size * 2, _size * 2, 0, "", 0]; //ambient fill colour
		_map drawIcon [_flashTex, [1,1,1,_a], _mousePos, _sizeBeam, _sizeBeam, 0, "", 0]; //centre
		_map drawIcon [_blankTex, [_c,_c,_c,_a], [(_mousePos select 0) - _offsetX, (_mousePos select 1)], _size * 2, _sizeBeam, 0, "", 0]; //left
		_map drawIcon [_blankTex, [_c,_c,_c,_a], [(_mousePos select 0) + _offsetX, (_mousePos select 1)], _size * 2, _sizeBeam, 0, "", 0]; //right
		_map drawIcon [_blankTex, [_c,_c,_c,_a], [(_mousePos select 0), (_mousePos select 1) - _offsetY], _size * 4, _size, 0, "", 0]; //down
		_map drawIcon [_blankTex, [_c,_c,_c,_a], [(_mousePos select 0), (_mousePos select 1) + _offsetYUp], _size * 4, _size * 4, 0, "", 0]; //up
	};
}];

//EH: flashlight key; simulate as if real key up/down is the button on a flashlight
vip_lit_eh_cl_keyDnFlashlight = (findDisplay 12) displayAddEventHandler ["KeyDown", {

	_arr = _this;
	//_arr deleteAt 0; //for some reason in this case, display 12's keyDown isn't return its ID as the first array element???
	
	if (str _arr == str vip_lit_var_cl_mapFlashlightKey) then {
		if (HAS_LIGHT) then {
			
			if !(vip_lit_var_cl_flashlightKeyDown) then {playSound "vip_lit_snd_flashlightClick"; vip_lit_var_cl_flashlightKeyDown = true}; //won't click again until the variable is set back to false by keyup event
		};
	};
	false
}];

vip_lit_eh_cl_keyUpFlashlight = (findDisplay 12) displayAddEventHandler ["KeyUp", {

		_arr = _this;
		_arr deleteAt 0;
		
		if (str _arr == str vip_lit_var_cl_mapFlashlightKey) then {
		
			if (HAS_LIGHT) then {
				vip_lit_var_cl_flashlightKeyDown = false;
				vip_lit_var_cl_flashlightOn = if (vip_lit_var_cl_flashlightOn) then {false} else {true};
				0 = [] spawn {sleep 0.016; playsound "vip_lit_snd_flashlightClick"}; //sleep to create buffer between sounds; keyUp fires instantly if player presses and releases quickly
			};
		};
		false
	}];

//NVG on map	
if (_mapLight select 1) then {

	//set NVG keybind (or grab from profile)
	if (count (profileNamespace getVariable ["vip_lit_var_cl_mapNVGKey", []]) > 0) then {
		vip_lit_var_cl_mapNVGKey = profileNamespace getVariable "vip_lit_var_cl_mapNVGKey";

	} else {vip_lit_var_cl_mapNVGKey = [49, false, false, false]};
	
	//EH: draw NVG
	vip_lit_eh_cl_drawNVG = (findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw", {

		_hmd = hmd player;
		
		if (_hmd != "") then {
	
			if (vip_lit_var_cl_mapNVGOn) then {
			
				_map = _this select 0;
				_artificial = vip_lit_var_cl_artificialLight select 0;
				_a = if (vip_lit_var_cl_naturalLight > 0.4) then {vip_lit_var_cl_naturalLight} else {
					if ((_artificial > vip_lit_var_cl_naturalLight) && (_artificial > 0.4)) then {_artificial} else {
						if (vip_lit_var_cl_flashlightOn) then {1} else {0};
					};
				};
				
				_size = 640 * safeZoneW * 2.5;
				
				_mapPos = _map ctrlMapScreenToWorld [0.5,0.5];
				_map drawIcon ["#(rgb,8,8,3)color(1,1,1,1)", [1,1,1,_a], _mapPos, _size, _size, 0, "", 0]; //overbright
				_map drawIcon ["#(rgb,8,8,3)color(0,1,0,0.3)", [1,1,1,1], _mapPos, _size, _size, 0, "", 0]; //nvg
				
				if !(isNil "vip_lit_var_cl_NVGGrain") then {
					_res = getResolution;
					_mapZoom = ctrlMapScale _map;
					_posX = (_mapPos select 0) + (_mapZoom * random(500));
					_posY = (_mapPos select 1) + (_mapZoom * random(500));
					_map drawIcon [format["#(ai,2048,2048,1)perlinNoise(%1,%2,0,1)", _res select 0, _res select 1], [1,1,1,0.4], [_posX, _posY], _size, _size, 0, "", 0]; //noise
				};
			};
		} else {if (vip_lit_var_cl_mapNVGOn) then {vip_lit_var_cl_mapNVGOn = false}};
	}];
	
	//EH: NVG key
	vip_lit_eh_cl_keyDnNVG = (findDisplay 12) displayAddEventHandler ["KeyDown", {

		_arr = _this;
		_arr deleteAt 0;
		
		if (str _arr == str vip_lit_var_cl_mapNVGKey) then {
			
			if ((hmd player) != "") then {
				vip_lit_var_cl_mapNVGOn = if (vip_lit_var_cl_mapNVGOn) then {false} else {true};
			};
		};
		
		false
	}];
};

//if respawn isn't intended
if (!_respawn) then {

	//EH: remove everything on player death
	vip_lit_eh_cl_killedFlashlight = player addEventHandler ["Killed", {

		(findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ["MouseMoving", vip_lit_eh_cl_mouseMoveMap];
		(findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ["MouseHolding", vip_lit_eh_cl_mouseHoldMap];
		(findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ["Draw", vip_lit_eh_cl_drawDrain];
		
		if !(isNil "vip_lit_eh_cl_drawFlashlight") then {
			(findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ["Draw", vip_lit_eh_cl_drawFlashlight];
			(findDisplay 12) displayRemoveEventHandler ["KeyDown", vip_lit_eh_cl_keyDnFlashlight];
			(findDisplay 12) displayRemoveEventHandler ["KeyUp", vip_lit_eh_cl_keyUpFlashlight];
		};
		if !(isNil "vip_lit_eh_cl_drawNVG") then {
			(findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ["Draw", vip_lit_eh_cl_drawNVG];
			(findDisplay 12) displayRemoveEventHandler ["KeyDown", vip_lit_eh_cl_keyDnNVG];
		};
	
		[] spawn {player removeEventHandler ["Killed", vip_lit_eh_cl_killedFlashlight]};
	}];
};

//give player flashlight
if (_mapLight select 2) then {player addItem "acc_flashlight"};