/*
	Author: voiper
	
	Description: Handle NVG viewdistance.
	
	Parameters: 
		0: Bool; whether player will respawn; default false
		1: Array:
			0: Array:
				0: Bool; whether to enable NVG viewdistance; default true.
				1: Scalar; max viewdistance of NVG; default 1000.
			1: Bool; whether to enable NVG grain; default true.
			2: Bool; whether to turn off NVG when using non-collimator optics; default true.
	
	Returns:
		None
*/

_respawn = [_this, 0, false, [true]] call bis_fnc_param;
_nvg = [_this, 1, [[1000], true, true], [[]]] call bis_fnc_param;

if (count _nvg < 1) exitWith {};

_distance = _nvg select 0;
_grain = _nvg select 1;
_nonOptic = _nvg select 2;

_cse = isClass (configFile >> "CfgPatches" >> ("cse_sys_nightvision"));
_agm = isClass (configFile >> "CfgPatches" >> ("AGM_NightVision"));

vip_lit_var_cl_NVGOn = false;

if ((count _distance > 0) && !_cse) then {
	vip_lit_var_cl_NVGDist = _distance select 0;
	vip_lit_var_cl_NVGPlainDist = viewDistance;
};

if (_grain && !_agm && !_cse) then {
	vip_lit_var_cl_NVGGrain = ppEffectCreate ["filmGrain", 3000];
	vip_lit_var_cl_NVGGrain ppEffectAdjust [0.5, 5, 1, 1, 1, 0];
	vip_lit_var_cl_NVGGrain ppEffectForceInNVG true;
	vip_lit_var_cl_NVGGrain ppEffectCommit 0;
	vip_lit_var_cl_NVGGrain ppEffectEnable false;
};

if (_nonOptic) then {

	vip_lit_var_cl_NVGOffOptic = false;
};

vip_lit_eh_cl_draw3DNVG = addMissionEventHandler ["Draw3D", {

	if !(isNil "vip_lit_var_cl_NVGOffOptic") then {
		if (vip_lit_var_cl_NVGOffOptic) then {
			if (vehicle player == player) then {
				if !(cameraView == "GUNNER") then {
					player action ["NVGoggles"];
					vip_lit_var_cl_NVGOffOptic = false;
				};
			};
		};
	};

	if (currentVisionMode player == 1) then {
	
		if !(vip_lit_var_cl_NVGOn) then {
			vip_lit_var_cl_NVGOn = true;
			if !(isNil "vip_lit_var_cl_NVGDist") then {vip_lit_var_cl_NVGPlainDist = viewDistance};
			if !(isNil "vip_lit_var_cl_NVGGrain") then {vip_lit_var_cl_NVGGrain ppEffectEnable true};
		};

		if !(isNil "vip_lit_var_cl_NVGDist") then {if (viewDistance != vip_lit_var_cl_NVGDist) then {setViewDistance vip_lit_var_cl_NVGDist}};
		
		if !(isNil "vip_lit_var_cl_NVGOffOptic") then {
			if (vehicle player == player) then {
				_off = false;
				if (cameraView == "GUNNER") then {
					_optic = switch (currentWeapon player) do {
						case (primaryWeapon player): {primaryWeaponItems player select 2};
						case (secondaryWeapon player): {secondaryWeaponItems player select 2};
						case (handGunWeapon player): {handGunItems player select 2};
					};
					if (_optic == "") then {
						_off = true;
					} else {
						_aco = isClass (configFile >> "CfgWeapons" >> _optic >> "ItemInfo" >> "OpticsModes" >> "ACO");
						
						if (!_aco) then {
							_zoom = round ((([0.5,0.5] distance worldToScreen positionCameraToWorld [0,1.05,1]) * (getResolution select 5)) * 10) / 10;
							if (_zoom > 4) then {
								_nvgOpticClasses = "'NVG' in (getArray (_x >> 'visionMode'))" configClasses (configFile >> "CfgWeapons" >> _optic >> "ItemInfo" >> "OpticsModes");
								if (count _nvgOpticClasses < 1) then {_off = true};
							} else {_off = true};
						};
					};				
				};
				
				if (_off) then {player action ["NVGogglesOff"]; vip_lit_var_cl_NVGOffOptic = true};
			};
		};
	
	} else {
	
		if (vip_lit_var_cl_NVGOn) then {
			vip_lit_var_cl_NVGOn = false;
			if !(isNil "vip_lit_var_cl_NVGDist") then {setViewDistance vip_lit_var_cl_NVGPlainDist};
			if !(isNil "vip_lit_var_cl_NVGGrain") then {vip_lit_var_cl_NVGGrain ppEffectEnable false};
		};
	};
}];

//if player won't respawn, remove the eventhandlers
if !(_respawn) then {

	vip_lit_eh_cl_killedNVG = player addEventHandler ["Killed", {

		removeMissionEventHandler ["Draw3D", vip_lit_eh_cl_draw3DNVG];
		setViewDistance vip_lit_var_cl_NVGPlainDist;
		if !(isNil "vip_lit_var_cl_NVGGrain") then {vip_lit_var_cl_NVGGrain ppEffectEnable false; ppEffectDestroy vip_lit_var_cl_NVGGrain};
		[] spawn {player removeEventHandler ["Killed", vip_lit_eh_cl_killedNVG]};
	}];
};

/*

if (_blur) then {
	vip_lit_var_cl_NVGBlur = ppEffectCreate ["dynamicBlur", 410];
	vip_lit_var_cl_NVGBlur ppEffectAdjust [1.75];
	vip_lit_var_cl_NVGBlur ppEffectForceInNVG true;
	vip_lit_var_cl_NVGBlur ppEffectCommit 0;
	vip_lit_var_cl_NVGBlur ppEffectEnable false;
};

		if !(isNil "vip_lit_var_cl_NVGBlur") then {
			if (vehicle player == player) then {
				_blur = false;
				if (cameraView == "GUNNER") then {
					_optic = switch (currentWeapon player) do {
						case (primaryWeapon player): {primaryWeaponItems player select 2};
						case (secondaryWeapon player): {secondaryWeaponItems player select 2};
						case (handGunWeapon player): {handGunItems player select 2};
					};
					if (_optic == "") then {
						_blur = true;
					} else {
						_aco = isClass (configFile >> "CfgWeapons" >> _optic >> "ItemInfo" >> "OpticsModes" >> "ACO");
						
						if (!_aco) then {
							_zoom = round ((([0.5,0.5] distance worldToScreen positionCameraToWorld [0,1.05,1]) * (getResolution select 5)) * 10) / 10;
							if (_zoom > 4) then {
								_nvgOpticClasses = "'NVG' in (getArray (_x >> 'visionMode'))" configClasses (configFile >> "CfgWeapons" >> _optic >> "ItemInfo" >> "OpticsModes");
								if (count _nvgOpticClasses < 1) then {_blur = true};
							} else {_blur = true};
						};
					};				
				};
				
				if (_blur) then {vip_lit_var_cl_NVGBlur ppEffectEnable true} else {vip_lit_var_cl_NVGBlur ppEffectEnable false};
			};
		};
		
	if !(isNil "vip_lit_var_cl_NVGBlur") then {vip_lit_var_cl_NVGBlur ppEffectEnable false};
	if !(isNil "vip_lit_var_cl_NVGBlur") then {vip_lit_var_cl_NVGBlur ppEffectEnable false; ppEffectDestroy vip_lit_var_cl_NVGBlur};
*/