/*
File: fn_fadeSound.sqf
Auhtor: Michael Francis

Description:
Fades out sound.
*/
life_fadeSound = !life_fadeSound;

if (life_fadeSound) then 
{
	0.1 fadeSound 0.05; // Faded to 10%
	hint "Te has puesto los tapones"
}
else
{
	0.1 fadeSound 1; // Returned to 100%
	hint "Te has quitado los tapones"
};