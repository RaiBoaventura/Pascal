Program N03RaiBoaventura;
{FUP que leia uma s�rie de datas, VALIDAR. O programa s� continua ap�s
ler uma data v�lida. Assim sendo, para cada validada lida, mostrar a data
lida como abaixo:
Leu 17 para o dia, 8 para o m�s e 2010 para o ano, mostrar:
CURITIBA, 17 DE AGOSTO DE 2010.
Usar um vetor de 12 posi��es para guardar o extenso dos meses.
O programa dever�, NECESSARIAMEMTE, usar os m�dulos da UNIT
tardenoite.pas, ENVIADA, para validar as datas lidas, ler dia, m�s e ano do
teclado e encerrar o programa. Ap�s mostrar a data com o extenso do
m�s, perguntar se quer continuar com as op��es 1 (SIM), outro n�mero
(N�O).}

//Feito por Ra� Boaventura
uses TARDENOITE;
var v:array[1..12] of string;
		d,m,a,n:integer;
		aux:boolean;

procedure ColetaData(var x,y,z:string; x1,y1,z1:integer);
	begin
 		write('Digite um dia: ');
 		LEIA(x,x1);
 		write('Digite um m�s: ');
 		LEIA(y,y1);
 		write('Digite um ano: '); //Anos de 1940 at� 2010
 		LEIA(z,z1);
	end;	 		
Begin
n:=1;
repeat
 clrscr;	
 v[1]:='Janeiro';
 v[2]:='Fevereiro';
 v[3]:='Mar�o';
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
 	  	writeln('DATA INV�LIDA');
	  	writeln('----------------------------'); 
			ColetaData(d1,m1,a1);
			valdata(d1,m1,a1);
			clrscr;	  
  	end;
  writeln('Curitiba, ',d1,' de ',v[m1],' de ',a1);
  writeln('Deseja encerrar? (1 para continuar. Para encerrar tecle um n�mero diferente de 1)');
	readln(n);  
 until (n<>1); 
End.