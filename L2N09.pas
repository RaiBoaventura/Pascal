Program l2n09 ;
{9.	FUP que verifica se um n�mero inteiro lido com oito d�gitos (ABCDEFGH) � v�lido ou n�o. 
A regra para verificar se o n�mero lido � v�lido ou n�o � a descrita: o d�gito H � chamado 
de digito verificador do n�mero lido. Calcular a SOMA de (8*A) + (7*B) + (6*C) + (5*D) + 
(4*E) + (3*F) + (2*G). Calcular o RESTO da divis�o da soma por 11, ou seja, 
RESTO = SOMA mod 11. O D�gito Verificador Calculado ser� igual 11 menos o RESTO, ou seja, 
DVC = 11 � RESTO, observando ainda que, se DVC = 11 ou 10, fazer DVC = 1. Se DVC = H, 
mostrar o n�mero lido e o DVC com a mensagem, v�lido, caso contr�rio, mostrar o n�mero 
lido com a mensagem, inv�lido.  }
USES TARDENOITE;
VAR VET:ARRAY[1..8] OF INTEGER;
    NUM:STRING[8];
    SOMA,RESTO,DVC,A,M,ERR:INTEGER;
Begin
  WRITE('DIGITE O NUM COM 8 DIGITOS=>');
  READLN(NUM);//LE COMO STRING[8]
  FOR A:=1 TO 8 DO
   VAL(NUM[A],VET[A],ERR);
  M:=9;
  FOR A:=1 TO 7 DO
   BEGIN
    M:=M-1;
    SOMA:=SOMA+VET[A]*M;
   END;
  RESTO:=SOMA MOD 11;
  DVC:=11-RESTO;
  IF(DVC>9)THEN
   DVC:=1;
  IF(DVC=VET[8])THEN
   WRITELN(NUM,' DIGITO CALCULADO=',DVC,' VALIDO')
  ELSE
   WRITELN(NUM,' DIGITO CALCULADO=',DVC,' INVALIDO, ERRADO, COM PROBLEMAS');
  TERMINE;
End.