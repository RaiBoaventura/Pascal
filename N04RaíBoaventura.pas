Program N04RaiBoaventura ;
{Faça um programa que leia uma série de CPF’s e informe se o CPF lido é válido ou
não. CPF “00000000000” (onze zeros) encerra o programa. Use o exercício 10 da 
lista 2 (enviado) como referência. Garantir que sejam digitados 11 dígitos (validar).}
//Feito por Raí Boaventura
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
End.