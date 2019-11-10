SOURCE_PATH = src/slides.md
OUTPUT_HTML_PATH = dist/slides.html
OUTPUT_PDF_PATH = dist/slides.pdf
OUTPUT_PP_PATH = dist/slides.pptx

usage :
	@grep '^[^#[:space:]].*:' Makefile

install :
	npm install

watch_html :
	npx @marp-team/marp-cli -w ${SOURCE_PATH} -o ${OUTPUT_HTML_PATH}

build_html :
	npx @marp-team/marp-cli ${SOURCE_PATH} -o ${OUTPUT_HTML_PATH}

build_pdf :
	npx @marp-team/marp-cli ${SOURCE_PATH} --pdf --allow-local-files -o ${OUTPUT_PDF_PATH}

build_pp :
	npx @marp-team/marp-cli ${SOURCE_PATH} --pptx --allow-local-files -o ${OUTPUT_PP_PATH}

build_all :
	make build_html && make build_pdf && make build_pp

clean :
	rm ${OUTPUT_HTML_PATH} ${OUTPUT_PDF_PATH} ${OUTPUT_PP_PATH}