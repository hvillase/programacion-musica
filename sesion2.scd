// sesión 2 código comentado

// --- SynthDef Comentado

// kr: velocidad de control; ar: velocidad de audio

( // estos paréntesis te ayudan a encapsular código para evaluarlo.

SynthDef // Objeto: definición de sintetizador
(// estos paréntesis contienen el sintetizador
\sine, // nombre del sintetizador
{ // estas llaves contienen la función del sintetizador
arg freq=440, amp=0.3, pan=0, at=0.1, rel=0.5, out=0; // aquí se declaran argumentos

var sen, paneo, env; // aquí se declaran variables

	sen = SinOsc.ar(freq, 0, amp); // variable sen igualada a Objeto: SinOsc, adentro se sustituyen algunos parámetros del Objeto por argumentos.
	paneo = Pan2.ar(sen, pan); // variable paneo igualada a Objeto: Pan2
	env = EnvGen.kr(Env.perc(at,rel), doneAction: 2); // variable env igualada a Objeto EnvGen. Adentro el Objeto: Env con mensaje percusivo
	Out.ar(out, paneo * env); // Out es el Objeto que indica hacia dónde va la salida del sintetizador y que sale
}).add // el mensaje add envía el sintetizador al Server
); // punto y coma indica final de código

a = Synth // variable 'a' igualada al Objeto: Synth
( // paréntesis contienen nombre y valores de la instancia Synth
\sine, // nombre del sintetizador que queremos instanciar, coma
[// estos corchetes contienen los argumentos que queremos modificar
	\freq, 300, // argumeto: frecuencia, valor: 300
	\amp, 0.5,
	\pan, 0.5, \at, 0.3, \rel, 1]); // punto y como indica final de código

// --- Pdef comentado
( // estos paréntesis te ayudan a encapsular código para evaluarlo.

b = Pdef // variable 'b' igualada al Objeto: definición de Patrón
(// estos paréntesis contienen el PatternDefinition o Pdef
\secuencia2, // este es el nombre del Pdef, luego una coma
Pbind // este es Objeto combina diferentes flujos de información y sus valores en un solo flujo de información
( // estos paréntesis contienen los flujos o streams de Pbind
\instrument, \sine, // llave: instrument, valor: sintetizador que queremos usar
	\dur, 0.5, // llave: duración, valor: medio segundo
	\freq, Pseq([300, 400, 560, 490], inf), // llave: frecuencia, valor: el Objeto: Patrón de secuencia o lista de valores que se van ejecutando uno detrás de otro con el intervalo de duración marcadom por la llave: \dur
\rel, 0.5, // llave: rel (definida en argumentos del sintetizado \sine), valor: 0.5
\amp, 0.5 // llave: amp (definida en argumentos del sintetizado \sine), valor: 0.5
))
);

b.play.quant_(4); // variable 'b' recibe mensajes play y quantizar cada 4 valores de duración
b.stop; // variable 'b' recibe mensaje stop


// cómo encontrar la carpeta de Extensions

Platform.userExtensionDir
Platform.systemExtensionDir

Quarks.gui







