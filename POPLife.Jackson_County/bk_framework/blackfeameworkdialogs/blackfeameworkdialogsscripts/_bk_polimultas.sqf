
hint "HOLA ainicio";

_Trafico = 0;
_Robos = 1;
_Armas = 2;
_Narcoticos = 3;
_AgresionesHomicidios = 4;
_DisturbiosTestimonios = 5;
_DelitosContraElEstado = 6;
_Terrorismo = 7;
_TraficoAereo = 8;

_MultaMaxima = 250000;
_CarcelMaxima = 120;

Private [	"_Multa","_DeliID","_Categoria","_Titulo","_Descripcion","_Multa","_Incremento","_CarcelPagando","_CarcelSinPagar","_CarcelIncPagando","_CarcelIncNOPagando","_SancionAdicional",
			"_CatID","_CatMombre","_CatDescripcion","_CatCarcelSugerida",
			"_MultaArray"];

_MultaArray = [];
hint "HOLA medio";

AddMultaCategoria = {
	Private ["_TempArray"];
	_TempArray = _This select 0;
	_TempArray = _TempArray + [[_This select 1, _This select 2, _This select 3, _This select 4, []]];
	_TempArray
};

// ************************** LLENAR CATEGORIAS

_CatID 				= _Trafico;
_CatMombre 			= "Trafico";
_CatDescripcion 	= "Faltas e infracciones de trafico terrestre";
_CatCarcelSugerida 	= "De 5 minutos infracciones leves y pagando a 40 minutos por graves sin pagar multa";
_MultaArray = [_MultaArray,_CatID,_CatMombre,_CatDescripcion,_CatCarcelSugerida] Call AddMultaCategoria ;

_CatID 				= _Robos;
_CatMombre 			= "Robos";
_CatDescripcion 	= "Delitos de robos y hurtos";
_CatCarcelSugerida 	= "De 15 minutos delitos leves y pagando a 30 minutos por graves sin pagar multa";
_MultaArray = [_MultaArray,_CatID,_CatMombre,_CatDescripcion,_CatCarcelSugerida] Call AddMultaCategoria ;

_CatID 				= _Armas;
_CatMombre 			= "Armas";
_CatDescripcion 	= "Delitos relacionados con armas";
_CatCarcelSugerida 	= "De 15 minutos delitos leves y pagando a 35 minutos por graves sin pagar multa";
_MultaArray = [_MultaArray,_CatID,_CatMombre,_CatDescripcion,_CatCarcelSugerida] Call AddMultaCategoria ;

_CatID 				= _Narcoticos;
_CatMombre 			= "Narcotrafico";
_CatDescripcion 	= "Delitos relacionados con armas";
_CatCarcelSugerida 	= "De 15 minutos delitos leves y pagando a 60 minutos por graves sin pagar multa";
_MultaArray = [_MultaArray,_CatID,_CatMombre,_CatDescripcion,_CatCarcelSugerida] Call AddMultaCategoria ;

_CatID 				= _AgresionesHomicidios;
_CatMombre 			= "Agresiones y Homicidios";
_CatDescripcion 	= "Delitos de violencia, agreciones y homicidios";
_CatCarcelSugerida 	= "De 15 minutos delitos leves y pagando a 90 minutos por graves sin pagar multa";
_MultaArray = [_MultaArray,_CatID,_CatMombre,_CatDescripcion,_CatCarcelSugerida] Call AddMultaCategoria ;

_CatID 				= _DisturbiosTestimonios;
_CatMombre 			= "Disturbios y Testimonios";
_CatDescripcion 	= "Delitos de orden publico, disturbios, civismo y testimonios";
_CatCarcelSugerida 	= "De 5 minutos delitos leves y pagando a 20 minutos por graves sin pagar multa";
_MultaArray = [_MultaArray,_CatID,_CatMombre,_CatDescripcion,_CatCarcelSugerida] Call AddMultaCategoria ;

_CatID 				= _DelitosContraElEstado;
_CatMombre 			= "Delitos contra el estado";
_CatDescripcion 	= "Delitos graves contra el estado y seguridad nacional";
_CatCarcelSugerida 	= "De 15 minutos pagando a 90 minutos por graves sin pagar multa";
_MultaArray = [_MultaArray,_CatID,_CatMombre,_CatDescripcion,_CatCarcelSugerida] Call AddMultaCategoria ;

_CatID 				= _Terrorismo;
_CatMombre 			= "Terrorismo";
_CatDescripcion 	= "Delitos de terrorismo y contra los DDHH";
_CatCarcelSugerida 	= "De 15 minutos pagando a 90 minutos por graves sin pagar multa";
_MultaArray = [_MultaArray,_CatID,_CatMombre,_CatDescripcion,_CatCarcelSugerida] Call AddMultaCategoria ;

_CatID 				= _TraficoAereo;
_CatMombre 			= " Trafico Aereo";
_CatDescripcion 	= "Delitos contra la seguridad aeronautica";
_CatCarcelSugerida 	= "De 5 minutos infracciones leves y pagando a 40 minutos por graves sin pagar multa";
_MultaArray = [_MultaArray,_CatID,_CatMombre,_CatDescripcion,_CatCarcelSugerida] Call AddMultaCategoria ;

// ************************** LLENAR DELITOS

AgregarMulta = {
	Private ["_FullArray","_SelCatArray","_DelitosArray","_TempCat"];
	_FullArray = _This select 0;
	_TempCat = _This select 1;
	_SelCatArray = _FullArray select _TempCat;
	_DelitosArray = _SelCatArray select 4;
	_DelitosArray = _DelitosArray + [[_This select 2,_This select 3,_This select 4,_This select 5,_This select 6,_This select 7,_This select 8,_This select 9,_This select 10,_This select 11]];
	_SelCatArray set [4,_DelitosArray];
	_FullArray set [(_This select 1),_SelCatArray];
	hint str (_SelCatArray select 4);
	_FullArray;
};

_Categoria = _Trafico;
_DeliID = "1_1";
_Titulo = "Campo a traves";
_Descripcion = "Conducir con un vehículo a traves de campo omitiendo cualquier vía circulatoria";
_Multa = 6000;				// Valor de la multa
_Incremento = 0;			// Valor que se incrementa si se repite varias veces la multa (0 significa que no se repite solo se comete 1 delito sin incremente)
_CarcelPagando = 0;			// Tiempo en minutos de carcel si se paga la multa
_CarcelSinPagar = 10;		// Tiempo de carcel SI NO paga la multa
_CarcelIncPagando = 0;		// Si paga Incremento acumulativo de carcel si paga la multa por repetir el delito (0 indica que no se acumula por repetir el delito solo se toma una vez)
_CarcelIncNOPagando = 0;	// Si NO paga Incremento acumulativo de carcel si paga la multa por repetir el delito (0 indica que no se acumula por repetir el delito solo se toma una vez)
_SancionAdicional = "Retirada de 4 puntos del carnet";
_MultaArray = [_MultaArray,_Categoria,_DeliID,_Titulo,_Descripcion,_Multa,_Incremento,_CarcelPagando,_CarcelSinPagar,_CarcelIncPagando,_CarcelIncNOPagando,_SancionAdicional] Call AgregarMulta ;

_Categoria = _Trafico;
_DeliID = "1_2";
_Titulo = "Conduccion temeraria";
_Descripcion = "Conducir de manera irresponsable con el riesgo de provocar algun accidente";
_Multa = 10000;				// Valor de la multa
_Incremento = 0;			// Valor que se incrementa si se repite varias veces la multa (0 significa que no se repite solo se comete 1 delito sin incremente)
_CarcelPagando = 0;			// Tiempo en minutos de carcel si se paga la multa
_CarcelSinPagar = 10;		// Tiempo de carcel SI NO paga la multa
_CarcelIncPagando = 0;		// Si paga Incremento acumulativo de carcel si paga la multa por repetir el delito (0 indica que no se acumula por repetir el delito solo se toma una vez)
_CarcelIncNOPagando = 0;	// Si NO paga Incremento acumulativo de carcel si paga la multa por repetir el delito (0 indica que no se acumula por repetir el delito solo se toma una vez)
_SancionAdicional = "Retirada del vehiculo<br />Retirada de 6 puntos del carnet";
_MultaArray = [_MultaArray,_Categoria,_DeliID,_Titulo,_Descripcion,_Multa,_Incremento,_CarcelPagando,_CarcelSinPagar,_CarcelIncPagando,_CarcelIncNOPagando,_SancionAdicional] Call AgregarMulta ;

_Categoria = _Trafico;
_DeliID = "1_3";
_Titulo = "Mal aparcado";
_Descripcion = "Estacionar el vehículo de manera incorrecta u obstaculizando el paso.";
_Multa = 1000;				// Valor de la multa
_Incremento = 1000;			// Valor que se incrementa si se repite varias veces la multa (0 significa que no se repite solo se comete 1 delito sin incremente)
_CarcelPagando = 0;			// Tiempo en minutos de carcel si se paga la multa
_CarcelSinPagar = 5;		// Tiempo de carcel SI NO paga la multa
_CarcelIncPagando = 0;		// Si paga Incremento acumulativo de carcel si paga la multa por repetir el delito (0 indica que no se acumula por repetir el delito solo se toma una vez)
_CarcelIncNOPagando = 2;	// Si NO paga Incremento acumulativo de carcel si paga la multa por repetir el delito (0 indica que no se acumula por repetir el delito solo se toma una vez)
_SancionAdicional = "Retirada del vehiculo<br />Retirada de 6 puntos del carnet";
_MultaArray = [_MultaArray,_Categoria,_DeliID,_Titulo,_Descripcion,_Multa,_Incremento,_CarcelPagando,_CarcelSinPagar,_CarcelIncPagando,_CarcelIncNOPagando,_SancionAdicional] Call AgregarMulta ;

//hint str _MultaArray;



