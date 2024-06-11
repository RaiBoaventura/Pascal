Program N07RaiBoaventura ;
{FUP que possibilite mostrar os dados (veja leinddir.pas) do arquivo CAND.IND em ordem :
1 – Inscrição ou, 2 – Alfabética ou, 3 – Cpf ou, 4 - Cargo e alfabética dentro do cargo.
 Dar as quatro opções para o usuário escolher uma delas.
(VER O PROGRAMA LISTANASCI.PAS)}
//Feito por Raí Boaventura
USES TARDENOITE;
VAR ARQ:FILE OF REGIS;
REG:REGIS;
VET:VETOR;
A,B,IND,PFI,TOTAL,n:INTEGER;
numstr,r,carnum:string;
caraux:string;
Begin
	repeat
		writeln('1 - Inscrição ou, 2 - Alfabética ou, 3 - Cpf ou, 4 - Cargo e alfabética dentro do cargo.');
  	writeln('Digite numero: ');
  	readln(r);
  	if (r>'4') or (r<'1') then
  		writeln('Número inválido');
  until (r<='4') and (r>='1');	
  ASSIGN(ARQ,'CAND.IND');
  RESET(ARQ);
  //PRIMEIRO, PARA ACESSAR O ARQUIVO EM UMA DETERMINADA ORDEM, QUE NÃO SEJA A SEQUENCIAL,
  //NECESSARIAMENTE PRECISO PRIMEIRO
  //LER O ARQUIVO SEQUENCIALMENTE DO PRIMEIRO AO ULTIMO REGISTRO, CRIANDO UM VETOR COM
  //DUAS INFORMAÇÕES POR ÍNDICE:
  //A POSICAO FISICA DO REGISTRO DENTRO DO ARQUIVO +
  //O CAMPOS PELO QUAL QUERO ACESSAR OS REGISTROS DO ARWUIVO.
  WHILE (NOT EOF(ARQ)) DO
  BEGIN
    READ(ARQ,REG);
    IND:=IND+1;
    VET[IND].PF:=PFI;      //COLOCA A POSICAO FISICA NO VETOR
    if (r = '1') then
    begin
    	str(reg.num:4,numstr);
    	vet[ind].cc:= numstr;
    end
    else
    if (r = '2') then
    	VET[IND].CC:=REG.nome
    else
    if (r = '3') then
      vet[ind].cc:=	reg.cpf
    else
    if (r = '4') then
    begin
      str(reg.car:4,carnum);
      vet[ind].cc:=carnum;
      caraux:=carnum + reg.nome;
    		vet[ind].cc:=caraux;
    end;
    
    PFI:=PFI+1;
  END;
  //MONTADO O VETOR ORDENAMOS...
  WRITELN('LIDOS=',IND:5,' REGISTROS');
  FOR A:=1 TO 20 DO
  WRITELN(A:5,VET[A].PF:5,' ',VET[A].CC);
  TOTAL:=IND;
  ORDEM(VET,TOTAL);
  FOR A:=1 TO 20 DO
  WRITELN(A:5,VET[A].PF:5,' ',VET[A].CC);
  WRITELN('ENTER PARA CONTINUAR');
  READLN;
  
  //MOSTRA O CONTEUDO DO ARQUIVO USANDO COMO REFERENCIA O CAMPO PF, DO VETOR ORDENADO
  FOR B:=1 TO TOTAL DO
  BEGIN
    SEEK(ARQ,VET[B].PF);//POSICIONA NO ARQ NA POSICAO INDICADA PELO CAMPO pf DO VETOR ORDENADO
    READ(ARQ,REG);
    //LINHA DETALHE
    IF((B-1) MOD 25 = 0)THEN
    BEGIN
      READLN;
      CLRSCR;
      WRITELN;
      write('  ORD  NUM N O M E                             ===C P F=== NASCIMENTO CS  N1');
      WRITELN('  N2  N3  N4  N5  N6   SO   CG  CC CV FA');
    END;
    WRITE(B:5,REG.NUM:5,' ',REG.NOME,' ',REG.CPF,' ',REG.DATA.DIA,'/',REG.DATA.MES,'/',REG.DATA.ANO,REG.CAR:3);
    FOR A:=1 TO 6 DO                                                    
    WRITE(REG.NOTAS[A]:4);
    WRITELN(REG.SOM:5,REG.CLG:5,REG.CLC:4,REG.CCL:3,REG.FALTA:3);
  END;
  TERMINE;
End.