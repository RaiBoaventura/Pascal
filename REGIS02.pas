Program REGIS02 ;
//FEITO PELO AMADISSSIMO ALUNO MANOEL
{F U P QUE LEIA UMA SERIE DE NOMES(MAX 35 CARACTERES) COM AS RESPECTIVAS NOTAS, ENCERRADA 
POR NOME =FIM. APOS O TERMINO DA LEITURA MOSTRAR OS NOMES COM AS RESPECTIVAS NOTAS EM 
ORDEM DECRESCENTE DE NOTAS. MAX 100 NOMES-------USAR CONCEITO DE R E G I S T R O}
USES TARDENOITE;
 TYPE
  NONO=RECORD
    NOME:STRING[35];
    NOTA:INTEGER;
   END;
VAR VET:ARRAY[1..100] OF NONO;
    A,B,C,TOT,NTL:INTEGER;
    AUX:NONO;
    NOL:STRING[35];
    TROCA:BOOLEAN;
BEGIN
 WRITE('NOME=>');
 READLN(NOL);
 NOL:=UPCASE(NOL) ;
 WHILE(NOL<>'FIM') DO
  BEGIN
   C:=C+1;
	 VET[C].NOME:=NOL;
	 LEIA('NOTA=>',NTL);
	 VET[C].NOTA:=NTL;
   WRITE('NOME=>');
   READLN(NOL);
   NOL:=UPCASE(NOL) ;
	END;
//ORDENA��O
 TOT:=C;
 REPEAT
  TROCA:=TRUE;
	TOT:=TOT-1;
	FOR A:=1 TO TOT DO
	 IF(VET[A].NOTA>VET[A+1].NOTA)THEN
	  BEGIN
		 AUX:=VET[A];
		 VET[A]:=VET[A+1];
		 VET[A+1]:=AUX;
		 TROCA:=FALSE;
		END;
 UNTIL TROCA;
//FIM DA ORDENA��O
 FOR B:=C DOWNTO 1 DO
  WRITELN(VET[B].NOME:50,'  ',VET[B].NOTA:4);
 TERMINE;
END. 