Program Pzim ;
uses TARDENOITE;
var a: array[1..11] of integer;
c,b: integer;
cpf:String;


procedure ValCPF(x:string);
begin
  if length(x)<>11 then
  begin
    repeat
      write('CPF inv�lido, digite um CPF v�lido: ');
      readln(x);
    until length(x)=11;
  end;
end;

Begin
  write('Digite um CPF: ');
  readln(cpf);
  ValCPF(cpf);
  readln;
  clrscr;
  for c:=0 to 8 do //validar digito j
  begin
    a[c]:= a[c]*(11);
  end;
  
  write(a[c]);
  readln();
  
End.