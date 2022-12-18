all:
	rm -rf  *~ */*~ src/*.beam tests/*.beam;
	rm -rf erl_cra*;
	rm -rf rebar.lock;
	rm -rf ebin;
	mkdir ebin;
	rebar3 compile;	
	cp _build/default/lib/*/ebin/* ebin;
	erlc -I include -o ebin src/*.erl;
	erlc -I ../../services/hw_conbee/include -o ebin ../../services/hw_conbee/src/*.erl;
	mkdir tests_ebin;
	erlc -I include -o tests_ebin tests/*.erl;	
	rm -rf tests_ebin;
	git add -f *;
	git commit -m $(m);
	git push;
	echo Ok there you go!
clean:
	rm -rf  *~ */*~ src/*.beam tests/*.beam;
	rm -rf erl_cra*;
	rm -rf ebin;
build:
	rm -rf  *~ */*~ src/*.beam tests/*.beam;
	rm -rf erl_cra*;
	rm -rf ebin;
	mkdir ebin;
	rm -rf rebar.lock;
	rebar3 compile;	
	cp _build/default/lib/*/ebin/* ebin;
	rm -rf _build;
	rm -rf tests_ebin;
eunit:
	rm -rf  *~ */*~ src/*.beam tests/*.beam;
	rm -rf erl_cra*;
	rm -rf tests_ebin;
	rm -rf rebar.lock;
	rm -rf ebin;
#	tests 
	mkdir tests_ebin;
	erlc -I include -o tests_ebin tests/*.erl;
#	application
	mkdir ebin;	
	rebar3 compile;	
	cp _build/default/lib/*/ebin/* ebin;
	rm -rf _build;
	erl -pa ebin -pa tests_ebin\
	    -sname math_test -run $(m) start -setcookie cookie_test
