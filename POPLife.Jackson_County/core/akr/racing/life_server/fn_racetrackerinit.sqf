/*
	File: fn_raceTrackerInit.sqf
	Author: Akryllax
	Desc: Racing tracker init.
*/


/*
 * Stores current ongoing races.
 *
 *	[
 *		["raceID1",0],
 *		["raceID2",1],
 *		["raceID3",2],
 *		["raceID3",3]
 *	]
 *
 */

racing_statEnum = ["none","waiting","racing","finished"];

publicVariable "racing_statEnum";