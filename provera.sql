use mydbrentacar;


/*
(select sum(cena) from Dodatna_Oprema d, Rentiranje_opreme r, Rentira e where r.sifra_korisnika = e.sifra_korisnika and r.brRegTablica=e.brRegTablica and
    r.sifra_opreme=d.sifra_opreme and e.sifra_korisnika = 1 group by e.sifra_korisnika,e.brRegTablica);
    */
    
update Rentira set datum_vracanja = '2017-01-09' where sifra_korisnika = 1;
update Rentira set datum_vracanja = '2017-01-20' where sifra_korisnika = 2;

update Rentira set datum_vracanja = '2017-06-30' where sifra_korisnika = 10;
update Rentira set datum_vracanja = '2017-07-01' where sifra_korisnika = 21;

select * from Pravno_Lice;
select * from Korisnik;
select * from Rentira;
select * from Vozilo;
select * from Placanje;