// Código para recibir datos de Arduino
// Adaptado del tutorial 19 de Eli Fieldsteel
// 2 botones, dos potenciometros

SerialPort.listDevices; // nos muestra los puertos disponibles

// 1 activar comunicación con puerto serial
~puerto = SerialPort.new("/dev/ttyUSB0", 9600); // puerto de comunicación serial, velocidad de comunicación

~puerto.read // lee el valor del puerto por un momento
~puerto.close // cierra el puero de comunicación serial CERRAR AL TERMINAR SESIÓN

// comunicación por medio de rutinas

// 2 prende rutina ara lectura de valores
(
~arregloCaracteres = [];
~rutinaValores = Routine.new({
	var ascii;
	{
	ascii = ~puerto.read.asAscii;
	if(ascii.isDecDigit, {~arregloCaracteres = ~arregloCaracteres.add(ascii)});
	if(ascii == $a, {
		~valor = ~arregloCaracteres.collect(_.digit).convertDigits;
		~arregloCaracteres = [];
	});
	}.loop;
}).play
)

~rutinaValores.stop; // para la rutina

~valor; // actualiza el valor

// 3 prendemos servidor y activamos el sinte
s.boot;

(
SynthDef(\arduino,{
	arg frec=80, amp=0.5, paneo=0, puerta=1, salida=0;
	var sen, pan, env;
	sen = Saw.ar(frec, amp);
	pan = Pan2.ar(sen, paneo);
	env = EnvGen.kr(Env.asr(0.2, 1, 0.2), puerta, doneAction:2);
	Out.ar(salida, pan * env);
}).add
)

~sinte = Synth(\arduino)
~sinte.set(\puerta, 0)


// 4 activamos rutina de control de los valores entrantes
(
~control = Routine.new({
	{
		~sinte.set(\frec, ~valor.linlin(0, 1023, 80, 120));
		0.01.wait;
	}.loop;
}).play
)

~control.stop;

// final

~control.stop; // paramos rutina de control
~sinte.set(\puerta, 0); // paramos sinte
~rutinaValores.stop; // paramos rutina de lectura de datos
~puerto.close; // cerramos puerto de comunicación


