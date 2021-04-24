
_param = param [0];

if (_param isEqualTo "Init") exitWith {

    MedMarkes = [];
    PlayerMarkers = [];
    
    [] spawn {

        _asd = 0;
        _player = [];

        while {_asd >= 100} do {
            _player pushBack format ["civ_%1",_asd];
            _asd = _asd + 1;
        };

        _asd = 1;

        while {!(_asd >= 25)} do {
            _player pushBack format ["cop_%1",_asd];
            _asd = _asd + 1;
        };

        _asd = 1;

        while {!(_asd >= 15)} do {
            _player pushBack format ["medic_%1",_asd];
            _asd = _asd + 1;
        };

        while {true} do {

            sleep 60;

            {

                deleteMarkerLocal str _x;
                
            } forEach _player;

        };

    };    

    while{true} do { 

        if ("ItemGPS" in assignedItems player) then {

                {
                    if !(_x in units(group player)) then {
                        deleteMarkerLocal str _x;
                    };
                } forEach PlayerMarkers;

                PlayerMarkers = [];

                {
                    if(alive _x && isplayer _x && "ItemGPS" in assignedItems _x ) then {
                        deleteMarkerLocal str _x;
                        _pSee = createMarkerLocal [str _x,getPos _x];
                        _pSee setMarkerTypeLocal "Mil_dot";
                        _pSee setMarkerPosLocal getPos _x;
                        _pSee setMarkerSizeLocal [1,1];
                        if !(player isequalto _x) then {
                            _pSee setMarkerTextLocal format['%1',_x getVariable["realname",name _x]];
                        };
                        _color = format ["Color%1",side player];
                        _pSee setMarkerColorLocal _color;
                        PlayerMarkers = PlayerMarkers + [_x];
                    };
                } forEach (units(group player));

                sleep 0.4;
        } else {

                sleep 5;

        };
    };

};

if (_param isEqualTo "Med") exitWith {

    {
        _name = _x getVariable ["name",nil];

        if(!isNil "_name") then {
            
            _marker = createMarkerLocal [format["%1_dead_marker",_x],visiblePosition _x];
            _marker setMarkerColorLocal "ColorRed";
            _marker setMarkerTypeLocal "loc_Hospital";
            _marker setMarkerTextLocal format["%1",(_x getVariable["name","???? ????"])];
            _marker setMarkerSizeLocal [2, 2];
            MedMarkes pushBack _marker;
        };

    } foreach allDeadMen;
    
};

if (_param isEqualTo "Load") exitWith {
    waitUntil {!isNull findDisplay 12};
    findDisplay 12 displayCtrl 51 ctrlAddEventHandler ["Draw", {
        if (visibleMap) then {
            _scale = 0.15 / ctrlMapScale (_this select 0);
            if (_scale > 0.95) then {_scale = 0.95};
            {
                _m = "#markerSize_" + _x;
                if (markerShape _x == "ICON") then {
                    if (isNil {missionNamespace getVariable _m}) then {
                        missionNamespace setVariable [_m, markerSize _x];
                    };
                    _x setMarkerSizeLocal [
                        ((missionNamespace getVariable _m) select 0) * _scale,
                        ((missionNamespace getVariable _m) select 1) * _scale
                    ];
                };
            } forEach allMapMarkers;
        };
    }];
};
