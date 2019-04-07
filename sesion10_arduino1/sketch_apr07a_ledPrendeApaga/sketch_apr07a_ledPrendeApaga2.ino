/* Prender y apagar un led conectado a la salida digital 13.*/

int pin = 13; // nombramos la variable de tipo entero (int) como "pin" 13.

// aquí van funciones que se declaran una sola vez
void setup(){
Serial.begin(9600); // velocidad de transmisión de datos
pinMode(pin, OUTPUT); // decimos que el "pin" 13 fncionará como salida digital.
}

// aquí van funciones que deben actualizar su estado constantemente
void loop(){
    digitalWrite(pin, HIGH); // escribimos en el pin 13 un valor de voltaje mayor a 3 volts.
    delay(1000); // esperamos 1 segundo o 1000 milisegundos
    digitalWrite(pin, LOW); // escribimos en el pin 13 un valor de voltaje menor a 3 volts.
    delay(1000); // esperamos 1 segundo o 1000 milisegundos.
}
