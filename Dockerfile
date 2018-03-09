FROM openjdk:9-jre

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
    unzip
RUN gem install --no-document asciidoctor --version "${asciidoctor_version}" \
  && gem install --no-document asciidoctor-diagram

WORKDIR /documents
VOLUME /documents

CMD ["/bin/bash"]
