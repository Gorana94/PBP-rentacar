#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <mysql.h>
#include <stdarg.h>
#include <errno.h>
#include <stdint.h>

#define DUZINAQUERY 1024
#define DUZINA 100

void error_fatal(char *format, ...);

const char* host = "localhost";
const char* user = "root";
const char* password = "";
const char* db = "mydbrentacar";

int main(){

	int quit = 0, broj, i, sifra_r, sifra_np, sifra_p;
    int size,arr[10000];
    char temp; 
    char query[DUZINAQUERY], ime[20], prezime[20], datum[11], jmbg[13], brVD[9], email[45],telefon[10], PIB[9], brReg[10], datum1[11],nacin_p[7];
    char input1[DUZINA];
    char *imePrezime;
    MYSQL* conn = mysql_init(NULL);
    MYSQL_RES* result_set;
    MYSQL_FIELD* field;
    MYSQL_ROW row;
    
    if(mysql_real_connect(conn, host, user, password, db, 0, NULL, 0) == NULL)
        error_fatal("Greska u konekciji: %s\n", mysql_error(conn));
    
     while(!quit) {

        int opcija;        
        system("clear");
        printf("-----------------------------------------------------------\n\n"); 
        printf("Odaberite jednu od opcija:\n");
        printf("\t[1]  - Izlistati informacije o korisniku\n");
        printf("\t[2]  - Izlistati informacije o rentiranju i placanju vozila koje je korisnik rentirao\n");
        printf("\t[3]  - Azurirati datum vracanja automobila\n");
        printf("\t[4]  - Azurirati datum kada je isplaceno rentiranje\n");
        printf("\t[5]  - Registrovati novog korisnika\n");
        printf("\t[6]  - Izlistati sve automobile koji su trenutno na stanju\n");
        printf("\t[7]  - Uneti podatke o novom rentiranju za izabranog korisnika\n");
        printf("\t[8]  - Izlistati dodatnu opremu za rentiranje vozila i uneti podatke o dodatnoj opremi koju korisnik zeli\n");
        printf("\t[9]  - Izlistati ponudjena osiguranja za rentirano vozilo i uneti podatke o osiguranjima koje korisnik zeli\n");
        printf("\t[10] - Izlaz iz programa\n");
        printf("-----------------------------------------------------------\n\n"); 
        
        scanf("%d",&opcija);
        switch(opcija){
        	case 1:
        		
        		getchar();
        		printf("Ukoliko je korisnik fizicko lice unesite 1, ukoliko je korisnik pravno lice unesite 2:\n");
        		scanf("%d",&broj);
        		getchar();

        		if(broj == 1){
        			printf("Unesite korisnicko ime i prezime: ");
        			fgets(input1, DUZINA, stdin);
        			input1[strlen(input1) - 1] = '\0';

        			imePrezime = strtok(input1," ");
        			strcpy(ime,imePrezime);

        			imePrezime = strtok(NULL," ");
        			strcpy(prezime, imePrezime);
        			
        			sprintf(query, "SELECT Fizicko_Lice.sifra_korisnika, ime, prezime, jmbg, brVozackeDozvole, email, adresa, telefon from Fizicko_Lice join Korisnik on Korisnik.sifra_korisnika = Fizicko_Lice.sifra_korisnika where ime= '%s' and prezime= '%s'",ime, prezime);
        			//printf( "%s \n", prezime);
        			if(mysql_query(conn, query)){
                    error_fatal("Upit 1: %s\n", mysql_error(conn));
                    }

                	result_set = mysql_use_result(conn);
                	int num_fields = mysql_num_fields(result_set);
                	field = mysql_fetch_fields(result_set);

                	while((row = mysql_fetch_row(result_set)) != NULL){
                		printf("-----------------------------------------------------------\n");      
                		for(i=0; i< num_fields; i++)
                			printf("%-30s | %s\n", field[i].name, row[i]);

                	}
                	printf("-----------------------------------------------------------\n");
                	mysql_free_result(result_set);

        		}
        		else{
        			printf("Unesite ime kompanije: ");
        			fgets(input1, DUZINA, stdin);
        			input1[strlen(input1) - 1] = '\0';
        			
        			sprintf(query, "SELECT Pravno_Lice.sifra_korisnika, naziv, PIB, email, adresa, telefon from Pravno_Lice join Korisnik on Korisnik.sifra_korisnika = Pravno_Lice.sifra_korisnika where naziv= '%s'",input1);
        			
        			if(mysql_query(conn, query))
                    error_fatal("Upit 1: %s\n", mysql_error(conn));

                	result_set = mysql_use_result(conn);
                	int num_fields = mysql_num_fields(result_set);
                	field = mysql_fetch_fields(result_set);

                	while((row = mysql_fetch_row(result_set)) != NULL){
                		printf("-----------------------------------------------------------\n");      
                		for(i=0; i< num_fields; i++)
                			printf("%-30s | %s\n", field[i].name, row[i]);

                	}
                	printf("-----------------------------------------------------------\n");
                	mysql_free_result(result_set);


        		}   		

        	break;

        	case 2:
        		getchar();
        		printf("Unesite sifru korisnika: ");
        		scanf("%d",&broj);
        		getchar();
        		sprintf(query, "select * from Rentira join Placanje on Placanje.sifra_rentiranja = Rentira.sifra_rentiranja join Nacin_Placanja on Nacin_Placanja.sifra_nacina_placanja = Placanje.sifra_nacina_placanja where Rentira.sifra_korisnika = '%d'",broj);

				if(mysql_query(conn, query))
                    error_fatal("Upit 1: Uneli ste pogresnu sifru, %s\n", mysql_error(conn));

                result_set = mysql_use_result(conn);
                int num_fields = mysql_num_fields(result_set);
                field = mysql_fetch_fields(result_set);
               	while((row = mysql_fetch_row(result_set)) != NULL){
              		printf("-----------------------------------------------------------\n");      
               		for(i=0; i< num_fields; i++){
                        if((strcmp(field[i].name,"datum_vracanja") == 0) && (row[i]==NULL)){
                            printf("%-30s | %s\n", field[i].name, "");
                        }else if((strcmp(field[i].name,"datum_placanja") == 0) && (row[i]==NULL))
                            printf("%-30s | %s\n", field[i].name, "");
                        else{
                            printf("%-30s | %s\n", field[i].name, row[i]);
                        }
               			
                    }

              	}
               	printf("-----------------------------------------------------------\n");
               	mysql_free_result(result_set);


          	break;

        	case 3:
         
        		getchar();
        		printf("Ukoliko zelite da azurirati datum kada je automobil vracen:\n");
        		printf("Unesite sifru rentiranja: ");
        		scanf("%d",&broj);
        		printf("Unesite datum vracanja automobila: ");
        		scanf("%s",datum);
        		getchar();

        		sprintf(query, "update Rentira set datum_vracanja = '%s' where sifra_rentiranja = '%d'",datum,broj);

        		if(mysql_query(conn, query))
                    error_fatal("Upit 3: Pogresno ste uneli neku od sledecih vrednosti - sifra_rentiranja, datum %s\n", mysql_error(conn)); 
                  

        	break;

        	case 4:
           
        		getchar();
        		printf("Ukoliko zelite da azurirate datum kada je korisnik isplatio racun:\n");
        		printf("Unesite sifru placanja: ");
        		scanf("%d",&broj);
        		printf("Unesite datum kada je korisnik isplatio racun: ");
        		scanf("%s",datum);
        		getchar();

        		sprintf(query,"update Placanje set datum_placanja = '%s' where sifra_placanja = '%d'",datum,broj);

        		if(mysql_query(conn, query))
                    error_fatal("Upit 4: Pogresno ste uneli neku od sledecih vrednosti - sifra_placanja, datum %s\n", mysql_error(conn)); 
            break;

            case 5:

            	getchar();
        		printf("Ukoliko je korisnik fizicko lice unesite 1, ukoliko je korisnik pravno lice unesite 2:\n");
        		scanf("%d",&broj);
        		getchar();

                sprintf(query, "select max(sifra_korisnika) from Korisnik");
                if(mysql_query(conn, query))
                error_fatal("Upit 5: %s\n", mysql_error(conn));
                result_set = mysql_store_result(conn);                   
                while((row = mysql_fetch_row(result_set )) !=0)
                {                       
                    sifra_p = row[0] ? atoi(row[0]) : 0;
                    //printf("%d\n", sifra_p);
                }
                mysql_free_result(result_set );
                sifra_p = sifra_p + 1;

        		if(broj == 1){
        			printf("Unesite ime i prezime: ");
        			scanf("%s %s", ime, prezime);
        			getchar();
                    printf("Unesite jmbg, broj vozacke dozvole: ");
                    scanf("%s %s", jmbg, brVD);
                    getchar();
                    printf("Unesite email i telefon: ");
        		    scanf("%s %s", email, telefon );
                    getchar();

                    printf("Unesite adresu: ");
        			fgets(input1, DUZINA, stdin);
        			input1[strlen(input1) - 1] = '\0';
        			//printf("%s\n",input1 );

        			sprintf(query, "INSERT INTO Korisnik(sifra_korisnika, brVozackeDozvole, email, adresa, telefon) VALUES ('%d', '%s', '%s', '%s', '%s')", sifra_p, brVD, email, input1, telefon);
                	if(mysql_query(conn, query))
                    error_fatal("Upit 5: Pogresan unos!, %s\n", mysql_error(conn));

        			sprintf(query, "INSERT INTO Fizicko_Lice(sifra_korisnika, ime, prezime, jmbg) VALUES ('%d', '%s', '%s', '%s')", sifra_p, ime, prezime, jmbg);
               	 	if(mysql_query(conn, query))
                    error_fatal("Upit 5: Pogresan unos!, %s\n", mysql_error(conn));
                                     
                	
        		}
        		else{
        			printf("Unesite naziv kompanije: ");
        			
        			scanf("%s",ime);
        			getchar();

                    printf("Unseite PIB i broj vozacke dozvole: ");
                    scanf("%s %s", PIB, brVD);
                    getchar();

                    printf("Unesite email i telefon: ");
                    scanf("%s %s", email, telefon );
                    getchar();

        			printf("Unesite adresu korisnika: ");
        			fgets(input1, DUZINA, stdin);
        			input1[strlen(input1) - 1] = '\0';

        			sprintf(query, "INSERT INTO Korisnik(sifra_korisnika, brVozackeDozvole, email, adresa, telefon) VALUES ('%d', '%s', '%s', '%s', '%s')", sifra_p, brVD, email, input1, telefon);
                	if(mysql_query(conn, query))
                    error_fatal("Upit 5: Pogresan unos!, %s\n", mysql_error(conn));

        			sprintf(query, "INSERT INTO Pravno_Lice(sifra_korisnika, naziv, PIB) VALUES ('%d', '%s', '%s')", sifra_p, ime, PIB);
               	 	if(mysql_query(conn, query))
                    error_fatal("Upit 5: Pogresan unos!, %s\n", mysql_error(conn));
                                     

        		}   		
        	break;
        	case 6:
        			getchar();
        			printf("Automobili na stanju:\n");
        			sprintf(query, "select brRegTablica, model, godina_proizvodnje, boja, tip, cena_po_danu, Lokacija.adresa from Vozilo left join Lokacija on Lokacija.sifra_lokacije = Vozilo.sifra_lokacije where status = 'na stanju'");
                	if(mysql_query(conn, query))
                    error_fatal("Upit 6: %s\n", mysql_error(conn));

                	result_set = mysql_use_result(conn);
                	int num_fields1 = mysql_num_fields(result_set);
                	field = mysql_fetch_fields(result_set);

                	while((row = mysql_fetch_row(result_set)) != NULL){
                		printf("-----------------------------------------------------------\n");      
                		for(i=0; i< num_fields1; i++)
                			printf("%-30s | %s\n", field[i].name, row[i]);

                	}
                	printf("-----------------------------------------------------------\n");
                	mysql_free_result(result_set);
        	break;

        	case 7:

                    printf("Unesite sifru korisnika, br registarskih tablica automobila koji korisnik zeli da iznajmi, datum pocetka iznajmljivanja, datum kraja iznajmljivanja: ");
                    scanf("%d %s %s %s",&broj, brReg, datum, datum1);
                    getchar();

                    printf("Ukoliko korisnik placa novcem potrebno je da upise 'novac', a inace 'kartica': ");
                    scanf("%s",nacin_p);
                    getchar();
   
                    sprintf(query, "select max(sifra_placanja) from Placanje");
                    if(mysql_query(conn, query))
                    error_fatal("Upit 7: %s\n", mysql_error(conn));
                    result_set = mysql_store_result(conn);                   
                    while((row = mysql_fetch_row(result_set )) !=0)
                    {                       
                        sifra_p = row[0] ? atoi(row[0]) : 0;
                        //printf("%d\n", sifra_p);
                    }
                    mysql_free_result(result_set );

                    sprintf(query, "select max(sifra_nacina_placanja) from Nacin_Placanja");
                    if(mysql_query(conn, query))
                    error_fatal("Upit 7: %s\n", mysql_error(conn));
                    result_set = mysql_store_result(conn);                   
                    while((row = mysql_fetch_row(result_set )) !=0)
                    {                       
                        sifra_np = row[0] ? atoi(row[0]) : 0;
                       // printf("%d\n", sifra_np);
                    }
                    mysql_free_result(result_set );

                    sprintf(query, "select max(sifra_rentiranja) from Rentira");
                    if(mysql_query(conn, query))
                    error_fatal("Upit 7: %s\n", mysql_error(conn));
                    result_set = mysql_store_result(conn);                   
                    while((row = mysql_fetch_row(result_set )) !=0)
                    {                       
                        sifra_r = row[0] ? atoi(row[0]) : 0;
                       // printf("%d\n", sifra_r);
                    }
                    mysql_free_result(result_set );

                    sifra_p = sifra_p + 1;
                    sifra_np = sifra_np + 1;
                    sifra_r = sifra_r + 1;

                    sprintf(query, "insert into Rentira(sifra_rentiranja ,sifra_korisnika, brRegTablica, datum_pocetka, datum_kraja) values ('%d','%d', '%s', '%s', '%s')",sifra_r, broj, brReg, datum, datum1);
                    if(mysql_query(conn, query))
                    error_fatal("Greska u upitu 7: %s\n", mysql_error(conn));

        			sprintf(query, "insert into Nacin_Placanja(sifra_nacina_placanja, metod) values ('%d','%s')", sifra_np, nacin_p);
        			if(mysql_query(conn, query))
                    error_fatal("Greska u upitu 7: %s\n", mysql_error(conn));

        			sprintf(query, "insert into Placanje(sifra_placanja,sifra_rentiranja, sifra_nacina_placanja) values ('%d','%d','%d')", sifra_p,sifra_r,sifra_np);
        			if(mysql_query(conn, query))
                    error_fatal("Greska u upitu 7: %s\n", mysql_error(conn));	
			      

                break;

                case 8:

                    getchar();
                    printf("Dodatna oprema:\n");
                    sprintf(query, "select * from Dodatna_Oprema");
                    if(mysql_query(conn, query))
                    error_fatal("Upit 8: %s\n", mysql_error(conn));

                    result_set = mysql_use_result(conn);
                    num_fields1 = mysql_num_fields(result_set);
                    field = mysql_fetch_fields(result_set);

                    while((row = mysql_fetch_row(result_set)) != NULL){
                        printf("-----------------------------------------------------------\n");      
                        for(i=0; i< num_fields1; i++)
                            printf("%-30s | %s\n", field[i].name, row[i]);

                    }
                    printf("-----------------------------------------------------------\n");
                    mysql_free_result(result_set);

                    printf("Unesite sifru rentiranja vozila i sifre opreme koju korisnik zeli da iznajmi: ");
                    scanf("%d",&broj);
                    getchar();

                    i=0;
                    do{
                        scanf("%d%c", &arr[i], &temp); 
                        i++; 
                        } while(temp!= '\n');

                    size=i; 
                    for(i=0;i<size;i++){ 
                        sprintf(query, "insert into Rentiranje_opreme (sifra_rentiranja, sifra_opreme) values ('%d','%d')",broj, arr[i]);
                        if(mysql_query(conn, query))
                        error_fatal("Greska u upitu 8: %s\n", mysql_error(conn));
                    } 

                break;

                case 9:
               
                    getchar();
                    printf("Unesite registarski broj tablica vozila koje korisnik rentira kako biste videli ponudjena osiguranja i njihove cene za to vozilo:\n");
                    scanf("%s",brReg);
                    getchar();
                  
                    sprintf(query, "select Ponudjena_Osiguranja.sifra_osiguranja, tip, cena, pokrice_korisnika, pokrice_sl_stete  from Osiguranje join Ponudjena_Osiguranja on Ponudjena_Osiguranja.sifra_osiguranja = Osiguranje.sifra_osiguranja where Ponudjena_Osiguranja.brRegTablica = '%s'",brReg);

                    if(mysql_query(conn, query))
                    error_fatal("Upit 9: %s\n", mysql_error(conn));

                    result_set = mysql_use_result(conn);
                    num_fields = mysql_num_fields(result_set);
                    field = mysql_fetch_fields(result_set);
                    while((row = mysql_fetch_row(result_set)) != NULL){
                        printf("-----------------------------------------------------------\n");      
                        for(i=0; i< num_fields; i++)
                            printf("%-30s | %s\n", field[i].name, row[i]);

                    }
                    printf("-----------------------------------------------------------\n");

                    mysql_free_result(result_set);

                    printf("Unesite sifru rentiranja: ");
                    scanf("%d",&sifra_r);
                    getchar();

                    printf("Unesite sifre osiguranja koje zelite da rentirate: ");
                    i=0;
                    do{
                        scanf("%d%c", &arr[i], &temp); 
                        i++; 
                        } while(temp!= '\n');

                    size=i; 
                    for(i=0;i<size;i++){  
                        sprintf(query, "insert into Izabrana_Osiguranja (sifra_rentiranja, brRegTablica, sifra_osiguranja) values ('%d','%s','%d')",sifra_r, brReg, arr[i]);
                        if(mysql_query(conn, query))
                        error_fatal("Greska u upitu 9: %s\n", mysql_error(conn));
                    } 

                break;

            	case 10:
                    quit = 1;
                    break;
            	default:
            		printf("Izabrana opcija ne postoji!\n");
        }
        if(!quit){
        	printf("Ako zelite da se vratite u meni, pritisnite enter!\n");
        	getchar();
        }
    }

    mysql_close(conn);
	return 0;
}

void error_fatal (char* format, ...)
{
  va_list arguments;

  va_start (arguments, format);
  vfprintf (stderr, format, arguments);
  va_end (arguments);

  exit (EXIT_FAILURE);
}