// C++ code
//

int led = 6;
int button = 4;

//função executada somente uma vez
void setup()
{
  pinMode(led, OUTPUT);  //define as saídas digitais
  pinMode(button, INPUT); //entrada digital: 0V(LOW) ou 5V(HIGH)
}

void loop()
{
  int valor = digitalRead(button); //indicar qual porta voce esta lendo
  //sempre que fizer um read coloque um delay
  delay(50); //garantir estabilidade
  
  if(valor == HIGH)
    digitalWrite(led, HIGH);
  else
    digitalWrite(led, LOW);
}