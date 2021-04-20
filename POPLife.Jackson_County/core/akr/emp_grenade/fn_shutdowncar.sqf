_car = _this select 0;
_car engineOn false;

_hanlded = _car getVariable["stall_EH", -1];

if(_hanlded < 0) then {
	_index = _car addEventHandler["Engine", life_fnc_stallEngineNoSound];
	_car setVariable["stall_EH", _index];
	
	_car spawn {
		sleep 60;
		
		_this removeEventHandler["Engine", _this getVariable["stall_EH", 0]];
	};
};