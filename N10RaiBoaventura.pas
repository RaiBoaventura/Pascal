Program N10RaiBoaventura ;
{1 – Todos os candidatos CLASSIFICADOS nos cargos em ordem alfabética ou, 2 – Todos os candidatos em
ordem de classificação por cargo ou, 3 – Todos os candidatos em ordem de classificação geral.
Dar as três opções para o usuário escolher uma}
//Feito por Raí Boaventura
USES TARDENOITE;
VAR ARQ:FILE OF REGIS;
ARQAux:text;
REG:REGIS;
VET:VETOR;
A,B,IND,PFI,TOTAL,n,err,CarINT,tot:INTEGER;
numstr,r,carnum:string;
cclStr,CarStr,clcStr,clgStr:string[4];
caraux:string;
Carg: array [1..12] of string[32];
Vagas:array [1..12] of integer;

Begin
  ASSIGN(ARQAux,'VAGAS.TXT');
  RESET(ARQAux);
  repeat
    writeln('1 - Todos os candidatos CLASSIFICADOS nos cargos em ordem alfabética ou, 2 - Todos os candidatos em ordem de classificação por cargo  ou, 3 - Todos os candidatos em ordem de classificação geral.');
    writeln('Digite numero: ');
    readln(r);
    if (r>'3') or (r<'1') then
    writeln('Número inválido');
  until (r<='3') and (r>='1');
  
  for A:=1 to 12 do
  begin
    readln(ARQAux,carg[a]);
    val(copy(carg[a],30,2),vagas[a],err);
    writeln(carg[a]:20);
  end;
  ASSIGN(ARQ,'CAND.IND');
  RESET(ARQ);
  
  
  WHILE (NOT EOF(ARQ)) DO
  BEGIN
    READ(ARQ,REG);
    IND:=IND+1;
    if (r = '1') then
    begin
      if(reg.ccl>0) then
      begin
        b:=b+1;
        vet[b].pf:=ind-1;
        str(reg.ccl:4,cclStr);
        vet[b].cc:= cclStr+reg.nome;
      end
    end
    else
    if (r = '2') then
    begin
      vet[ind].pf:=ind-1;
      str(reg.car:4,CarStr);
      insert(CarStr,vet[ind].cc,1);
      str(reg.clc:4,clcStr);
      insert(clcStr,vet[ind].cc,5);
    end
    else
    begin
      vet[ind].pf:=ind-1;
      str(reg.clg:4,clgStr) ;
      vet[ind].cc:=clgStr;
    end;;
  END;
  
  if(r='1') then
  ind:=B;
  ordem(VET,ind);
  TOT:=ind;
  ind:=0;
  Writeln('Pressione enter para continuar.');
  For a:=1 to tot do
  begin
    seek(arq,vet[a].pf);
    read(arq,reg);
    If(carint <> reg.car) and (r<'3') or ((ind mod 25)=0) then
    begin
      readln;
      clrscr;
      writeln;
      writeln;
      if(r<'3') then
      begin
        writeln('CARGO':10,reg.car:2,' - ',copy(carg[reg.car],3,25));
        writeln;
        if(r='1') then
        writeln('    ORD NUM NOME                          NASCIMENTO   CAR');
      end
      else
      begin
        writeln('   ORDEM DE CLAS. GERAL');
        writeln;
      end;
      if(r>'1') then
      writeln('   ORD NUM NOME                                  SOM  N4  N5  N3  N2  N6  N1 NASC.      CAR     OBSERVAÇÃO');
      if(carint <> reg.car) and (r<'3') then
      ind:=0;
      carint:=reg.car;
    end;
    
    ind:=ind+1;
    if(r='1') then
    writeln(ind:6,reg.num:5,' ',reg.nome,' ',reg.data.dia,'/',reg.data.mes,'/',reg.data.ano,reg.car:3)
    else
    begin
      write(ind:6,reg.num:5,' ',reg.nome,reg.som:4,reg.notas[4]:4,reg.notas[5]:4,	reg.notas[3]:4,reg.notas[2]:4,reg.notas[6]:4,reg.notas[1]:4,' ',reg.data.dia,
      '/',reg.data.mes,'/',reg.data.ano,reg.car:3,' ');
      if(reg.ccl>0) then
      writeln(' CLAS CAR = ', reg.ccl)
      else
      writeln;
    end;
  end;
  
  
  CLOSE(ARQ);
  CLOSE(ARQAux);
  
  termine;
End.