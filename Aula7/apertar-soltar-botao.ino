// C++ code
//

int led = 6;
int button = 7;
int estado = 0; //0 = apagado, 1 = aceso
int cont = 0;

void setup()
{
  pinMode(led, OUTPUT);  
  pinMode(button, INPUT); 
}

void loop()
{
  int valor = digitalRead(button); //indicar qual porta voce esta lendo
  delay(50);
  
  if(valor == HIGH && cont == 0){
    estado = !estado; //se está apagado, acendeu se está aceso, apagou
    digitalWrite(led, estado);
    cont = 1;
  }
  else if(valor == LOW){ //o botão não está pressionado
    cont = 0; //se o botão não estiver pressionado (LOW) e o contador não for 0 (ele já acendeu o botão uma vez),
    //o contador deverá ser 0
  }
}