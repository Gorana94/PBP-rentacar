use mydbrentacar;


insert into Korisnik (sifra_korisnika, brVozackeDozvole, email, adresa, telefon) values 
				(1, '004045202', 'evaaloric@gmail.com', 'Bozidara Adzije 15, Beograd', '0693319533'), 
				(2, '003298266', 'milanalincic@gmail.com', 'Bulevar Crvene armije 45, Beograd', '0693369854'), 
                            (3, '003298266', 'petarbaveljic@gmail.com', 'Đure Strugara 78, cacak', '0663289657'), 
                            (4, '008676611', 'bojanbokic@gmail.com', 'Filipa Filipovica 65, Kraljevo', '0631289654'), 
                            (5, '001777065', 'jelenavojicic@gmail.com', 'General zdanova 69, Beograd', '0634578962'), 
                            (6, '007429727', 'aleksavranic@gmail.com', 'Ivana Milutinovica 78, Beograd', '0632145869'), 
                            (7, '008065675', 'milicadjukic@gmail.com', 'Lenjinov bulevar 14 cacak', '0693218596'), 
                            (8, '008193647', 'aleksandarzutic@gmail.com', 'Lole Ribara 96, Beograd', '0695478523'), 
                            (9, '005222448', 'djordjejesic@gmail.com', 'Marsala Tolbuhina 63, Kraljevo', '0694582369'), 
                            (10, '004202638', 'anajovanovic@gmail.com', 'Mate Vidakovica 32, cacak', '0661245896'), 
                            (11, '003559882', 'marinaperic@gmail.com', 'Mose Pijade 96, Beograd', '0632145962'), 
                            (12, '004114475', 'jovanamihajlovic@gmail.com', 'Proleterskih brigada 23, Beograd', '0631242136'), 
                            (13, '009352658', 'milosmarotic@gmail.com', 'Save Kovacevica 99, Beograd', '066325419'), 
                            (14, '008891111', 'mirkonisic@gmail.com', 'Sime Milosevica 22, cacak', '0632145698'), 
                            (15, '004517484', 'sanjapovic@gmail.com', 'Srpskih vladara 78, Beograd', '0694512638'), 
                            (16, '006522625', 'ivanapleskic@gmail.com', 'Tvornicka 11, Beograd', '0632145698'), 
                            (17, '005550750', 'jovanraulic@gmail.com', 'Slobodana Penezica-Krcuna 44, Beograd', '0632145896'), 
                            (18, '009024802', 'goransrnic@gmail.com', 'Bulevar mira 33, Beograd', '0692145698'), 
                            (19, '006359867', 'dusanstajkic@gmail.com', 'Đure Salaja 23, Beograd', '0632125236'), 
                            (20, '008146315', 'milantubic@gmail.com', 'Treci bulevar 44, Beograd', '0632145698'),
                            (21, '008146344', 'sloboda@gmail.com', 'Save Kovacevica 119, Beograd', '0632178528'),
                            (22, '008144455', 'visan@gmail.com', 'Tvornicka 41, Beograd', '0632789698'),
                            (23, '008146789', 'codex@gmail.com', 'Bulevar mira 333, Beograd', '0631242144'),
                            (24, '004517477', 'bimida@gmail.com', 'Đure Salaja 43, Beograd', '0631242155'),
                            (25, '004517488', 'ozon@gmail.com', 'Marsala Tolbuhina 113, Kraljevo', '0631242166'),
                            (26, '004517445', 'orion@gmail.com', 'Mate Vidakovica 62, cacak', '0631462136'),
                            (27, '604517484', 'coopservice@gmail.com', 'Đure Strugara 18, cacak', '0631242456'),
                            (28, '004515584', 'ecotime@gmail.com', 'Bozidara Adzije 36, Beograd', '0693218456'),
                            (29, '004517745', 'procter@gmail.com', 'Bulevar Crvene armije 145, Beograd', '0693218453'),
                            (30, '008065789', 'stannes@gmail.com', 'Đure Strugara 18, cacak', '0693218544'),
                            (31, '008065666', 'union@gmail.com', 'Filipa Filipovica 165, Kraljevo', '0693218654'),
                            (32, '008065336', 'pik@gmail.com', 'General zdanova 9, Beograd', '0693218533'),
                            (33, '008064455', 'profilab@gmail.com', 'General zdanova 55 , Beograd', '0693218412'),
                            (34, '008065666', 'aqualab@gmail.com', 'Ivana Milutinovica 118, Beograd','0693218332'),
                            (35, '004465675', 'remont@gmail.com', 'Lole Ribara 16, Beograd', '0663218563'),
                            (36, '008065644', 'cer@gmail.com', 'Mose Pijade 63, Beograd', '0633218596'),
                            (37, '045665675', 'kristal@gmail.com', 'Slobodana Penezica-Krcuna 332, Beograd', '0673218596'),
                            (38, '004565675', 'relax@gmail.com', 'Treci bulevar 14, Beograd', '0645218596'),
                            (39, '008452675', '2m@gmail.com', 'Đure Salaja 64, Beograd', '0679818596'),
                            (40, '008065236', 'nesa@gmail.com', 'Đure Salaja 96, Beograd', '0612521896');
                            
                            
insert into Fizicko_Lice (sifra_korisnika, ime, prezime, jmbg) values 
				(1, 'Eva', 'Aloric', '0502145896544'), 
				(2, 'Milan', 'Alincic', '0502145896521'), 
                            (3, 'Petar', 'Baveljic', '0521369568954'), 
                            (4, 'Bojan', 'Bokic', '1258965423651'), 
                            (5, 'Jelena', 'Vojcic', '785462956326'), 
                            (6, 'Aleksa', 'Vranic', '252632145852'), 
                            (7, 'Milica', 'Đukic', '5556325996552'), 
                            (8, 'Aleksandar', 'zutic', '5623564125112'), 
                            (9, 'ĐorĐe', 'Jesic', '123025632851'), 
                            (10, 'Ana', 'Jovanovic', '125632965230'), 
                            (11, 'Marina', 'Peric', '5412365296123'), 
                            (12, 'Jovana', 'Mihajlovic', '452130256320'), 
                            (13, 'Milos', 'Marotic', '425964582536'), 
                            (14, 'Mirko', 'Nisic', '454512632520'), 
                            (15, 'Sanja', 'Povic', '4526336529652'), 
                            (16, 'Ivana', 'Pleskic', '452163250632'), 
                            (17, 'Jovan', 'Raulic', '526321556321'), 
                            (18, 'Goran', 'Srnic', '454512782520'), 
                            (19, 'Dusan', 'Stajkic', '4545562632520'), 
                            (20, 'Milan', 'Tubic', '454512552520');


insert into Pravno_Lice (sifra_korisnika, naziv, PIB) values 
				(21, 'Sloboda', '001256345'), 
				(22, 'Visan', '002365236'), 
                            (23, 'Codex Trade', '215362365'), 
                            (24, 'Bimida', '589654587'), 
                            (25, 'Ozon', '456325469'), 
                            (26, 'Orion', '458236596'), 
                            (27, 'CoopService', '456521365'), 
                            (28, 'Ecotime', '458965236'), 
                            (29, 'Procter', '669856325'), 
                            (30, 'Stannes', '458256895'), 
                            (31, 'Union', '458213658'), 
                            (32, 'Pik', '45782365'), 
                            (33, 'Profi Lab','458965236'), 
                            (34, 'Aqua Lab', '458725693'), 
                            (35, 'Remont', '457859625'), 
                            (36, 'Cer', '457854126'), 
                            (37, 'Kristal','458751426'), 
                            (38, 'Relax', '254135829'), 
                            (39, '2M', '457821458'), 
                            (40, 'Nesa','458965326');
                            
insert into Lokacija (sifra_lokacije, telefon, ptt, adresa) values 
				(1, '0696541253', '11000', 'Mihajla Pupina, Beograd'), 
                            (2, '0691231253', '32000', 'Vojvode Stepe, cacak'), 
                            (3, '0696541963', '36000', 'ibarska 15, Kraljevo');

insert into Vozilo (brRegTablica, model, godina_proizvodnje, boja, kapacitet, tip, cena_po_danu, sifra_lokacije) values 
				('BG125AC', 'Audi A8', 2010 , 'crna', 5 , 'Lux', 80.00, 1),
                            ('BG789SR', 'BMW 7', 2015, 'crna', 5, 'Lux', 80.00, 1),
                            ('BG325BG', 'Mercedes S-Class', 2016 ,'bela',5 , 'Lux', 80.00 , 1),
                            ('BG456HJ', 'Buggatti Veyron', 2013,'bela',5 , 'Sportski', 100.00, 1),
                            ('BG236NB', 'Ferrari', 2010,'crna', 5, 'Sportski', 100.00, 1),
                            ('BG563IU', 'Hyundai Accent', 2014 ,'bela', 5, 'Mini', 35.00, 1),
                            ('BG111KH', 'Ford Fiesta', 2010 ,'crna', 5, 'Mini', 35.00, 1),
                            ('BG222KK', 'Opel Corsa', 2010 ,'bela', 5, 'Mini', 35.00, 1),
                            ('BG444LO', 'Suzuki Swift', 2010 ,'siva', 5, 'Mini', 35.00, 1),
                            ('BG693LK', 'Ford Mondeo', 2010 ,'siva', 5, 'Porodicni', 25.00 , 1),
                            ('BG756KJ', 'Opel Vectra', 2014,'siva', 5, 'Porodicni', 25.00 , 1),
                            ('BG452MN', 'Toyota Camry', 2014 ,'siva', 5, 'Porodicni', 25.00 , 1),
                            ('BG230JK', 'VWPassat', 2014,'siva',5 , 'Porodicni', 25.00,1 ),
                            ('BG789YU', 'Renault', 2014 ,'siva', 5, 'Gradski', 15.00 , 1),
                            ('BG326HJ', 'Toyota Aygo', 2014 ,'siva',5 , 'Gradski', 15.00 , 1),
                            ('BG369TY', 'VW Lupo', 2014 ,'crna',5 , 'Gradski', 15.00 , 1),
                            ('BG232OP', 'Ford F-150', 2014 ,'crna', 5, 'pick-up', 15.00 , 1),
                            ('BG330HJ', 'Mitsubishi Triton', 2014 ,'crna',5 , 'pick-up', 15.00 , 1),
                            ('BG987KL', 'Nissan Navara', 2014,'crna', 5, 'pick-up', 15.00 ,1 ),
                            ('BG758YU', 'Ford Focus', 2014 ,'crna',5 , 'Mali porodicni', 15.00 ,1 ),                            
                            ('BG125AV', 'Audi A8', 2010 ,'crna',5 , 'Lux', 80.00, 2),
                            ('BG789PP', 'BMW 7', 2015,'crna', 5, 'Lux', 80.00, 2),
                            ('BG324GG', 'Mercedes S-Class', 2016 ,'bela',5 , 'Lux', 80.00 , 2),
                            ('BG456JJ', 'Buggatti Veyron', 2013,'bela',5 , 'Sportski', 100.00, 2),
                            ('BG236LD', 'Ferrari', 2010,'crna', 5, 'Sportski', 100.00, 2),
                            ('BG563PO', 'Hyundai Accent', 2014 ,'bela', 5, 'Mini', 35.00, 2),
                            ('BG111LO', 'Ford Fiesta', 2010 ,'crna', 5, 'Mini', 35.00, 2),
                            ('BG222IK', 'Opel Corsa', 2010 ,'bela', 5, 'Mini', 35.00,2),
                            ('BG444MM', 'Suzuki Swift', 2010 ,'siva', 5, 'Mini', 35.00, 2),
                            ('BG693TT', 'Ford Mondeo', 2010 ,'siva', 5, 'Porodicni', 25.00 , 2),
                            ('BG756FF', 'Opel Vectra', 2014,'siva', 5, 'Porodicni', 25.00 , 2),
                            ('BG452GY', 'Toyota Camry', 2014 ,'siva', 5, 'Porodicni', 25.00 , 3),
                            ('BG230RG', 'VWPassat', 2014,'siva',5 , 'Porodicni', 25.00,3 ),
                            ('BG789WE', 'Renault', 2014 ,'siva', 5, 'Gradski', 15.00 , 3),
                            ('BG326FG', 'Toyota Aygo', 2014 ,'siva',5 , 'Gradski', 15.00 , 3),
                            ('BG369YU', 'VW Lupo', 2014 ,'crna',5 , 'Gradski', 15.00 , 3),
                            ('BG232SS', 'Ford F-150', 2014 ,'crna', 5, 'pick-up', 15.00 , 3),
                            ('BG330VB', 'Mitsubishi Triton', 2014 ,'crna',5 , 'pick-up', 15.00 , 3),
                            ('BG987UI', 'Nissan Navara', 2014,'crna', 5, 'pick-up', 15.00 ,3 ),
                            ('BG758SS', 'Ford Focus', 2014 ,'crna',5 , 'Mali porodicni', 15.00 ,3 );
                            
insert into Osiguranje (sifra_osiguranja, pokrice_korisnika, pokrice_sl_stete, tip) values 
				(1, 50000.00, 50000.00, 'CDW'), 
				(2, 100000.00, 100000.00, 'SCDW'),
				(3, 100000.00, 100000.00, 'CCI'), 
                            (4, 100000.00, 100000.00, 'ZIM');
    


insert into Rentira (sifra_rentiranja, sifra_korisnika, brRegTablica, datum_pocetka, datum_kraja,ukupna_cena) values
				(1, 1, 'BG125AC', '2017-01-01', '2017-01-07', 0.00),
                            (2, 2, 'BG789SR', '2017-01-07', '2017-01-20', 0.00),
                            (3, 3, 'BG325BG', '2017-02-20', '2017-02-27', 0.00),
                            (4, 4, 'BG326HJ', '2017-04-25', '2017-04-27', 0.00),
                            (5, 5, 'BG987KL', '2017-04-25', '2017-05-12', 0.00),
                            (6, 6, 'BG758YU', '2017-04-26', '2017-04-28', 0.00),
                            (7, 7, 'BG125AV', '2017-04-12', '2017-04-30', 0.00),
                            (8, 8, 'BG111LO', '2017-05-12', '2017-05-30', 0.00),
                            (9, 9, 'BG222IK', '2017-05-13', '2017-06-30', 0.00),
                            (10, 10, 'BG444MM', '2017-05-23', '2017-06-30', 0.00),
                            (11, 21, 'BG230RG', '2017-05-14', '2017-06-30', 0.00),
                            (12, 22, 'BG326FG', '2017-06-12', '2017-06-14', 0.00),
                            (13, 23, 'BG369YU', '2017-06-13', '2017-06-30', 0.00),
                            (14, 24, 'BG232SS', '2017-06-23', '2017-07-12', 0.00),
                            (15, 25, 'BG987UI', '2017-06-23', '2017-07-13', 0.00),
                            (16, 26, 'BG758SS', '2017-07-14', '2017-07-30', 0.00),
                            (17, 27, 'BG444LO', '2017-07-12', '2017-08-10', 0.00),
                            (18, 28, 'BG693LK', '2017-07-30', '2017-08-30', 0.00),
                            (19, 29, 'BG330HJ', '2017-08-12', '2017-09-10', 0.00),
                            (20, 30, 'BG230JK', '2017-08-14', '2017-08-25', 0.00);

insert into Nacin_Placanja (sifra_nacina_placanja, metod) values 
                            (1, 'novac'),
                            (2, 'kartica');

                    
insert into Dodatna_Oprema (sifra_opreme, naziv, cena) values 
				(1, 'Krovni kofer',10.00),
                            (2, 'Sediste za dete',8.00),
                            (3, 'GPS navigacija',5.00),
                            (4, 'Cerada za auto',3.00),
                            (5, 'Nosac za bicikle',5.00);
                        
insert into Rentiranje_opreme (sifra_rentiranja, sifra_opreme) values
				(1, 1),
                            (1, 3),
                            (1, 2),
                            (2, 1),
                            (3, 2),
                            
                            (6, 4),
                            (7, 3),
                            (8, 3),
                            (9, 4),
                            
                            (12, 3),
                            (13, 4),
                            (14, 5),
                            
                            (16, 1),
                            (17, 5),
                            (18, 1),
                            
                            (20, 1);

insert into Ponudjena_Osiguranja (brRegTablica, sifra_osiguranja, cena) values
				('BG125AC', 1, 10.00),
                            ('BG125AC', 2, 15.00),
                            ('BG789SR', 1, 10.00),
				('BG789SR', 3, 20.00),
                            ('BG456HJ', 1, 10.00),
                            ('BG236NB', 1, 10.00),
                            ('BG563IU', 1, 10.00),
                            
                            
                            ('BG325BG', 2, 15.00),
                            ('BG325BG', 3, 20.00),
                            ('BG326HJ', 3, 20.00),
                            ('BG987KL', 4, 25.00),
                            ('BG758YU', 1, 10.00),
                            ('BG125AV', 1, 10.00),
				('BG125AV', 2, 15.00),
                            ('BG111LO', 2, 15.00),
                            ('BG222IK', 3, 20.00),
                            ('BG444MM', 4, 25.00),
                            ('BG230RG', 4, 25.00),
                            ('BG326FG', 3, 20.00),
                            ('BG369YU', 2, 15.00),
                            ('BG232SS', 1, 10.00),
                            ('BG987UI', 1, 10.00),
                            ('BG758SS', 2, 15.00),
                            ('BG444LO', 4, 25.00),
                            ('BG693LK', 4, 25.00),
                            ('BG330HJ', 1, 10.00),
                            ('BG230JK', 2, 15.00),

                            ('BG111KH', 1, 10.00),
                            ('BG222KK', 1, 10.00),
                            ('BG756KJ', 1, 10.00),
                            ('BG452MN', 1, 10.00),
                            ('BG789YU', 1, 10.00),
                            ('BG369TY', 1, 10.00),
                            ('BG232OP', 1, 10.00),

                            ('BG789PP', 1, 10.00),
                            ('BG324GG', 1, 10.00),
                            ('BG456JJ', 1, 10.00),
                            ('BG236LD', 1, 10.00),
                            ('BG563PO', 1, 10.00),

                            ('BG693TT', 1, 10.00),
                            ('BG756FF', 1, 10.00),
                            ('BG452GY', 1, 10.00),
                            ('BG789WE', 1, 10.00),
                            ('BG330VB', 1, 10.00);

                              
                            
insert into Izabrana_Osiguranja(sifra_rentiranja, brRegTablica, sifra_osiguranja) values
				(1, 'BG125AC', 1), 
                            (3, 'BG325BG', 2),
                            (3, 'BG325BG', 3),
                            (4, 'BG326HJ', 3),
                            (5, 'BG987KL', 4),
                            (6, 'BG758YU', 1),
                            (7, 'BG125AV', 1),
				(7, 'BG125AV', 2),
                            (8, 'BG111LO', 2),
                            (9, 'BG222IK', 3),
                            (10, 'BG444MM', 4),
                            (11, 'BG230RG', 4),
                            (12, 'BG326FG', 3),
                            (13, 'BG369YU', 2),
                            (14, 'BG232SS', 1),
                            (15, 'BG987UI', 1),
                            (16, 'BG758SS', 2),
                            (17, 'BG444LO', 4),
                            (18, 'BG693LK', 4),
                            (19, 'BG330HJ', 1),
                            (20, 'BG230JK', 2);
                            
                     