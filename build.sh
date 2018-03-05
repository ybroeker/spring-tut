git submodule init
git submodule update

mkdir html && cp -r adoc/img html || cp -r adoc/img/* html/img
asciidoctor -D html -r asciidoctor-diagram adoc/index.adoc
