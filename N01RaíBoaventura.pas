Program N01RaiBoaventura ;
{Feito por Ra� Boaventura
--------------------------------------------------------------------
FUP que leia uma lista de n�meros terminada pelo n�mero 0 e que,
para cada n�mero lido, mostre o pr�prio n�mero e a rela��o de seus
divisores.
--------------------------------------------------------------------}
var Ni, cont, Nf, Dmax:integer;

Begin
  write('Digite um n�mero inteiro terminado em 0: ');
  readln(Ni);
  
  clrscr;
  
  while (Ni mod 10<>0) do //Valida��o
  Begin
    Write('O n�mero digitado n�o � terminado em 0, digite um n�mero terminado em 0 => ');
    readln(Ni);
    clrscr
  End;
  
  Dmax:= Ni div 2;  //Divisor m�ximo
  
  writeln('N�mero lido: ', Ni);
  writeln('-----------------------');
  writeln('Divisores: ');
  
  if (Ni>0) then //Para descobrir os divisores de n�meros positivos
  begin
    for cont:= 1 to dmax do
    if Ni mod cont = 0 then
    begin
      Nf:=cont;
      writeln(nf);
    end;
    writeln(Ni); //Um n�mero X � divisor de X, ent�o inclui o pr�prio n�mero no final.
  end
  
  else
  if (Ni=0)then //Para quando o n�mero � zero
  writeln('Indefinido')
  
  else //Para descobrir os divisores de n�meros negativos
  begin //Feito com 2 for, pois deve-se lembrar que n�mero negativo pode ter divisor positivo
    writeln(Ni:5); //Um n�mero X � divisor de X, ent�o inclui o pr�prio n�mero.
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
    writeln(-Ni:5); //Um n�mero X � divisor de X, ent�o inclui o pr�prio n�mero.
  End;
  
  
  writeln('-----------------------');
  writeln('Digite Enter para finalizar o programa');
  readln
End.