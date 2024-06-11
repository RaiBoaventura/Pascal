Program N01RaiBoaventura ;
{Feito por Raí Boaventura
--------------------------------------------------------------------
FUP que leia uma lista de números terminada pelo número 0 e que,
para cada número lido, mostre o próprio número e a relação de seus
divisores.
--------------------------------------------------------------------}
var Ni, cont, Nf, Dmax:integer;

Begin
  write('Digite um número inteiro terminado em 0: ');
  readln(Ni);
  
  clrscr;
  
  while (Ni mod 10<>0) do //Validação
  Begin
    Write('O número digitado não é terminado em 0, digite um número terminado em 0 => ');
    readln(Ni);
    clrscr
  End;
  
  Dmax:= Ni div 2;  //Divisor máximo
  
  writeln('Número lido: ', Ni);
  writeln('-----------------------');
  writeln('Divisores: ');
  
  if (Ni>0) then //Para descobrir os divisores de números positivos
  begin
    for cont:= 1 to dmax do
    if Ni mod cont = 0 then
    begin
      Nf:=cont;
      writeln(nf);
    end;
    writeln(Ni); //Um número X é divisor de X, então inclui o próprio número no final.
  end
  
  else
  if (Ni=0)then //Para quando o número é zero
  writeln('Indefinido')
  
  else //Para descobrir os divisores de números negativos
  begin //Feito com 2 for, pois deve-se lembrar que número negativo pode ter divisor positivo
    writeln(Ni:5); //Um número X é divisor de X, então inclui o próprio número.
    for cont:= dmax to -1 do
     if Ni mod cont = 0 then
     begin
      Nf:=cont;
      writeln(nf:5);
     end;
    
    dmax:=-dmax;
    
    for cont:= 1 to dmax do
     if Ni mod cont = 0 then
     begin
       Nf:=cont;
       writeln(nf:5);
     end;
    writeln(-Ni:5); //Um número X é divisor de X, então inclui o próprio número.
  End;
  
  
  writeln('-----------------------');
  writeln('Digite Enter para finalizar o programa');
  readln
End.