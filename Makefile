OUTPUT=resume-andrewbradford.pdf
HTML=$(patsubst %.pdf,%.html,$(OUTPUT))

$(OUTPUT): $(HTML)
	htmldoc -t pdf14 $^ --no-title --no-toc --outfile $@ --footer "" --fontsize 10 --fontspacing 1 --top 10 --bottom 0 --linkstyle plain --linkcolor blue

$(HTML): resume.md
	pandoc -o $@ $^ --email-obfuscation=none

.PHONY: clean
clean:
	rm -rf $(OUTPUT) $(HTML)
