Program N03RaiBoaventura;
{FUP que leia uma série de datas, VALIDAR. O programa só continua após
ler uma data válida. Assim sendo, para cada validada lida, mostrar a data
lida como abaixo:
Leu 17 para o dia, 8 para o mês e 2010 para o ano, mostrar:
CURITIBA, 17 DE AGOSTO DE 2010.
Usar um vetor de 12 posições para guardar o extenso dos meses.
O programa deverá, NECESSARIAMEMTE, usar os módulos da UNIT
tardenoite.pas, ENVIADA, para validar as datas lidas, ler dia, mês e ano do
teclado e encerrar o programa. Após mostrar a data com o extenso do
mês, perguntar se quer continuar com as opções 1 (SIM), outro número
(NÃO).}

//Feito por Raí Boaventura
uses TARDENOITE;
var v:array[1..12] of string;
		d,m,a,n:integer;
		aux:boolean;

procedure ColetaData(var x,y,z:string; x1,y1,z1:integer);
	begin
 		write('Digite um dia: ');
 		LEIA(x,x1);
 		write('Digite um mês: ');
 		LEIA(y,y1);
 		write('Digite um ano: '); //Anos de 1940 até 2010
 		LEIA(z,z1);
	end;	 		
Begin
n:=1;
repeat
 clrscr;	
 v[1]:='Janeiro';
 v[2]:='Fevereiro';
 v[3]:='Março';
 v[4]:='Abril';
 v[5]:='Maio';
 v[6]:='Junho';
 v[7]:='Julho';
 v[8]:='Agosto';
 v[9]:='Setembro';
 v[10]:='Outubro';
 v[11]:='Novembro';
 v[12]:='Dezembro';
 ColetaData(d,m,a,d1,m1,a1);
 valdata(d1,m1,a1);
 clrscr;
 	while (not valdata(d1,m1,a1)) do
  	begin
 	  	writeln('DATA INVÁLIDA');
	  	writeln('----------------------------'); 
			ColetaData(d1,m1,a1);
			valdata(d1,m1,a1);
			clrscr;	  
  	end;
  writeln('Curitiba, ',d1,' de ',v[m1],' de ',a1);
  writeln('Deseja encerrar? (1 para continuar. Para encerrar tecle um número diferente de 1)');
	readln(n);  
 until (n<>1); 
End.