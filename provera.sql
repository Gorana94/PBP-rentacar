use mydbrentacar;


/*
(select sum(cena) from Dodatna_Oprema d, Rentiranje_opreme r, Rentira e where r.sifra_korisnika = e.sifra_korisnika and r.brRegTablica=e.brRegTablica and
    r.sifra_opreme=d.sifra_opreme and e.sifra_korisnika = 1 group by e.sifra_korisnika,e.brRegTablica);
   
    
insert into Rentira (sifra_rentiranja, sifra_korisnika, brRegTablica, datum_pocetka, datum_kraja,ukupna_cena)  values  (21, 1, 'BG111KH', '2017-09-14','2017-09-25',0.00);
*/
update Rentira set datum_vracanja = '2017-01-09' where sifra_korisnika = 1;
insert into Placanje(sifra_placanja, sifra_rentiranja, sifra_nacina_placanja) values (1,1,1);
	/*
insert into Nacin_Placanja (sifra_nacina_placanja, metod) values (21,'kes');
select * from Rentira;
select * from Vozilo;
select * from Placanje;
select * from Nacin_Placanja;


update Rentira set datum_vracanja = '2017-01-20' where sifra_korisnika = 2;

update Rentira set datum_vracanja = '2017-06-30' where sifra_korisnika = 10;
update Rentira set datum_vracanja = '2017-07-01' where sifra_korisnika = 21;

1. unos
	
*/
select * from Pravno_Lice;
select * from Fizicko_Lice;
select * from Korisnik;
select * from Rentira;
select * from Vozilo;
select * from Lokacija;
select * from Placanje;
select * from Nacin_Placanja;
select * from Dodatna_Oprema;
select * from Rentiranje_opreme;
select * from Osiguranje;
select * from Izabrana_Osiguranja;
select * from Ponudjena_Osiguranja;