player action ["Eject", vehicle player];
[] spawn
{
	player allowdamage false;
	while {(getpos player) select 2 > 1} do
	{
		player setvelocity [0,0,-6];
	};
	waitUntil {sleep 0.5;isTouchingGround player};
	player allowdamage true;
};