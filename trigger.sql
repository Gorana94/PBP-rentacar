use mydbrentacar;


delimiter |

drop trigger if exists triger1 |
create trigger triger1 before insert on Rentira
for each row
begin
    
    set new.kazna = 0.00;
    set new.ukupna_cena = 0.00;
  
    if(new.datum_kraja < new.datum_pocetka)
        then signal sqlstate '45000' set message_text = "Greska: Pogresno je unet datum kada automobil treba da bude vracen!";
    end if;

    update Vozilo set status = 'zauzeto' where Vozilo.brRegTablica = new.brRegTablica;

    set new.sifra_lokacija = (select sifra_lokacije from Vozilo where Vozilo.brRegTablica = new.brRegTablica);

    update Placanje set Placanje.krajnji_datum = new.datum_kraja where Placanje.sifra_placanja = new.sifra_placanja;

    if(new.sifra_korisnika in (select sifra_korisnika from Pravno_Lice))
        then update Placanje set Placanje.popust = 10.00 where Placanje.sifra_placanja = new.sifra_placanja;
    else
        update Placanje set Placanje.popust = 0.00 where Placanje.sifra_placanja = new.sifra_placanja;
    end if;

    update Placanje set Placanje.konacna_cena = 0.00 where Placanje.sifra_placanja = new.sifra_placanja;

end |

drop trigger if exists triger2 |
create trigger triger2 before update on Rentira
for each row
begin

	declare broj_dana int;
    declare broj_prekoracenih_dana int;
    declare c_kazne int;
    declare c_vozila int;
    declare c_osiguranja int;
    declare c_dodatne_opreme int;

    set broj_dana = datediff(new.datum_vracanja,new.datum_pocetka);
    set broj_prekoracenih_dana = datediff(new.datum_vracanja, new.datum_kraja);
    
	if(broj_prekoracenih_dana > 0)  then   
        set new.kazna = ((select cena_po_danu from Vozilo V where V.brRegTablica = new.brRegTablica) * broj_prekoracenih_dana) + 35.00;	
        set c_kazne = new.kazna;
    else 
        set new.kazna = 0.00;
        set c_kazne = 0.00;
    end if;   
	
    
    set c_vozila = (select cena_po_danu from Vozilo V where V.brRegTablica = new.brRegTablica) * broj_dana;

    if(exists (select cena from Poseduje_Osiguranje PO where new.brRegTablica = PO.brRegTablica and PO.sifra_korisnika = new.sifra_korisnika))
        then set c_osiguranja = (select sum(cena) from Poseduje_Osiguranje PO where new.brRegTablica = PO.brRegTablica 
                                 and PO.sifra_korisnika = new.sifra_korisnika group by new.sifra_korisnika);
    else set c_osiguranja = 0;
    end if;
       
	if(exists(select cena from Dodatna_Oprema D, Rentiranje_opreme R where R.sifra_korisnika = new.sifra_korisnika 
              and R.brRegTablica = new.brRegTablica and D.sifra_opreme = R.sifra_opreme and sifra_korisnika = new.sifra_korisnika))
		then set c_dodatne_opreme =  (select sum(cena) from Dodatna_Oprema D, Rentiranje_opreme R where R.sifra_korisnika = new.sifra_korisnika 
		                              and R.brRegTablica = new.brRegTablica and D.sifra_opreme = R.sifra_opreme and sifra_korisnika = new.sifra_korisnika 
		                              group by R.sifra_korisnika,R.brRegTablica);
    else set c_dodatne_opreme = 0;
    end if;
   
    if(new.ukupna_cena = 0)
       then set new.ukupna_cena = old.ukupna_cena + c_kazne + c_dodatne_opreme + c_vozila + c_osiguranja;

    end if;
    

    if(new.datum_vracanja is not null)
    then update Vozilo set status = 'na stanju' where new.brRegTablica = Vozilo.brRegTablica;
    end if;

    

end |


drop trigger if exists triger3 |
create trigger triger3 after update on Rentira 
for each row
begin
    declare popust int;
    set popust = (select Placanje.popust from Placanje where Placanje.sifra_placanja = new.sifra_placanja);

    if(new.ukupna_cena is not null and popust>0) then
        update Placanje set Placanje.konacna_cena = (10.00 * new.ukupna_cena)/100.00 where Placanje.sifra_placanja = new.sifra_placanja;
        
    elseif(new.ukupna_cena is not null and popust = 0) then
        update Placanje set Placanje.konacna_cena = new.ukupna_cena where Placanje.sifra_placanja = new.sifra_placanja;

    end if;

end |

delimiter ;

