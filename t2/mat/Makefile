all: data.txt tabs convert

tabs: octave.log
	$(eval OCTABS=$(shell grep _TAB $< | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(OCTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' $<|grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' > $i_tab.tex;)

octave.log: script_octave.m
	octave $< > $@

data.txt: t2_datagen.py
	python $< > $@

convert: 
	ls *.eps | awk '{system("epstopdf "$$0 )}'

clean:
	@rm -f data.txt octave.log octave-workspace *.eps *.tex *.cir *.pdf *~

.PHONY: clean
