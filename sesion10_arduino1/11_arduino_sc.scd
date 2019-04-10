//=======================================
// SuperCollider recibe datos de arduino
// 4 análogos, 5 digitales
// Instalar Quark: ArduinoQuaternion
//=======================================

// 1 ver puertos
SerialPort.listDevices

// 2 activar conexión Arduino
// cambia el puerto "/dev/ttyUSB0" por el que te saló en la lista anterior

~arduino = ArduinoSMS("/dev/ttyUSB0", 115200);

(
~arduino.action = {|... msg|

	~analog1=msg[0];
	~analog2=msg[1];
	~analog3=msg[2];
	~analog4=msg[3];
	~digital1=msg[4];
	~digital2=msg[5];
	~digital3=msg[6];
	~digital4=msg[7];
	~digital5=msg[8];

};
);

(
~control = Routine{
	var digitalAnt1, cambio1=0; // hacemos una comparación de estado prendido/apagado para entradas digitles o botones
	var digitalAnt2, cambio2=0;
	var digitalAnt3, cambio3=0;
	var digitalAnt4, cambio4=0;
	var digitalAnt5, cambio5=0;

	loop{

		~sinte.set(\frec, ~analog1.linlin(0,1023, 300,600));
		~sinte.set(\amp, ~analog2.linlin(0, 1023,0.0,1.0));
		~analog3;
		~analog4;

           if(~digital1 != digitalAnt1,
           {
           if (~digital1 == 0, {cambio1 = cambio1 +1});
           ~sinte.set(\puerta, (cambio1 %2).postln);
		   //(cambio1 %2).postln;
           }
           );

           if(~digital2 != digitalAnt2,
           {
           if (~digital2 == 0, {cambio2 = cambio2 +1});
           (cambio2 %2).postln;
           }
           );

           if(~digital3 != digitalAnt3,
           {
           if (~digital3 == 0, {cambio3 = cambio3 +1});
           (cambio3 %2).postln;
           }
           );

           if(~digital4 != digitalAnt4,
           {
           if (~digital4 == 0, {cambio4 = cambio4 + 1});
           (cambio4 %2).postln;
           }
           );

           if(~digital5 != digitalAnt5,
           {
           if (~digital5 == 0, {cambio5 = cambio5 + 1});
           (cambio5 %2).postln;
           }
           );

           digitalAnt1 = ~digital1;
           digitalAnt2 = ~digital2;
           digitalAnt3 = ~digital3;
           digitalAnt4 = ~digital4;
           digitalAnt5 = ~digital5;

           0.01.yield;}}.play;
);

// usar valores en un SynthDef
s.boot;
(
SynthDef(\arduino,{
	arg frec = 80, am = 0.5, paneo = 0, puerta = 1, salida = 0;
	var sen, pan, env;
	sen = Saw.ar(frec, amp);
	pan = Pan2.ar(sen, paneo);
	env = EnvGen.kr(Env.asr(0.2, 1, 0.2), puerta, doneAction:0); // doneAction en 0 para poder prender/apagar con botón
	Out.ar(salida, pan * env);
}).add
)

~sinte = Synth(\arduino);
~sinte.set(\puerta, 0);

// Para finalizar ==============================

~control.stop; // apagar rutina
~arduino.close; // CERRAR PUERTO !!

