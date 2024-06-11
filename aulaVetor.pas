Program Pzim ;    //Exercício 2 e 3 lista Vetor e Matriz
uses TARDENOITE;
var	v:array[1..30] of integer;
		n,nPares:integer;
Begin
  //EXERCÍCIO 2
  {	for n:=1 to 30 do
  begin
    writeln(n);
    v[n]:=n;
  end;
  readln();
  writeln('----------------------------------');
  for n:=15 to 30 do
  begin
    v[n]:= n*5;
    writeln(v[n]);
  end;
  readln();
  
  //EXERCÍCIO 3
  writeln('----------------------------------');
  
  for n:=1 to 30 do
  begin
    if v[n]>120 then
    writeln(v[n]);
  end;
  
  readln();}
  
  for n:=1 to 6 do
  begin
    v[n]:=n;
    if v[n]mod 2=0 then
    	begin
    	  nPares:=nPares+1;
      	writeln('Os números pares são: ',v[n]);
      end;	
    end;
    writeln('A quantidade de pares é de ',nPares);
    readln();
End.