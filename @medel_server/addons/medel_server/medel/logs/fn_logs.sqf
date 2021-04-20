
/*
por: Medel
*/

params [["_filename", "LOG", [""]], ["_logentry", "", [""]]];

//_filename = format["A3_%1_%2_%3", briefingName select [0,10], worldName select [0,10], _filename];
_filename = format["POP3_%1", _filename];

diag_log format ["2"+_filename+" | "+_logentry];

"armalog" callExtension ("2"+_filename+" | "+_logentry);
