// sesion 1 29.01.19
// SynthDef y Pdef

// Prender servidor (scsynth)
s.boot

// -- SynthDef (Synth definition) de onda sinoidal
(
SynthDef(\sine, {arg freq=440, amp=0.3, pan=0, at=0.1, rel=0.5, out=0;
	var sen, paneo, env;

	sen=SinOsc.ar(freq,0,amp);
	paneo=Pan2.ar(sen, pan);
	env=EnvGen.kr(Env.perc(at,rel),doneAction:2);
	Out.ar(out, paneo*env);
}).add
)

// Método para activar una sola nota del SynthDef, esta igualado a la variable "a"
a=Synth(\sine,[\freq, 300, \amp, 0.5, \pan, 0.5, \at, 0.3, \rel, 1])

// -- Pdef (pattern definition). Puedes cambiar valores y actulizarlos sin detener el patrón

// Pdef activado direcatamente sin cuantización
(
Pdef(\secuencia, Pbind(\instrument, \sine,
	\dur, 0.5,
	\freq, 440,
	\rel, 0.5,
	\amp, 0.5
)).play // para parar patrón poner .stop y declarar
);

// Pdef igualado a la variable "b" con cuantización, activado de manera externa. Contiene las listas de valores con Pseq. Usa frecuencia.
(
b=Pdef(\secuencia2, Pbind(\instrument, \sine,
	\dur, 0.5,
	\freq, Pseq([300, 400, 560, 490], inf),
	\rel, 0.5,
	\amp, 0.5
))
);

b.play.quant_(4); // prendes
b.stop; // apagas

// Pdef igual que el anterior solo que usa notas

(
c=Pdef(\secuencia3, Pbind(\instrument, \sine,
	\dur, Pseq([0.5, 0.25, 0.75], inf), // nota el ritmo a partir de duración
	\note, Pseq([0,1,2,3,4,5,6,7,8,9,10], inf), // usa notas en semitonos
	\octave, 6, // octava de registro
	\rel, 1.1,
	\pan, Pseq([1.0, 0, -1.0], inf), // nota el movimiento entre bocinas
	\amp, 0.4
))
);

c.play.quant_(4);
c.stop;

// Pdef igual que el anterior solo que usa escalas y degree

(
d=Pdef(\secuencia4, Pbind(\instrument, \sine,
	\dur, Pseq([0.5, 0.25, 0.5], inf), // nota el ritmo a partir de duración
	\scale, Scale.minor,
	\degree, Pseq([0,1,2,3,4,5,6,7,8].mirror, inf), // usa grados de escala
	\octave, 5, // octava de registro
	\rel, 0.8,
	\pan, Pseq([1.0, 0, -1.0], inf), // nota el movimiento entre bocinas
	\amp, 0.5
))
);

d.play.quant_(4);
d.stop;

Scale.directory // para ver las escalas disponibles
