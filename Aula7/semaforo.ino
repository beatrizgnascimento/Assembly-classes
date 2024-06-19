// C++ code
//

int red = 12;
int yellow = 10;
int green = 6;

//função executada somente uma vez
void setup()
{
  pinMode(red, OUTPUT);  //define as saídas digitais
  pinMode(yellow, OUTPUT);
  pinMode(green, OUTPUT);
}

void loop()
{
  digitalWrite(red, HIGH);
  delay(2000);
  digitalWrite(red, LOW);
  digitalWrite(green, HIGH);
  delay(1000);
  digitalWrite(green, LOW);
  digitalWrite(yellow, HIGH);
  delay(500);
  digitalWrite(yellow, LOW);
}