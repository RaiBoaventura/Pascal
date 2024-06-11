Program N06RaiBoaventura ;
{VERSAO COM ALGUMAS MELHORAS....
FUP QUE LEIA DO TECLADO:
NUMERO=4 CARAC, NOME=35 CARAC, CPF=11 CARAC, DIA E MES=2 CARAC, ANO=4 CARAC e CARGO=2 CARAC
E GERE UM ARQUIVO DE ACESSO SEQUENCIAL "AQUIVO1.TXT" COM TODAS AS INFORMAÇÕES LIDAS, OU SEJA 
UM REGISTRO COM 60 CARAC, NUMERO LIDO = 0, ENCERRA A LEITURA
}
//Feito por Raí Boaventura
USES TARDENOITE;
procedure valCPF(var inputCPF:string);
var contador,soma,resto,num,code,j,k:integer;
cpf:array[1..11] of integer;
cpfValido:boolean;

Begin
repeat
  write('CPF=>');
  readln(inputCPF);
  val(inputCPF,num,code);
    repeat
      if length(inputCPF)<>11 then
      repeat
        clrscr;
        write('O CPF digitado não tem 11 dígitos, digite um CPF válido: ');
        readln(inputCPF);
        val(inputCPF,num,code);
      until length(inputCPF)=11;
      
      if (code<>0) then
      repeat
        clrscr;
        write('ERRO. Não digite letras ou símbolos, apenas números: ');
        readln(inputCPF);
        val(inputCPF,num,code);
      until (code=0);
      
    until (code=0) and (length(inputCPF)=11);
    
    for contador:=1 to 11 do
    begin
      val(inputCPF[contador],num,code);
      cpf[contador]:= num;
    end;
    
    for contador:=1 to 9 do
    soma:=soma+(cpf[contador]*(11-contador));
    resto:=soma mod 11;
    if (resto=1) or (resto=0) then
    j:=0
    else
    j:=11-resto;
    
    soma:=0;
    resto:=0;
    for contador:=1 to 10 do
    soma:=soma+(cpf[contador]*(12-contador));
    resto:=soma mod 11;
    if (resto=1) or (resto=0) then
    k:=0
    else
    k:=11-resto;
    
    clrscr;
    if (cpf[10]<>j) and (cpf[11]<>k) then
    begin
    	writeln('CPF inválido');
    	cpfValido:=false;
    end	
    else
			cpfValido:=true;

write(cpfValido);  
until cpfValido
End;

VAR REGIS:STRING[60];
    ARQ:TEXT;//NOME LOGICO DO ARQUIVO TIPO TEXTO, JÁ QUE O REGISTRO SERÁ UM STRING[60]
    NUM,ANO:STRING[4];
    DIA,MES,CAR:STRING[2];
    NOME:STRING[35];
    CPF:STRING[11];
    A,B,NI,E,d,m,an,auxDia,er,auxMes,auxAno,auxCar,auxNome:INTEGER;
    TOTC:INTEGER;//PARA GUARDAR O TOTAL DE CARACTERES
    CHAVE,ChaveCPF,aux:BOOLEAN;


Begin
//QUANDO TRABALHAR COM ARQUIVOS, LIGAR O NOME LÓGICO AO FISICO E ABRIR O ARQUIVO...
//E ABRIMOS O ARQUIVO UTILIZANDO O APPEND
   ASSIGN(ARQ,'ARQUIVO1.TXT');
   APPEND(ARQ);
//VALIDAR O NUMERO
   REPEAT
	  WRITE('NUM=>');
    READLN(NUM);
    VAL(NUM,NI,E);//ENTREGA O STRING NUM E RECEBE OS INTEIROS NI e E
    IF (E<>0)THEN
     WRITELN('CARACTER NAO NUMERICO');
   UNTIL(E=0);
//FIM DA VALIDACAO
   WHILE (NI>0) DO
    BEGIN
//GARANTIR QUE O CAMPO NUM TENHA 4 DIGITOS
     TOTC:=LENGTH(NUM);
     FOR A:=1 TO 4 - TOTC DO//LENGTH(NUM) DEVOLVE O TOTAKL DE CARACTRES NO STRING NUM
      INSERT('0',NUM,1);
     repeat 
		  WRITE('NOM=>');
      READLN(NOME);
      NOME:=UPCASE(NOME);//TRANSFORMA STRING EM MAIUSCULO
      val(nome,auxNome,er);
      if (er<>1) then
      	writeln('Digite um nome com caracteres, não números');
     until(er=1);
//GARANTIR QUE O NOME TENHA 35 CARACTERES
		 TOTC:=LENGTH(NOME);
		 FOR A:=TOTC+1 TO 35 DO
		  INSERT(' ',NOME,TOTC+1);
		  
     WRITE('CPF=>');
     readln(CPF);
     valCPF(CPF);
		 	  	
     while (not chave) or ((length(dia)<>2) or (length(mes)<>2)) do
     begin
      WRITE('DIA=>');
      READLN(DIA);
       val(dia,auxDia,er);
       
      WRITE('MES=>');
      READLN(MES);
       val(mes,auxMes,er);
     
      WRITE('ANO=>');
		  READLN(ANO);
		   val(ano,auxAno,er);
		  
		  valdatapro(auxDia,auxMes,auxAno,chave);
			if (not chave) then
				writeln('Data inválida, digite novamente');
			if (length(dia)<>2)	or (length(mes)<>2) then
				writeln('ERRO. Digite a data e mês com DOIS dígitos. (Ex:01,02,03...)');
		 end;
		 while (length(car)<>2) or ((auxCar>12) or (auxCar<1)) do 
		 begin
		  WRITE('CARGO=>');
		  READLN(CAR);
		   val(car,auxCar,er);
		  if (auxCar>12) or (auxCar<1) then
				writeln('CARGO INVÁLIDO. Digite um cargo entre 01 e 12');
			if (length(car)<>2) then
				writeln('ERRO. Digite sempre DOIS dígitos. (Ex:01,02,03...)');	 
		 end;
		 REGIS:=NUM+NOME+CPF+DIA+MES+ANO+CAR;
//VALIDAR O NUMERO
     REPEAT
	    WRITE('NUM=>');
      READLN(NUM);
      VAL(NUM,NI,E);//ENTREGA O STRING NUM E RECEBE OS INTEIROS NI e E
      IF (E<>0)THEN
       WRITELN('CARACTER NAO NUMERICO');
     UNTIL(E=0);
//FIM DA VALIDACAO
		END;
	 CLOSE(ARQ);
	 TERMINE; 
End.