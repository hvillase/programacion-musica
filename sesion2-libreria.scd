// Librería de sintes

(// paréntesis de encapsulamiento

// sine percusivo
(
SynthDef(\sine, {arg freq=440, amp=0.3, pan=0, at=0.1, rel=0.5, out=0;
	var sen, paneo, env;

	sen=SinOsc.ar(freq,0,amp);
	paneo=Pan2.ar(sen, pan);
	env=EnvGen.kr(Env.perc(at,rel),doneAction:2);
	Out.ar(out, paneo*env);
}).add
);

// triangular percusivo
(
SynthDef(\tri, {arg freq=440, amp=0.3, pan=0, at=0.1, rel=0.5, out=0;
	var sen, paneo, env;

	sen=LFTri.ar(freq, 0, amp);
	paneo=Pan2.ar(sen, pan);
	env=EnvGen.kr(Env.perc(at,rel),doneAction:2);
	Out.ar(out, paneo*env);
}).add
);

// pulse percusivo
(
SynthDef(\pulse, {arg freq=440, amp=0.3, pan=0, at=0.1, rel=0.5, out=0;
	var sen, paneo, env;

	sen=Pulse.ar(freq, 0.5, amp);
	paneo=Pan2.ar(sen, pan);
	env=EnvGen.kr(Env.perc(at,rel),doneAction:2);
	Out.ar(out, paneo*env);
}).add
);

// diente de sierra percusivo
(
SynthDef(\saw, {arg freq=440, amp=0.3, pan=0, at=0.1, rel=0.5, out=0;
	var sen, paneo, env;

	sen=Saw.ar(freq, amp);
	paneo=Pan2.ar(sen, pan);
	env=EnvGen.kr(Env.perc(at,rel),doneAction:2);
	Out.ar(out, paneo*env);
}).add
);

// ruido blanco percusivo
(
SynthDef(\wn, {arg amp=0.3, pan=0, at=0.1, rel=0.5, out=0;
	var sen, paneo, env;

	sen = WhiteNoise.ar(amp);
	paneo = Pan2.ar(sen, pan);
	env = EnvGen.kr(Env.perc(at, rel),doneAction:2);
	Out.ar(out, paneo * env);
}).add
);

// reverb
(
SynthDef(\reverb, {arg mix=0.3, room=0.73, damp=0.9, amp=1, gate=1, out=0;
	var sen, env;

	sen = FreeVerb.ar(InFeedback.ar(11, 2), mix, room, damp, amp);
	env = EnvGen.kr(Env.asr(0.01, 1, 0.1), gate, doneAction: 0);
	Out.ar(out, sen * env);
}).add
);
)



