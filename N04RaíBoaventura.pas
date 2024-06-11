Program N04RaiBoaventura ;
{Fa�a um programa que leia uma s�rie de CPF�s e informe se o CPF lido � v�lido ou
n�o. CPF �00000000000� (onze zeros) encerra o programa. Use o exerc�cio 10 da 
lista 2 (enviado) como refer�ncia. Garantir que sejam digitados 11 d�gitos (validar).}
//Feito por Ra� Boaventura
uses TARDENOITE;
var inputcpf:string;
contador,soma,resto,num,code,j,k:integer;
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
        write('O CPF digitado n�o tem 11 d�gitos, digite um CPF v�lido: ');
        readln(inputCPF);
        val(inputCPF,num,code);
      until length(inputCPF)=11;
      
      if (code<>0) then
      repeat
        clrscr;
        write('ERRO. N�o digite letras ou s�mbolos, apenas n�meros: ');
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
    	writeln('CPF inv�lido');
    	cpfValido:=false;
    end	
    else
			cpfValido:=true;

write(cpfValido);  
until cpfValido
End.