
// recibir
OSCdef(\recibir,{|msg| msg[1].postln},'/chat').fix;

// enviar
m = NetAddr("127.0.0.1", 3000);

m.sendMsg("/chat", rrand(80,200));

