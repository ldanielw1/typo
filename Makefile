clean:
	-@make cleanTempFiles > /dev/null 2> /dev/null

cleanTempFiles:
	-@rm .*~ *~ \#* 2> /dev/null > /dev/null
	-@for dir in `ls -F | grep -v //$ | grep /$ | cut -d/ -f1`; do cd $$dir; cp ../Makefile .; make clean; rm Makefile; cd .. ;done 2> /dev/null > /dev/null
