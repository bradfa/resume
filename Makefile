OUTPUT=resume-andrewbradford.pdf
HTML=$(patsubst %.pdf,%.html,$(OUTPUT))

$(OUTPUT): $(HTML)
	htmldoc -t pdf14 $^ --no-title --no-toc --outfile $@ --size Letter --footer "" --fontsize 12 --top 0.5in --bottom 0.5in --left 0.75in --right 1.25in --linkstyle plain --linkcolor blue

$(HTML): resume.md
	pandoc -o $@ $^ --email-obfuscation=none

.PHONY: clean
clean:
	rm -rf $(OUTPUT) $(HTML)
