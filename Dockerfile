FROM openjdk:7u131-jdk
MAINTAINER Alpheios Project

RUN apt-get update && apt-get install -y curl expect cadaver

WORKDIR /tmp
RUN curl -LO http://downloads.sourceforge.net/exist/Stable/2.2/eXist-db-setup-2.2.jar
RUN curl -L -o treebank.zip https://github.com/alpheios-project/treebank-editor/archive/alpheiosnet.zip
RUN curl -L -o alignment.zip https://github.com/alpheios-project/alignment-editor/archive/master.zip
RUN curl -L -o utils.zip https://github.com/alpheios-project/edit-utils/archive/master.zip
RUN curl -L -o cts.zip https://github.com/alpheios-project/cts-api/archive/master.zip
RUN curl -L -o trees.zip https://github.com/alpheios-project/treebank_data/archive/master.zip
ADD exist-setup.cmd /tmp/exist-setup.cmd
RUN expect -f exist-setup.cmd
RUN rm eXist-db-setup-2.2.jar exist-setup.cmd

EXPOSE 8080 8443
ENV EXIST_HOME /opt/exist
WORKDIR /opt/exist
#ADD alpheios /tmp/alpheios
ADD exist-startup.sh /tmp/exist-startup.sh
RUN /tmp/exist-startup.sh

CMD tools/wrapper/bin/exist.sh console

