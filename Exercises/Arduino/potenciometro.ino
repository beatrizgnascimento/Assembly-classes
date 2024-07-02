int led = 10;
int potenciometro = 0;
int valorLido = 0;
void setup()
{
  pinMode(led, OUTPUT);
  Serial.begin(9600);
}

void loop()
{
  valorLido = analogRead(potenciometro); 
  delay(10);
  analogWrite(led, valorLido/4);
  Serial.println(valorLido);//printar valores 
}