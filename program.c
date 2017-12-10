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

	int quit = 0, broj, i;
    char query[DUZINAQUERY], ime[20], prezime[20], datum[11], jmbg[13], brVD[9], email[45],telefon[10], PIB[9], brReg[10], datum1[11];
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
        printf("\t[1] - Izlistati informacije o korisniku\n");
        printf("\t[2] - Izlistati informacije o vozilu koje je korisnik rentirao\n");
        printf("\t[3] - Azurirati datum vracanja automobila\n");
        printf("\t[4] - Azurirati datum kada je isplaceno rentiranje\n");
        printf("\t[5] - Registrovati novog korisnika\n");
        printf("\t[6] - Izlistati sve automobile koji su trenutno na stanju\n");
        printf("\t[7] - Uneti podatke o novom rentiranju za izabranog korisnika\n");
        printf("\t[8] - Izlaz iz programa\n");
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
        			if(mysql_query(conn, query))
                    error_fatal("Upit 1: %s\n", mysql_error(conn));

                	result_set = mysql_use_result(conn);
                	int num_fields = mysql_num_fields(result_set);
                	field = mysql_fetch_fields(result_set);

                	while((row = mysql_fetch_row(result_set)) != NULL){
                		printf("-----------------------------------------------------------\n");      
                		for(i=0; i< num_fields; i++)
                			printf("%-20s | %s\n", field[i].name, row[i]);

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
                			printf("%-20s | %s\n", field[i].name, row[i]);

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
        		sprintf(query, "select * from Rentira join Placanje on Placanje.sifra_placanja = Rentira.sifra_placanja where Rentira.sifra_korisnika = '%d'",broj);

				if(mysql_query(conn, query))
                    error_fatal("Greska kod upita 1: %s\n", mysql_error(conn));

                result_set = mysql_use_result(conn);
                int num_fields = mysql_num_fields(result_set);
                field = mysql_fetch_fields(result_set);
               	while((row = mysql_fetch_row(result_set)) != NULL){
              		printf("-----------------------------------------------------------\n");      
               		for(i=0; i< num_fields; i++)
               			printf("%-20s | %s\n", field[i].name, row[i]);

              	}
               	printf("-----------------------------------------------------------\n");
               	mysql_free_result(result_set);

        	break;

        	case 3:
        		getchar();
        		printf("Ukoliko zelite da azurirati datum kada je automobil vracen:\n");
        		printf("Unesite sifru korisnika: ");
        		scanf("%d",&broj);
        		printf("Unesite datum vracanaj automobila: ");
        		scanf("%s", datum);
        		getchar();

        		sprintf(query, "update Rentira set datum_vracanja = '%s' where sifra_korisnika = '%d'",datum,broj);

        		if(mysql_query(conn, query))
                    error_fatal("Greska kod upita 3: %s\n", mysql_error(conn)); 
                  

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
                    error_fatal("Greska kod upita 3: %s\n", mysql_error(conn)); 
            break;

            case 5:

            	getchar();
        		printf("Ukoliko je korisnik fizicko lice unesite 1, ukoliko je korisnik pravno lice unesite 2:\n");
        		scanf("%d",&broj);
        		getchar();

        		if(broj == 1){
        			printf("Unesite sifru korisnika, ime, prezime, jmbg, broj vozacke dozvole, email i telefon: ");
        			scanf("%d %s %s %s %s %s %s", &broj, ime, prezime, jmbg, brVD, email, telefon );
        			getchar();
        			printf("Unesite adresu korisnika: ");
        			fgets(input1, DUZINA, stdin);
        			input1[strlen(input1) - 1] = '\0';
        			//printf("%s\n",input1 );

        			sprintf(query, "INSERT INTO Korisnik(sifra_korisnika, brVozackeDozvole, email, adresa, telefon) VALUES ('%d', '%s', '%s', '%s', '%s')", broj, brVD, email, input1, telefon);
                	if(mysql_query(conn, query))
                    error_fatal("Greska u upitu 5: %s\n", mysql_error(conn));

        			sprintf(query, "INSERT INTO Fizicko_Lice(sifra_korisnika, ime, prezime, jmbg) VALUES ('%d', '%s', '%s', '%s')", broj, ime, prezime, jmbg);
               	 	if(mysql_query(conn, query))
                    error_fatal("Greska u upitu 5: %s\n", mysql_error(conn));
                                     
                	
        		}
        		else{
        			printf("Unesite sifru korisnika, naziv kompanije, PIB, broj vozacke dozvole, email i telefon: ");
        			
        			scanf("%d %s %s %s %s %s", &broj, ime, PIB, brVD, email, telefon );
        			getchar();
        			printf("Unesite adresu korisnika: ");
        			fgets(input1, DUZINA, stdin);
        			input1[strlen(input1) - 1] = '\0';

        			sprintf(query, "INSERT INTO Korisnik(sifra_korisnika, brVozackeDozvole, email, adresa, telefon) VALUES ('%d', '%s', '%s', '%s', '%s')", broj, brVD, email, input1, telefon);
                	if(mysql_query(conn, query))
                    error_fatal("Greska u upitu 5: %s\n", mysql_error(conn));

        			sprintf(query, "INSERT INTO Pravno_Lice(sifra_korisnika, naziv, PIB) VALUES ('%d', '%s', '%s')", broj, ime, PIB);
               	 	if(mysql_query(conn, query))
                    error_fatal("Greska u upitu 5: %s\n", mysql_error(conn));
                                     

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
                			printf("%-20s | %s\n", field[i].name, row[i]);

                	}
                	printf("-----------------------------------------------------------\n");
                	mysql_free_result(result_set);



        	break;

        	case 7:
        	/*
        			printf("Unesite sifru korisnika, br registarskih tablica automobila koji korisnik zeli da iznajmi, datum pocetka iznajmljivanja, datum kraja iznajmljivanja i sifru placanja: ");
        			scanf("%d %s %s %s %d",&broj, brReg, datum, datum1, &i);

        			sprintf(query, "insert into Nacin_Placanja(sifra_nacina_placanja) values ('%d')", i);
        			if(mysql_query(conn, query))
                    error_fatal("Greska u upitu 7: %s\n", mysql_error(conn));

        			sprintf(query, "insert into Placanje(sifra_placanja, sifra_nacina_placanja) values ('%d','%d')", i,i);
        			if(mysql_query(conn, query))
                    error_fatal("Greska u upitu 7: %s\n", mysql_error(conn));

        			sprintf(query, "insert into Rentira(sifra_korisnika, brRegTablica, datum_pocetka, datum_kraja, sifra_placanja) values ('%d', '%s', '%s', '%s', '%d')", broj, brReg, datum, datum1, i);
        			if(mysql_query(conn, query))
                    error_fatal("Greska u upitu 7: %s\n", mysql_error(conn));
			*/
        	break;

        	case 8:
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