Program N08RaiBoaventura ;
{FUP atualize os campos das 6 notas e o campo soma das notas dos registros do arquivo CAND.IND,
 dos candidatos presentes. Antes, executar o programa MARCAFALTAS.PAS, (atualiza o campo reg.falta 
 com 1) enviado. Para atualizar as notas, utilize o arquivo NOTAS.TXT, criado pelo “terceiro” 
 (usando o arquivo “PROVA.TXT”). Antes de encerrar, mostrar a média das 6 disciplinas, 
 CONFORME ABAIXO:
}
uses tardenoite;
var
    //arquivos
    arq: file of regis;
    reg: regis;
    nota: text;
    //outras
    notaaux: string;
    vet: vetor;
    a,b,c, posiv, np, ii, tot, tc, tt, cont, contaux,nit,e,sn: integer;
    numa, num: string[4];
    notas1: array[1..6] of string[2];
    notas2: array[1..6] of integer;
    acumulador:array [1..3000] of integer;

const
materia:array [1..6] of string = ('L.E.M','Mat','Lógica','COnhecimentos espc', 'Informática', 'Atualidades') ;
    
Begin                        ;
  assign(arq, 'cand.ind');
  assign(nota, 'notas.txt');
  reset(arq);
  reset(nota);
    //o arquivo falta soh possui o num de inscr, logo o acesso serah por num
    //monta o vetor pelo num de insc
  repeat
      read(arq, reg);
      ii := ii + 1;          //ii=indice do vetor
      vet[ii].pf := a;    //a=posicao fisica do registro no arquivo
      str(reg.num, num);
      tc := length(num);
      for b := 1 to 4 - tc do
          insert('0', num, 1);  //insere zeros a esquerda para ficar compativel com o numero lido em faltas
      vet[ii].cc := num;
      A := A + 1;
  until (eof(arq));
  //fim da montagem
  tot := ii;
  writeln(' PRIMEIROS 15 ELEMENTOS ANTES DA ORDENACAO. CC E PF');
  for a := 1 to 15 do
      writeln(' ', vet[a].cc, '  ', vet[a].pf:5);
  writeln(' inicio da ordenacao');
  ordem(vet, ii);
  writeln(' fim da ordenação');
  writeln(' PRIMEIROS 15 ELEMENTOS DO VETOR DEPOIS DA ORDENACAO. CC E PF');
  for a := 1 to 15 do
      writeln(' ', vet[a].cc, '  ', vet[a].pf:5);

  while not eof(nota) do
  begin
      read(nota, notaaux);
      numa := copy(notaaux,1,4);
      contaux := contaux + 1;
      pebin1(vet, numa, ii, posiv);
      seek(arq, vet[posiv].pf);
      for c := 1 to 6 do
      begin
          notas1[c] := copy(notaaux, (7 + 4 * (c - 1)), 2);
          val(notas1[c], notas2[c], b);
          acumulador[c]:=acumulador[c]+notas2[c];
      end;
      read(arq, reg);
      for c := 1 to 6 do
      begin
          reg.notas[c] := notas2[c];
          reg.som := reg.som + notas2[c];
      end;
      seek(arq, vet[posiv].pf);
      write(arq, reg);
  tt:=tt+1;    
  end;
  close(arq);
  close(nota);
  for c:=1 to 6 do
  clrscr;
  writeln('Quantidade de candidatos: ',tt);
  	for c:=1 to 6 do
  	begin
  		write('Matéria: ',materia[c],'    Média: ',(acumulador[c]/tt):1:2);
  		writeln
  	end;	
  termine;
End.