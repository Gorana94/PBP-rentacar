DIR = rentacar
PROGRAM = program
SRC = program.c
FLAGS = -g -Wall `mysql_config --cflags --libs`

.PHONY: all create insert beauty dist progs


all: create trigger insert $(PROGRAM)

create:
	mysql -u root -p  <create.sql

trigger: 
	mysql -u root -p  <trigger.sql

insert:
	mysql -u root -p <insert.sql

$(PROGRAM): $(SRC)
	gcc $(SRC) -o $(PROGRAM) $(FLAGS)
	
beauty:
	-indent $(PROGS).c

clean:
	-rm -f *~ $(PROGS)
	
dist: beauty clean
	-tar -czv -C .. -f ../$(DIR).tar.gz $(DIR)
	