
s.boot

// Directorio de sonido, busca el tuyo, puede usar el comando de terminal $ pwd

/home/hvillaseEscritorio/sonidos/sonidos-clase.wav

~buf1=Buffer.read(s, "/home/hvillase/Escritorio/sonidos/sonidos-clase.wav")
~buf1.play
~buf1.query

(
SynthDef(\sonido, {arg rate=1, st=0, salida=0;
	var sonido;

	sonido = PlayBuf.ar(1, ~buf1.bufnum, rate, startPos:st);

	Out.ar(salida, sonido)
}).add
)

Synth(\sonido, [\rate, rrand(0.5, 6.0), \st, ~buf1.numFrames/rrand(1.2, 8.0)])














