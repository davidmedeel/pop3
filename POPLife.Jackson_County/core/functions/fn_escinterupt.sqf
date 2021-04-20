
private["_abortButton","_respawnButton","_fieldManual","_escSync","_canUseControls"];

disableSerialization;

call ica_fnc_sync;
[] call SOCK_fnc_updateRequest;

_escSync = {
	private["_abortButton","_thread","_syncManager"];
	disableSerialization;

	_syncManager = {
		disableSerialization;
		private["_abortButton","_timeStamp"];
		_abortButton = (findDisplay 49) displayCtrl 104;
		_timeStamp = time + 10;

		waitUntil {
			_abortButton ctrlSetText format[localize "STR_NOTF_AbortESC",[(_timeStamp - time),"MM:SS"] call BIS_fnc_secondsToString];
			_abortButton ctrlCommit 0;
			round(_timeStamp - time) <= 0 || isNull (findDisplay 49)
		};

		_abortButton ctrlSetText "Salir";
		_abortButton ctrlCommit 0;
	};

	_abortButton = (findDisplay 49) displayCtrl 104;

	if(_this) then {
		_thread = [] spawn _syncManager;
		waitUntil{scriptDone _thread OR isNull (findDisplay 49)};
		_abortButton ctrlEnable true;
	};
};

_canUseControls = {
	if(playerSide == west) exitWith {true};
	if((player getVariable["restrained",false]) OR (player getVariable["Escorting",false]) OR (player getVariable["transporting",false]) OR (life_is_arrested) OR (life_istazed)) then {false} else {true};
};

while {true} do {
	waitUntil{!isNull (findDisplay 49)};
	_abortButton = (findDisplay 49) displayCtrl 104;
	_abortButton buttonSetAction "call ica_fnc_sync;";
	_respawnButton = (findDisplay 49) displayCtrl 1010;
	_fieldManual = (findDisplay 49) displayCtrl 122;

    private _saveButton = (findDisplay 49) displayCtrl 103;
	private _topButton = (findDisplay 49) displayCtrl 2;
	private _barra = (findDisplay 49) displayCtrl 120;
	private _nombre = (findDisplay 49) displayCtrl 523;
	private _uidTexto = (findDisplay 49) displayCtrl 109;
	_uid = getPlayerUID player;

    _topButton ctrlEnable false;
    _topButton ctrlSetText "Plata o Plomo || POP Life";
    _saveButton ctrlEnable false;
    _saveButton ctrlSetText "por Medel & Pacheco";
	_saveButton ctrlSetTooltip "Servidor creado por David Medel & José Pacheco";
	_fieldManual ctrlSetText "www.plataoplomo.es";
	_fieldManual ctrlSetTooltip "Nuestro Foro";
	_barra ctrlSetText "Plata o Plomo || POP Life || Modificado por Medel";
	_respawnButton ctrlSetText "TS3: POPLIFE";
	_respawnButton ctrlSetTooltip "Nuestro TS3";
	_nombre ctrlSetText profileName;
	_uidTexto ctrlSetText _uid;

	_abortButton ctrlEnable false;
	_respawnButton ctrlEnable false;
	_fieldManual ctrlEnable false;

	_usebleCtrl = call _canUseControls;
	_usebleCtrl spawn _escSync;
	if(_usebleCtrl) then {
		_respawnButton ctrlEnable false;
	};

    waitUntil {isNull (findDisplay 49) || {!alive player}};
    if (!isNull (findDisplay 49) && {!alive player}) then {
        (findDisplay 49) closeDisplay 2;
    };
};
