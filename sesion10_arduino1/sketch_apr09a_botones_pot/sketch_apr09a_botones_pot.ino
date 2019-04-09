// 7 botones, 4 pots

void setup() 
{
  //este loop es para leer los botones
  //modificar el loop para agregar mas botones
  for(int i = 2; i <= 6; i++)
  {
    pinMode(i, INPUT);
    digitalWrite(i, HIGH);
  }
  Serial.begin(115200);
}

void loop() 
{
  //el primer analogo no lleva caracter en blanco
  Serial.print(analogRead(0));
  //lleva caracter en blanco
  Serial.print(' '); // elimine BYTE no se soporta mas
  Serial.print(analogRead(1));

  Serial.print(' ');
  Serial.print(analogRead(2));

  Serial.print(' ');
  Serial.print(analogRead(3));
  
  //aqui empiezan los botones
  Serial.print(' ');
  Serial.print(digitalRead(2));

  Serial.print(' ');
  Serial.print(digitalRead(3));
  
  Serial.print(' ');
  Serial.print(digitalRead(4));
  
  Serial.print(' ');
  Serial.print(digitalRead(5));
  
  Serial.print(' ');
  Serial.print(digitalRead(6));

  Serial.println();
  delay(10);
}
