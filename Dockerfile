FROM ubuntu

LABEL MAINTAINERS="Yannick Bröker <ybroeker@techfak.uni-bielefeld.de>"

ARG ASCIIDOCTOR_VERSION="1.5.6.1"
ENV asciidoctor_version=${ASCIIDOCTOR_VERSION}

RUN apt-get update
RUN apt-get install -y \
    bash \
    curl \
    ca-certificates \
    findutils \
    graphviz \
    make \
    ruby \
    ruby-pygments \
    ttf-liberation \
    unzip
#RUN apt-get install -y font-bakoma-ttf

#RUN apt-get install -y  \
#    build-base \
#    libxml2-dev \
#    python2-dev \
#    py2-pip \
#    ruby-dev
RUN gem install --no-document asciidoctor --version "${asciidoctor_version}" \
#  && gem install --no-document asciidoctor-epub3 --version 1.5.0.alpha.7 \
  && gem install --no-document asciidoctor-pdf --version 1.5.0.alpha.16 \
#  && gem install --no-document epubcheck --version 3.0.1 \
#  && gem install --no-document kindlegen --version 3.0.3 \
  && gem install --no-document asciidoctor-revealjs --version 1.1.1 \
  && gem install --no-document asciidoctor-diagram \
  && gem install --no-document asciidoctor-confluence # \
#  && gem install --no-document asciidoctor-mathematical # \
#  && gem install --no-document rake rouge coderay thread_safe slim haml tilt \
#  && pip install --no-cache-dir --upgrade pip \
#  && pip install --no-cache-dir seqdiag actdiag nwdiag 'blockdiag[pdf]' \
#  && apk del -r --no-cache .makedepends

WORKDIR /documents
VOLUME /documents

CMD ["/bin/bash"]
