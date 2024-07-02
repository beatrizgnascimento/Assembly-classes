int pinoLed = 10;
int ftr = 0;
int valorLido = 0;

void setup()
{
  
  pinMode(pinoLed, OUTPUT);
  pinMode(ftr, INPUT);
}

void loop()
{
  valorLido = analogRead(ftr); //ler o valor do fotorresistor
  delay(10);
  
  if(valorLido > 550)
    digitalWrite(pinoLed, HIGH);
  else
    digitalWrite(pinoLed, LOW);
}