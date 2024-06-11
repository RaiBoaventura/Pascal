Program N09RaiBoaventura;
// FUP que atualize os campos CLG (classifica??o geral), CLC (classifica??o no cargo) e
// CCL (cargo de classifica??o) no arquivo CAND.IND, conforme crit?rios da folha anterior.
// Feito por Raí Boaventura

uses tardenoite;


VAR REG:REGIS;
ARQ:FILE OF REGIS;
A,aux,Cont,DataCand,ERR,ind,total,t:integer;
DataCandAux:STRING[6];
CarP:array [1..12] of integer;
Cargo:array [1..12] of string [32];
vagas,CLC:array [1..12] of integer;
VET:VETOR;
ARQAux:text;
notas:array [1..6] of string[3];
soma:string [3];
DiaAux:string [8];


const cargos:array [1..12] of string[22]=
('ENGANADOR DE CHEFE','ENROLADOR DE TRABALHO','PENSADOR','ANALISTA DE SISTEMAS','DEGUSTADOR DE CERVEJA','TECNICOEM REDES','CONTADOR DE ESTORIAS','PEDREIRO DE PRIMEIRA','ACOUGUEIRO LIMPINHO','SEGURANCA DE BANHEIR','GESTOR DE BORBOLETAS','AGENTE LEVA E TRAZ');


Begin
  ASSIGN(ARQAux,'VAGAS.TXT');
  RESET(ARQAux);
  FOR A:=1 TO 12 DO
  Begin
    READLN(ARQAux,CARGO[A]);
    VAL(COPY(CARGO[A],30,2),VAGAS[A],ERR);
  End;
  ASSIGN(ARQ,'CAND.IND');
  RESET(ARQ);
  WHILE NOT(EOF(ARQ)) DO
  Begin
    READ(ARQ,REG);
    IND:=IND+1;
    VET[IND].PF:=IND-1;
    if(reg.som<>1) then
    Begin
      insert(reg.data.dia,DiaAux,1);
      insert(reg.data.mes,DiaAux,1);
      insert(reg.data.ano,DiaAux,1);
      val(DiaAux,DataCand,ERR);
      DataCand:=20241230-DataCand;
      str(DataCAnd,DataCandAux);
      for A:=1 to 6 dO
      	str(reg.notas[A],notas[A]);
      str(reg.som,soma);
      vet[ind].cc:=soma+notas[4]+notas[5]+notas[3]+notas[2]+notas[6]+notas[1]+DataCandAux;
    End
    else
    vet[ind].cc:='0  0  0  0  0  0  0      0';
  End;
  total := ind;
  writeln('Enter para continuar o programa');
  readln;
  writeln('Aguarde...');
  ordem(vet,total);
  t:=0;
  for A:=total downto 1 do
  Begin
    t:=t+1;
    seek(arq,vet[A].pf);
    read(ARQ,REG);
    cont:=reg.car;
    clc[cont]:=clc[cont]+1;
    reg.clg:=t;
    reg.clc:=clc[cont];
    if(clc[cont] <= vagas[cont]) then
    Begin
      reg.ccl:=cont;
      CarP[reg.car]:=carP[reg.car]+1;
    end;
    seek(ARQ,vet[A].pf);
    write(ARQ,REG);
  End;
  CLOSE(ARQ);
  CLOSE(ARQAux);
  clrscr;
  writeln('  Campos atualizados!');
  writeln;
  writeln('  Lidos',T:5,' registros.');
  writeln;
  for A:=1 to 12 do
  	writeln('  Cargo ',A:2,' - ',CARGOS[A],' => ',CarP[A]:2,' vagas disponiveis');
  writeln;
  termine;
End.