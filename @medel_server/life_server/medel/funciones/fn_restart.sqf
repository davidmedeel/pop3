	[] spawn {
			_restartTime = "+str _RESTART_TIME_IN_M+";
			_msgTimes = "+str _SHOW_TIMER_IN_MIN+";
			_msgFormat = '<t size=''0.70'' color=''#DA1700'' align=''right''>RESTART EN %1 MINUTOS</t>';
		"; }; _A3AHstring = _A3AHstring + "
		";
		while{1==1}do {
			"; if(_UOL)then{ _A3AHstring = _A3AHstring + "
				{
					_onLoad = toArray(getText(configFile >> _x >> 'onLoad'));
					_server_onLoad = _server_onLoadUnload2 select _forEachIndex;
					if(!(_onLoad isEqualTo _server_onLoad) && !(_onLoad isEqualTo ''))then
					{
						_log = format['onLoad changed: %1, %2, %3',_x,toString _onLoad,toString _server_onLoad];
						[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
						[] call _AHKickOFF;
					};
					_onUnload = toArray(getText(configFile >> _x >> 'onUnload'));
					_server_onUnload = _server_onLoadUnload3 select _forEachIndex;
					if(!(_onUnload isEqualTo _server_onUnload) && !(_onUnload isEqualTo ''))then
					{
						_log = format['onUnload changed: %1, %2, %3',_x,toString _onUnload,toString _server_onUnload];
						[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
						[] call _AHKickOFF;
					};
				} forEach _server_onLoadUnload1;
			"; }; _A3AHstring = _A3AHstring + "
			"; if(_UMP)then{ _A3AHstring = _A3AHstring + "
				uiSleep 1;
				_children = [configFile >> 'RscDisplayMPInterrupt' >> 'controls',0] call BIS_fnc_returnChildren;
				_allowedChildren = ['Title','MissionTitle','DifficultyTitle','PlayersName','ButtonCancel','ButtonSAVE','ButtonSkip','ButtonRespawn','ButtonOptions','ButtonVideo','ButtonAudio','ButtonControls','ButtonGame','ButtonTutorialHints','ButtonAbort','DebugConsole','Feedback','MessageBox','CBA_CREDITS_M_P','CBA_CREDITS_CONT_C','Version','TrafficLight','TraffLight'];
				{
					_cfgName = configName _x;
					if(!(_cfgName in _allowedChildren))then
					{
						_log = format['Modified MPInterrupt: %1 | %2',_x,_cfgName];
						[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
						[] call _AHKickOFF;
					};
				} forEach _children;
				uiSleep 1;
			"; }; _A3AHstring = _A3AHstring + "
			"; if(_USE_RESTART_TIMER)then{ _A3AHstring = _A3AHstring + "
				_currentmessagetime = (_restartTime - round(serverTime / 60));
				if(_currentmessagetime in _msgTimes)then
				{
					_msgTimes = _msgTimes - [_currentmessagetime];
					[
						format[_msgFormat, _restartTime - round(serverTime / 60)],
						[safezoneX + safezoneW - 0.8,0.50],
						[safezoneY + safezoneH - 0.8,0.7],
						5,
						0.5
					] call BIS_fnc_dynamicText;
				};
			"; }; _A3AHstring = _A3AHstring + "
			uiSleep 8;
		};
	};