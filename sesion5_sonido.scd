
s.boot

// para cargar archivos, necesitas concoer la ruta de tus muestras de audio
~buf1=Buffer.read(s, "/home/hvillase/.local/share/SuperCollider/Recordings/SC_190305_175809.aiff");
~buf2=Buffer.read(s, "/home/hvillase/.local/share/SuperCollider/Recordings/SC_190305_175809.aiff");

~buf1.play
~buf1.query

~buf2.play
~buf2.query

// --- Muestras mono
(
SynthDef(\sonido, {arg rate=1, st=0, salida=0;
	var sonido;

	sonido = PlayBuf.ar(1, ~buf1.bufnum, rate, startPos:st);

	Out.ar(salida, sonido)
}).add
);

// Para tocar el sinte
Synth(\sonido, [\rate, rrand(0.5, 6.0), \st, ~buf1.numFrames/rrand(1.2, 8.0)]);


// --- Muestras estereo
(
SynthDef(\sonidost, {arg rate=1, st=0, salida=0;
	var sonido;

	sonido = PlayBuf.ar(2, ~buf1.bufnum, rate, startPos:st);

	Out.ar(salida, sonido)
}).add
);

// Para tocar el sinte
Synth(\sonidost, [\rate, rrand(1.5, 3.0), \st, ~buf1.numFrames/rrand(1.2, 8.0)]);












