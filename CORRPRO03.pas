Program CORRPRO03 ;
{Fa�a um programa que leia as respostas de uma prova de m�ltipla escolha de 6 (seis) disciplinas, 
constantes no arquivo de acesso sequencial tipo texto �prova.txt� (no anexo), 
cada registro � um string[64] e � composto por:
01-04    = n�mero do candidato
05-64    = as sessenta respostas da prova, assim divididas;
05 � 09 = respostas da disciplina 1 (05 quest�es);
10 � 19 = respostas da disciplina 2 (10 quest�es);
20 � 29 = respostas da disciplina 3 (10 quest�es);
30 � 49 = respostas da disciplina 4 (20 quest�es);
50 � 59 = respostas da disciplina 5 (10 quest�es);
60 � 64 = respostas da disciplina 6 (05 quest�es);
Ap�s ler o registro, o programa dever� corrigir a prova do candidato, por disciplina e 
gravar o n�mero do candidato e as notas das 6 (seis) disciplinas no arquivo de acesso 
sequencial tipo texto �notas.txt�, cujo registro ser� um string[28]. 
A nota m�xima de cada uma das 6 (seis) disciplinas  � 100. 
Os registros de �notas.txt� devem ficar como abaixo
01 � 04 = n�mero do candidato
05 � 08 = nota da disciplina 1;
09 � 12 = nota da disciplina 2;
13 � 16 = nota da disciplina 3;
17 � 20 = nota da disciplina 4;
21 � 24 = nota da disciplina 5;
25 � 28 = nota da disciplina 6;
Ou seja:
0002  40   0   0  30  45  50
0003  50  10  10  25  45  40
............................
}
USES TARDENOITE;
VAR ARQ,ARQ1:TEXT;
    REG:STRING[64];
    REG1:STRING[28];
    GABA:STRING[60];
    CE,ER,BR:ARRAY[1..6] OF INTEGER;
		A,B,TG,ERG,C,INI,FIM:INTEGER;
    NOTA:ARRAY[1..6] OF INTEGER;
    NOAL:STRING[4];
CONST
    QUES:ARRAY[1..6] OF INTEGER = (5,10,10,20,10,05);
Begin
 ASSIGN(ARQ,'PROVA.TXT');
 RESET(ARQ);//ABRE PARA LEITURA
 ASSIGN(ARQ1,'NOTAS.TXT');
 REWRITE(ARQ1);
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
//COMO CONTADORES S�O INDIVIDUAIS (CE,ER,BR) TEM QUE ZERAR
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
      CE[B]:=CE[B]+1;
//CALCULA A NOTA
    NOTA[B]:=CE[B]*(100 DIV QUES[B]);
    INI:=INI+QUES[B];
   END;
//MONTA O REGISTRO DE 28 CARACTERES PARA GRAVAR EM NOTAS.TXT
//PRIMEIRO TRANSF AS NOTAS INTEGER EM STRING DE 4
  REG1:=COPY(REG,1,4);
  FOR A:=1 TO 6 DO
   BEGIN
    STR(NOTA[A]:4,NOAL);
    REG1:=REG1+NOAL;
   END;
  WRITELN(ARQ1,REG1);
	END;	     
 TERMINE;
 CLOSE(ARQ);
 CLOSE(ARQ1);
END.