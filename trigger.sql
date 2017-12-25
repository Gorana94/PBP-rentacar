use mydbrentacar;


delimiter |

drop trigger if exists triger1 |
create trigger triger1 before insert on Rentira
for each row
begin
    declare stanje varchar(45);
    set new.kazna = 0.00;
    set new.ukupna_cena = 0.00;

    if(new.datum_kraja < new.datum_pocetka)
        then signal sqlstate '45000' set message_text = "Greska: Pogresno je unet datum kada automobil treba da bude vracen!";
    end if;

    set stanje = (select status from Vozilo where Vozilo.brRegTablica = new.brRegTablica);

    if(stanje like 'zauzeto')
        then signal sqlstate '45000' set message_text = "Greska: To vozilo trenutno nije na stanju, potrebno je odabrati drugo vozilo!";
    end if;


    update Vozilo set status = 'zauzeto' where Vozilo.brRegTablica = new.brRegTablica;

    set new.sifra_lokacija = (select sifra_lokacije from Vozilo where Vozilo.brRegTablica = new.brRegTablica);

end |

drop trigger if exists triger2 |
create trigger triger2 before insert on Placanje
for each row
begin
	
    declare ukupna_c int;
    declare pop int;
    set new.krajnji_datum = (select Rentira.datum_kraja from Rentira where Rentira.sifra_rentiranja = new.sifra_rentiranja) + 10;
	set new.konacna_cena = 0.00;
    
    if(exists (select PL.sifra_korisnika from Pravno_Lice PL, Rentira R where PL.sifra_korisnika = R.sifra_korisnika and R.sifra_rentiranja = new.sifra_rentiranja))
		then set new.popust =10; 
			 set pop = 10;
	else set new.popust = 0; set pop=0;
    end if;
  
    set ukupna_c = (select ukupna_cena from Rentira R where R.sifra_rentiranja = new.sifra_rentiranja);
  
    if(ukupna_c is not null and pop > 0) then
		set new.konacna_cena =( ukupna_c - (10.00 * ukupna_c)/100.00);
	elseif (ukupna_c is not null ) then 
		set new.konacna_cena = ukupna_c;
	end if;    
  
end |


drop trigger if exists triger3 |
create trigger triger3 before update on Rentira
for each row
begin

	declare broj_dana int;
    declare broj_prekoracenih_dana int;
    declare c_kazne int;
    declare c_vozila int;
    declare c_osiguranja int;
    declare c_dodatne_opreme int;

    set broj_dana = datediff(new.datum_kraja,new.datum_pocetka);
    set broj_prekoracenih_dana = datediff(new.datum_vracanja, new.datum_kraja);
    
	if(broj_prekoracenih_dana > 0)  then   
        set new.kazna = ((select cena_po_danu from Vozilo V where V.brRegTablica = new.brRegTablica) * broj_prekoracenih_dana) + 35.00;	
        set c_kazne = new.kazna;
    else 
        set new.kazna = 0.00;
        set c_kazne = 0.00;
    end if;   
	
    
    set c_vozila = (select cena_po_danu from Vozilo V where V.brRegTablica = new.brRegTablica) * broj_dana;

   if(exists (select cena from Ponudjena_Osiguranja PO, Izabrana_Osiguranja I where new.sifra_rentiranja = I.sifra_rentiranja and I.brRegTablica = PO.brRegTablica and I.sifra_osiguranja = PO.sifra_osiguranja))
        then set c_osiguranja = (select sum(cena) from Ponudjena_Osiguranja PO, Izabrana_Osiguranja I where new.sifra_rentiranja = I.sifra_rentiranja  
                                 and I.brRegTablica = PO.brRegTablica and I.sifra_osiguranja = PO.sifra_osiguranja group by new.sifra_rentiranja);
    else set c_osiguranja = 0;
    end if;
     
	if(exists(select cena from Dodatna_Oprema D, Rentiranje_opreme R where R.sifra_rentiranja = new.sifra_rentiranja 
              and D.sifra_opreme = R.sifra_opreme and sifra_rentiranja = new.sifra_rentiranja))
		then set c_dodatne_opreme =  (select sum(cena) from Dodatna_Oprema D, Rentiranje_opreme R where  R.sifra_rentiranja = new.sifra_rentiranja 
									  and D.sifra_opreme = R.sifra_opreme and sifra_rentiranja = new.sifra_rentiranja
		                              group by R.sifra_rentiranja);
    else set c_dodatne_opreme = 0;
    end if;
  
    if(new.ukupna_cena = 0)
       then set new.ukupna_cena = old.ukupna_cena + c_kazne + c_vozila + c_dodatne_opreme + c_osiguranja ;

    end if;
    

    if(new.datum_vracanja is not null)
    then update Vozilo set status = 'na stanju' where new.brRegTablica = Vozilo.brRegTablica;
    end if;

 

end |

delimiter ;

