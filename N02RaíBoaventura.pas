Program N02RaiBoaventura ;
	uses TARDENOITE;
	var d,m,a,d1,m1,a1,diamax:integer;
			sai, aux,anobissexto:boolean;
	
 procedure validacao(var x,y,z:integer);
begin 
	if sai then
  		begin
  		   writeln('----------------------------------------------------------------');
			   writeln('Pressione enter para continuar o programa. ');
			   readln();
			   clrscr;
  		end   
 	 		else
//----------------------------------------------------------------------------------------------------- Validar ano  				 	 						
		
		 while (z<1924) or (z>2024) do		 
		  begin
		    writeln('----------------------------------------------------------------');
				write('Ano inválido, digite um ano válido: ');
				read(z);
			end;	
//------------------------------------------------------------------------------------------------------Validar mês
			while (y>12) or (y<1)do
			begin
				writeln('----------------------------------------------------------------');
				write('Mês inválido, digite um mês válido: ');
				read(y);
			end;		
			
//----------------------------------------------------------------------------------------------------- Validação de dia
	  if (z mod 4 = 0) then  
	  	anobissexto:=true
	  	else
	  	anobissexto:=false;
	
		if (y=2) and (anobissexto=false) then
		 begin
		  diamax:=28;
			while (x>28) or (x<1) do
				begin
				 writeln('----------------------------------------------------------------');
				 write('Dia inválido, digite um dia válido: ');
				 readln(x);
				end;
			end	
		else
			if (y=2) and (anobissexto=true) then
			 begin
			 diamax:=29;
				while (x>29) or (x<1) do
					begin
					 writeln('----------------------------------------------------------------');
					 write('Dia inválido, digite um dia válido: ');
					 readln(x);
					end;
			 end 		
			else
				if (y=1) or (y=3) or (y=5) or (y=7) or (y=8) or (y=10) or (y=12) then
				begin 
				 diamax:=31;
					while (x>31) or (x<1) do
						begin
						  writeln('----------------------------------------------------------------');
							write('Dia inválido, digite um dia válido: ');
							readln(x);
						end;
				 end		
				else
					begin
					diamax:=30;
					 while (x>30) or (x<1) do
					 	 begin
					 	   writeln('----------------------------------------------------------------');
							 write('Dia inválido, digite um dia válido: ');
							 readln(x);					
		         end;
			 		 end;
end;									
Begin
  write('Digite o dia de nascimento: ');
  read(d);
  write('Digite o mês de nascimento: ');
  read(m);
  write('Digite o ano de nascimento: ');
  read(a);
  
  valdatap(d,m,a,sai);  
  validacao(d,m,a);	
				 
  
 	clrscr;							 	
	writeln('A data digitada é: ',d,'/',m,'/',a);
	writeln('------------------------------------');
	
	write('Digite o dia atual: ');
	read(d1);
	write('Digite o mês atual: ');
	read(m1);
	write('Digite o ano atual: ');
	read(a1);
	clrscr;
	validacao(d1,m1,a1); 
	
	d:=d1-d;
	m:=m1-m;
	a:=a1-a;
	

	if (m<0) then
	 begin
		m:=m+12;
		a:=a-1;
	 end;
	 
	if (d<0) then
		begin
			d:=d+diamax;
			m:=m-1;
		end;	 	 	
	writeln('Desde a data sugerida, se passaram ',a,' anos ',m,' meses e ',d,' dias.');	  
			  
	write('Enter para finalizar o programa');							 					 								 	
  readln();
End.
	