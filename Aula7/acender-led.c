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
  digitalWrite(led, LOW); //nivel logico baixo na porta do led, apaga
  
  
}