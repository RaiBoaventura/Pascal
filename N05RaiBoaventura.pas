Program N05RaiBoaventura;
{Fa�a um programa que leia uma s�rie de no m�ximo 50 nomes (30 caracteres), com as respectivas notas de 
uma disciplina qualquer (vai ler o nome e depois a nota do nome lido) encerrada por nome igual a �FIM�
(que n�o deve fazer parte da lista), colocando-os (nome e nota) em um vetor (usar o conceito de 
registro). Ap�s o encerramento da leitura, mostrar os nomes lidos com as respectivas notas, menores 
ou iguais a LUIZ SALGADO, em ordem alfab�tica crescente (A � menor ou igual a LUIZ SALGADO)
e os nomes maiores que LUIZ SALGADO, em ordem alfab�tica decrescente (Z � menor que LUIZ SALGADO).}
//Feito por Ra� Boaventura
uses TARDENOITE;
   type
   NomeNota=record
   	Nome:string[30];
   	Nota:integer;
   end;
var vetor:array[1..50] of NomeNota;
		n:string[30]; 
		c,c1,c2,nt,tot,tot1:integer;
		chave,chave1:boolean;
		aux:NomeNota;
		
Begin
 write('Nome: ');  
 readln(n);
 n:=upcase(n);
 c:=1;
 while(n<>'FIM') do
 	begin
 	c:=c+1;
 	vetor[c].Nome:=n; 
 	leia('Nota: ', nt);
 	vetor[c].Nota:=nt;
 	clrscr;
 	write('Nome: ');
 	readln(n);
 	n:=upcase(n);
 	end;

  vetor[1].Nome:='LUIZ SALGADO';
  vetor[1].Nota:=50;
//ordena��o por nota 	
	tot:=c;
 	repeat
 		chave:=true;
 		tot:= tot-1;
 		for c1:= 1 to tot do
 			if (vetor[c1+1].nota>vetor[c1].nota)then
 				begin
 				 aux:=vetor[c1];
 				 vetor[c1]:=vetor[c1+1];
 				 vetor[c1+1]:=aux;
 				 chave:=false;
 				end; 
 until chave;
 clrscr;
 writeln('Ordena��o por nota');
 for c2:=c downto 1 do
 	writeln(vetor[c2].nome:5,' ', vetor[c2].nota:2);
 	writeln('---------------------');
 	
 //ordena��o por nome 	
	tot:=c;
 	repeat
 		chave:=true;
 		tot:= tot-1;
 		for c1:= 1 to tot do
 			if (vetor[c1+1].nome>vetor[c1].nome)then
 				begin
 				 aux:=vetor[c1];
 				 vetor[c1]:=vetor[c1+1];
 				 vetor[c1+1]:=aux;
 				 chave:=false;
 				end; 
 until chave;	
 
 writeln('Ordena��o por nome');	
 for c2:=c downto 1 do
 	writeln(vetor[c2].nome:5,' ', vetor[c2].nota:2);
 writeln('------------------------------');	
 	termine;
End.