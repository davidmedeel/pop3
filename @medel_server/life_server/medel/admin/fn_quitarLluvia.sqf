
_rainLevel = rain;

while {_rainLevel != 0} do { 
  0 setRain 0; 
  forceWeatherChange;    
  sleep 1; 
};

["<t size='0.8' shadow='1' color='#00fa3e'>Un administrador ha quitado la Lluvia</t>", 0, 1, 5, 1, 0, 1] spawn BIS_fnc_dynamicText;
