Program CORRPRO02 ;
{Faça um programa que leia as respostas de uma prova de múltipla escolha de 6 (seis) disciplinas, 
constantes no arquivo de acesso sequencial tipo texto “prova.txt” (no anexo), 
cada registro é um string[64] e é composto por:
01-04    = número do candidato
05-64    = as sessenta respostas da prova, assim divididas;
05 – 09 = respostas da disciplina 1 (05 questões);
10 – 19 = respostas da disciplina 2 (10 questões);
20 – 29 = respostas da disciplina 3 (10 questões);
30 – 49 = respostas da disciplina 4 (20 questões);
50 – 59 = respostas da disciplina 5 (10 questões);
60 – 64 = respostas da disciplina 6 (05 questões);
}
USES TARDENOITE;
VAR ARQ:TEXT;
    REG:STRING[64];
    GABA:STRING[60];
    CE,ER,BR:ARRAY[1..6] OF INTEGER;
		A,B,TG,ERG,C,INI,FIM:INTEGER;
    NOTA:ARRAY[1..6] OF INTEGER;
CONST
    QUES:ARRAY[1..6] OF INTEGER = (5,10,10,20,10,05);
Begin
 ASSIGN(ARQ,'PROVA.TXT');
 RESET(ARQ);//ABRE PARA LEITURA
 REPEAT//VALIDA O GABARITO QUE SERAH LIDO
  ERG:=0;
	WRITELN('DIGITE O GABARITO');
  WRITELN('000000000111111111122222222223333333333444444444455555555556');
  WRITELN('123456789012345678901234567890123456789012345678901234567890');
  READLN(GABA);
	TG:=LENGTH(GABA);
	IF(TG<60)THEN
	 BEGIN
	  WRITELN('ILEGAL MENOS DE 60');
	  ERG:=1;
	 END
	ELSE
   REPEAT
    A:=A+1;
	  IF(GABA[A]<'A') OR (GABA[A]>'E')THEN
	   BEGIN 
	    WRITELN('GABARITO DIGITADO ILEGAL');
	    ERG:=1;
	   END;
	 UNTIL(ERG=1) OR (A=60);
 UNTIL (ERG=0) ;
//INICIO DA LEITURA
 WHILE(NOT EOF(ARQ)) DO
  BEGIN
   READLN(ARQ,REG);
//INICIO DA CORRECAO
//COMO CONTADORES SÃO INDIVIDUAIS (CE,ER,BR) TEM QUE ZERAR
//PARA 6 DISCIPLINAS
  INI:=1;
	FOR B:=1 TO 6 DO
	 BEGIN
	  CE[B]:=0;
    ER[B]:=0;
    BR[B]:=0;
    FIM:=INI+QUES[B]-1;
    FOR A:= INI TO FIM DO
    IF(GABA[A]=REG[A+4])THEN //ACERTOU SE VERDADE
     CE[B]:=CE[B]+1
    ELSE
     IF(REG[A+4]=' ')THEN  //DEIXOU DE RESPONDER SE VERDADE    
      BR[B]:=BR[B]+1
     ELSE    // SO PODE TER ERRADO
      ER[B]:=ER[B]+1;
//CALCULA A NOTA
    NOTA[B]:=CE[B]*(100 DIV QUES[B]);
    INI:=INI+QUES[B];
   END;
   IF(C MOD 25) = 0	THEN
	  BEGIN
	   WRITELN('ENTER PARA CONTINUAR');
		 READLN;
		 CLRSCR;
		 WRITE('NUME ');
		 FOR A:=1 TO 6 DO 
		  WRITE('  NOT',A,' CER BRA ERR');
		 WRITELN;
		END;
	 WRITE(COPY(REG,1,4));
	 FOR A:=1 TO 6 DO
	  WRITE(NOTA[A]:6,CE[A]:4,BR[A]:4,ER[A]:4);
	 WRITELN;
	 C:=C+1;
	END;	 
       
 TERMINE
End.               