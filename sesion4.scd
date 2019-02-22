s.boot // prendemos supercollider

// Primero necesitamos declarar el documento:
// sesion2-libreria.scd
// descargala del github de la clase

// Encendemos el efecto
f=Synth(\reverb)

// modificamos los valores del reverb
f.set(\mix, 0.55, \room, 0.75, \damp, 0.75)

// cambia .stop por .play y declara el código
(
Pdef(\efx, Pbind(\instrument, \tri,
	\dur, Pseq([0.5, 0.3, 1, Pn(0.2, 4)], inf),
	\amp, 0.4,
	\out, 11,
	\rel, Pbrown(0.01, 0.5, 0.01, inf),
	\note, Pstutter(2, Pseq([2,4,6,7], inf)),
	\octave, Pseq([3, 4, Pn(5, 3)], inf),
	\pan, Pwhite(-1.0, 1.0, inf)
)
).stop
)

