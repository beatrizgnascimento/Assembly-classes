int pinoLed = 10;
int pinoButton = 7;
int estado = 0;
int valorLido = 0;
int cont = 0;

void setup(){
 	pinMode(pinoLed, OUTPUT);
  	pinMode(pinoButton, INPUT);
}

void loop(){
 valorLido = digitalRead(pinoButton);
  delay(10);
  
  if(valorLido == HIGH){
    cont++;
  	if(cont == 1){
      estado = !estado;}
  }
  else if(valorLido == LOW){
    cont = 0;}
    
  if(estado == 0){
    digitalWrite(pinoLed, LOW);}
  else{
  digitalWrite(pinoLed, HIGH);
  }
}