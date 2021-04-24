/*
por: Quickskill to pro https://feedback.bistudio.com/T65008 esta bug thanks arma 3!!
	esto se llama desde un EH "HandleDamage" con call
*/
private["_parte","_victima","_damage","_source","_danoReducido","_danoReal","_voyEnCoche","_vaEnCoche","_dano","_dolor","_proj","_curWeapon"];

//pro level
 BIS_hitArray = _this; BIS_wasHit = true; // For BIS stuff to work

//get parametros
_victima 		= _this select 0;
_parte	= _this select 1;
_damage		= _this select 2;
_source 	= _this select 3;
_proj = _this select 4;
_voyEnCoche = vehicle _victima  != _victima;
_vaEnCoche =  false;



//reduccion de daño
_danoReducido = _damage * 0.65;
_danoExtra = _damage * 1.5;
//daño a 2 decimales
_danoReducido = (_danoReducido) / (10);


//daño maximo
if(_danoReducido >= 0.9)then{
	_danoReducido = 0.9;
};


//daño minimo
if(_danoReducido <= 0.05)then{
	_danoReducido = 0.05;
};

//si tienes puesto el fuego
if (!isNil {particAdmin} || !isNil {oculto}) exitWith {
	_dmg = damage _victima;
    _dmg
};

//si estoy muerto salimos
if !(alive _victima) exitWith {
	_damage = damage _victima ;
    _damage
};

//si no es null miramos si es un vehiculo //Rosen taser
if !(isNull _source ) then {
	_vaEnCoche =  vehicle _source  != _source;
};



//si es null me hago el daño yo solo
if (isNull _source)then{
    _source =  _victima;
};



//debug
//if( _proj != "" ) then {

//hint format ["Victima: %1 \n Parte: %2 \n Daño: %3 \n Quien: %4  \n Daño reducido: %5 \n Voy en Coche:%6 \n Va en Coche: %7 \n Proyectil:%8",_victima,_parte,_damage,_source,_danoReducido,_voyEnCoche,_vaEnCoche,_proj];

//};

//si es daño de caida
if (velocity _victima select 2 < -2.5 and !_voyEnCoche and _parte=="legs" OR _parte=="leg_l" OR _parte=="leg_r" OR _parte=="pelvis" and _proj=="" and !_vaEnCoche) exitWith{

//titleText ["Vaya guantazo..", "PLAIN"];



//daño

			_damage = _danoReducido;
			_dano = _victima getVariable "piernas";
			_danoReal = _dano + (_damage * 100);
			_victima  setVariable ["piernas", _danoReal, true];
			//_victima  setHit ["legs", _danoReal / 100];




//aplicamos efectos sangrado
	if ((random 100) < 15) then {
		[_victima, "piernas"] spawn ica_fnc_sangrando;
	};

//animacion

_fortaleza = "sup" call ica_fnc_expToLevel;
if(_fortaleza > 4) then {

	//titleText ["Buff otra persona no aguantaria tanto como tu...", "PLAIN"];

} else {

_animRecibir = "CL3_anim_beartrap1";
_victima playActionNow _animRecibir;
[ _victima,_animRecibir] remoteexeccall ["life_fnc_animSync",-2];

WaitUntil {!((animationState _victima) == "CL3_anim_beartrap1")};

_animRecibir = "CL3_anim_beartrap2";
_victima playActionNow _animRecibir;
[ _victima,_animRecibir] remoteexeccall ["life_fnc_animSync",-2];
};

//fractura de piernas
if ( _victima getVariable "piernas"  >= 50 ) then {


  			[_victima, "piernas"] spawn ica_fnc_fractura;
};

};


//si te daña un coche por atropello
if ( _vaEnCoche AND !_voyEnCoche OR _proj=="coche" ) exitWith {
//titleText["Atropellado", "PLAIN"];
	private "_rag";
    _rag = "Land_Can_V3_F" createVehicleLocal [0,0,0];
    _rag setMass 1e10;
    _rag attachTo [player, [0,0,0], "Spine3"];
    _rag setVelocity [0,0,6];
    player allowDamage false;
    detach _rag;
    0 = _rag spawn {
        deleteVehicle _this;
        player allowDamage true;
    };
    _dmg = damage _victima;
    _dmg
};


//si te tasean
if (((currentweapon _source) in ["Taser_26"]) AND !_voyEnCoche) exitWith {

	if (!(_victima getVariable ["restrained", false]) AND ((_victima distance _source) < 30)) then {
		[_victima, _source] spawn life_fnc_tazed;
	};
	_dmg = damage _victima;
    _dmg
	
	
};

//si me la he pegado
if ( _voyEnCoche AND _proj=="" ) exitWith {


	//titleText ["Me la he pegado..", "PLAIN"];
	_damagereal = _damage;
	_damage = _danoExtra;
	_velocidad = speed _victima;

	//a mas de 80 sangrados y daño
	if(_velocidad > 50 )then{
		if ((random 100) < 10) then {
		//_damage = (_damage * (_velocidad / 100));
		//_dano = _victima getVariable "cabeza";
		//_danoReal = _dano + (_damage * 100);
		//_victima  setVariable ["cabeza", _danoReal ,true];
		//[_victima, true, _source] spawn ica_fnc_inconsciente;
		[_victima, "piernas"] spawn ica_fnc_sangrando;
		};
	};
	if(_velocidad > 100)then{
		_victima spawn {
			addCamShake [8,2,80];
			[100] spawn bis_fnc_bloodeffect;
			"dynamicBlur" ppEffectEnable true;
			"dynamicBlur" ppEffectAdjust [5];
			"dynamicBlur" ppEffectCommit 0;
			"dynamicBlur" ppEffectEnable true;
			"dynamicBlur" ppEffectAdjust [0];
			"dynamicBlur" ppEffectCommit 1;
		};



		if ((random 100) < 8) then {
			_damage = (_damage * (_velocidad / 100));
			[_victima, "pecho"] spawn ica_fnc_sangrando;
			_dano = _victima getVariable "pecho";
			_danoReal = _dano + (_damage * 100);
			_victima  setVariable ["pecho",_danoReal,true];
			//_victima  setHit ["body", _danoReal / 100];
		};

		if ((random 100) < 8) then {
			_damage = (_damage * (_velocidad / 100));
			[_victima, "brazos"] spawn ica_fnc_sangrando;
			_dano = _victima getVariable "brazos";
			_danoReal = _dano + (_damage * 100);
			_victima  setVariable ["brazos",_danoReal,true];
			//_victima  setHit ["hands", _danoReal / 100];
		};

		if ((random 100) < 8) then {
			_damage = (_damage * (_velocidad / 100));
			[_victima, "piernas"] spawn ica_fnc_sangrando;
			_dano = _victima getVariable "piernas";
			_danoReal = _dano + (_damage * 100);
			_victima  setVariable ["piernas", _danoReal ,true];
			//_victima  setHit ["legs", _danoReal / 100];
		};

		if ((random 100) < 8) then {
			_damage = (_damage * (_velocidad / 100));
			_dano = _victima getVariable "cabeza";
			_danoReal = _dano + (_damage * 100);
			[_victima, "cabeza"] spawn ica_fnc_sangrando;
			_victima  setVariable ["cabeza", _danoReal ,true];
			//_victima  setHit ["head", _danoReal / 100];
		};


	};

		//inconciente + sangrado + daño
		if(_velocidad > 180 && (random 100) < 30)then{
		_damage = (_damage * (_velocidad / 100));		//compi es peor que te quedes inconsciente en todas las persecuciones por los bordillos o los arboles que aparezcan ... la poli se baje y te arreste. ( pues lo fixeo y solo te kedas inco si el oro va en coche)
		_dano = _victima getVariable "cabeza";
		_danoReal = _dano + (_damage * 100);
		_victima  setVariable ["cabeza", _danoReal ,true];
		[_victima, true, _source] spawn ica_fnc_inconsciente;
		[_victima, "cabeza"] spawn ica_fnc_sangrando;

		};
		if(_velocidad > 200 )then{
		_damage = (_damage * (_velocidad / 100));
		_dano = _victima getVariable "cabeza";
		_danoReal = _dano + (_damage * 100);
		_victima  setVariable ["cabeza", _danoReal ,true];
		[_victima, true, _source] spawn ica_fnc_inconsciente;
		[_victima, "cabeza"] spawn ica_fnc_sangrando;
		};
		//player setdamage (_danoReducido + (damage _victima));

		_i = 0;
		_md = [(_victima getVariable "piernas"),(_victima getVariable "pecho"),(_victima getVariable "brazos"),(_victima getVariable "cabeza")];
		{if(_x != 0) then {_i = _i + 1;};} foreach _md;
		_dmgmd = ((_victima getVariable "piernas") + (_victima getVariable "pecho") + (_victima getVariable "brazos") + (_victima getVariable "cabeza")) / (_i * 100);
		_victima setDamage _dmgmd;
		//hint format ["Victima: %1 \n Parte: %2 \n Daño: %3 \n Quien: %4  \n Daño reducido: %5 \n Voy en Coche:%6 \n Va en Coche: %7 \n Proyectil:%8 \n Extra:\n Daño Extra%9 \n Daño Final: %10",_victima,_parte,_damagereal,_source,_danoReducido,_voyEnCoche,_vaEnCoche,_proj,_danoExtra ,damage _victima];
		if (damage player >= 1) then {
			if (_source != _victima) then {
				(format ["%1 ha ejecutado a %2", _source getVariable ["realname",name _source], _victima getVariable "realname"]) remoteexeccall ["systemchat",-2];
				[getPlayerUID _source, _source getVariable ["realname",name _source], "187"] remoteexeccall ["life_fnc_wantedAdd",2];
			} else {
				(format ["%1 ha muerto",_victima getVariable "realname"]) remoteexeccall ["systemchat",-2];
			};
		};
		_damage = damage _victima;
		_damage
};


//si te disparan aumentamos el daño
if(_proj!="")then{
//titleText ["Me han disparado ...", "PLAIN"];



//headshoot bro!
_ammoMatanCabeza = ["RH_357mag_ball","RH_45acp", "RH_454_Casull","HLC_762x51_ball","RH_50_AE_Ball","B_408_Ball"];
_parteMorirInsta = ["head","head_hit"];

	if (_proj isEqualTo "CUP_B_12Gauge_74Slug" OR _proj isEqualTo "R3F_CARTOUCHES") then {
	_dmgesp = damage _victima;
	_danoExtra = _dmgesp + 0.04;
	if (_source distance _victima < 2 ) then {
		_danoExtra = _dmgesp + 0.8;
		};
	};

if ( _parte in _parteMorirInsta)then{

	_dmgex = damage _victima;
	_danoExtra = _danoReducido + 0.9;
}else{
	_danoExtra = 0;
};




[] spawn {
     addCamShake [8,2,80];

    [100] spawn bis_fnc_bloodeffect;

    "dynamicBlur" ppEffectEnable true;
    "dynamicBlur" ppEffectAdjust [5];
    "dynamicBlur" ppEffectCommit 0;

    "dynamicBlur" ppEffectEnable true;
    "dynamicBlur" ppEffectAdjust [0];
    "dynamicBlur" ppEffectCommit 1;
};

};

////////////////////////////////////
//Aplicamos el daño recibido  ///////////
//////////////////////////////////////

// hit cabeza solo con arma
if(_parte=="head" OR _parte=="head_hit" OR _parte=="neck" and _proj !="" ) then {

			if (_danoExtra > 0) then {_damage =  _danoExtra;} else {_damage =  _danoReducido; _danoExtra = 0;};

				_dano = _victima getVariable "cabeza";
				_danoReal = _dano + (_damage * 100);
				_victima setVariable ["cabeza", _danoReal, true];
			//	_victima  setHit ["head",  _danoReal / 100];

				[_victima, "cabeza"] spawn ica_fnc_sangrando;

				_dano = _victima getVariable "cabeza";

			if (_dano >= 75) then {

				[_victima, true] spawn ica_fnc_inconsciente;
			};

};

//hit brazos
if(_parte=="hands" OR _parte=="hand_r" OR _parte=="hand_l")then{

			_damage =  _danoReducido;
			_dano = _victima getVariable "brazos";
			_danoReal = _dano + (_damage * 100);
			_victima  setVariable ["brazos", _danoReal, true];
			//_victima  setHit ["hands",_danoReal / 100];

			if ((random 100) < 25) then {
				[_victima, "brazos"] spawn ica_fnc_sangrando;
			};

};

//hit pecho
if(_parte=="body" OR _parte=="spine1" OR _parte=="spine2" OR _parte=="spine3")then{



			 _damage = _danoReducido ;
			 _dano = _victima getVariable "pecho";
			 _danoReal = _dano + (_damage * 100);
	         _victima setVariable ["pecho",_danoReal, true];
			//  _victima  setHit ["body", _danoReal / 100];


			if ((random 100) < 25) then {
				[_victima, "pecho"] spawn ica_fnc_sangrando;
			};


};

//hit piernas
if(_parte=="legs" OR _parte=="leg_l" OR _parte=="leg_r" OR _parte=="pelvis")then{


			_damage = _danoReducido;
			_dano = _victima getVariable "piernas";
			_danoReal = _dano + (_damage * 100);
			_victima  setVariable ["piernas",_danoReal, true];
			//_victima  setHit ["legs", _danoReal / 100];

			if ((random 100) < 25) then {
				[_victima, "piernas"] spawn ica_fnc_sangrando;
			};


};




///inconciente
if( (_victima getVariable "pecho")>=70 || (_victima getVariable "brazos")>=80 )then{

	if ((ceil random 100) < 65) then {
			[_victima, true, _source] spawn ica_fnc_inconsciente;
	};
};


//fractura de piernas
if ((_victima getVariable "piernas") >= 50) then {


  			[_victima, "piernas"] spawn ica_fnc_fractura;
};


//dolor
if !(_victima getVariable "dolor") then { // si no tengo dolor
	_dolor = ((_victima getVariable "cabeza") + (_victima getVariable "pecho") + (_victima getVariable "brazos") + (_victima getVariable "piernas")) / 4;
	if (_dolor > 50) then {
		[_victima] spawn ica_fnc_dolor; // empiezo el loop del dolor
		titleText ["Tengo que ver un medico pronto ...", "PLAIN"];
	};
};
//player setdamage (_danoReducido + (damage player) + _danoExtra);
//lo han ejecutado?
_i = 0;
_md = [(_victima getVariable "piernas"),(_victima getVariable "pecho"),(_victima getVariable "brazos"),(_victima getVariable "cabeza")];
{if(_x != 0) then {_i = _i + 1;};} foreach _md;
_dmgmd = ((_victima getVariable "piernas") + (_victima getVariable "pecho") + (_victima getVariable "brazos") + (_victima getVariable "cabeza")) / (_i * 100);
_victima setDamage _dmgmd;
//hint format ["Victima: %1 \n Parte: %2 \n Daño: %3 \n Quien: %4  \n Daño reducido: %5 \n Voy en Coche:%6 \n Va en Coche: %7 \n Proyectil:%8 \n Extra:\n %9 \n Quien: %10",_victima,_parte,_damage,_source,_danoReducido,_voyEnCoche,_vaEnCoche,_proj, _danoExtra ,damage _victima];
if (damage player >= 1) then{
	if (_source != _victima) then {
		(format ["%1 ha ejecutado a %2", _source getVariable ["realname",name _source], _victima getVariable "realname"]) remoteexeccall ["systemchat",-2];
		[getPlayerUID _source, _source getVariable ["realname", _nameSource], "187"] remoteexeccall ["life_fnc_wantedAdd",2];
	} else {
		(format ["%1 ha muerto",_victima getVariable "realname"]) remoteexeccall ["systemchat",-2];
	};
};

//salir con el daño total de la victima


_damage = damage _victima;
_damage
