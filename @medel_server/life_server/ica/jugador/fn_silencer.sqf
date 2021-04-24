
/*
por: Icaruk
	call ica_fnc_silencer
*/

_rsc = [
	"rscdiary",
	"rscstanceinfo",
	"rscunitinfo",
	"rscrespawncounter_script",
	"rscfiringdrillcheckpoint_script",
	"rsctestcontrolstyles_script",
	"rscvrmeta_script",
	"rscunitinfo_script",
	"rscstanceinfo_script",
	"rsctilesgroup_script",
	"rsctestcontroltypes_script",
	"rscspectator_script",
	"rscnoise_script",
	"rscmissionstatus_script",
	"rscestablishingshot_script",
	"rscdiary_playerpos",
	"gui_displays",
	"rscdiary_script",
	"igui_displays",
	"igui_classes",
	"rscadvancedhint_script",
	"rscavcamera_script",
	"rscfiringdrilltime_script",
	"rscdiary_playerpostime",
	"loading_classes",
	"rscslingloadassistant_script",
	"rscminimap_script",
	"loading_displays",
	"rscmsgbox_script",
	"rsccuratorvisionmodes_script",
	"rscfunctionsviewer_script",
	"rscmissiontext_script",
	"rsccuratorping_script",
	"rscprocedurevisualization_script",
	"rscnotification_script",
	"rsccommmenuitems_script",
	"rscstatic_script",
	"gui_classes",
	"rscdiary_playeralpha",
	"rscmsgbox3_script",
	"rscrecruitstatus_script",
	"rscdebugconsole_watchsave"
];

_todo = allVariables uiNamespace;
_sele = [];
{
	if (_x find "bis_" == -1) then {
		if (_x find "rscdisplay" == -1) then {
			if !(_x in _rsc) then {
				_sele pushback _x;
			};
		};
	};
} foreach _todo;
if ((count _sele) > 0) then {
	[format ["CHETO ----- %1 (%2) tiene %3 en uiNamespace", name player, getPlayerUID player, _sele], "diag_log", false, false, false] call BIS_fnc_MP;
};

_varMalas = [
	"W_O_O_K_I_E_ANTI_ANTI_HAX",
	"W_O_O_K_I_E_FUD_ANTI_ANTI_HAX",
	"E_X_T_A_S_Y_ANTI_ANTI_HAX",
	"E_X_T_A_S_Y_Pro_RE",
	"E_X_T_A_S_Y_Car_RE",
	"DO_NUKE",
	"JxMxE_spunkveh",
	"JxMxE_spunkveh2",
	"JxMxE_spunkair",
	"JxMxE_spunkair2",
	"JJJJ_MMMM___EEEEEEE_LLYYSSTTIICCC_SHIT_RE",
	"JJJJ_MMMM___EEEEEEE_LLYYSSTTIICCC_SHIT_RE_OLD", 
	"JJJJ_MMMM___EEEEEEE_SPAWN_VEH",
	"JJJJ_MMMM___EEEEEEE_SPAWN_WEAPON"
];
{
	missionNamespace setVariable [_x, compileFinal "false"]
} forEach _varMalas;

