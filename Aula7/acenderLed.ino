// C++ code
//

int led = 5;

//função executada somente uma vez
void setup()
{
  pinMode(led, OUTPUT); //a porta do led 5 é uma saída digital
}

void loop()
{
  digitalWrite(led, HIGH); //nivel logico alto na porta do led, acender o led
  delay(1000); //espera por 1s (1000ms)
  digitalWrite(led, LOW); //nivel logico baixo na porta do led, apaga
  delay(1000);
}