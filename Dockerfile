# baleeneate v0.0.1
FROM debian:wheezy

RUN apt-get update \
&& apt-get -y install autotrace potrace \
&& apt-get -y install default-jdk \ # also install ca-certificates for wget
&& apt-get -y install wget \
&& wget 'http://prdownloads.sourceforge.net/delineate/delineate-0.5.tar.gz?download' -O delineate-0.5.tar.gz \
&& tar xzf delineate-0.5.tar.gz \
&& wget 'http://www.apache.org/dist/xalan/xalan-j/binaries/xalan-j_2_7_2-bin.tar.gz' \
&& tar xzf xalan-j_2_7_2-bin.tar.gz \
&& cd xalan-j_2_7_2 \
&& jar xf xalan.jar org \
&& cd /delineate/0.5 \
&& mv /xalan-j_2_7_2/org org \
&& jar uf delineate.jar org \
&& touch settings/settings-autotrace.prop settings/settings-potrace.prop settings/settings.prop && echo "potrace=/usr/bin/potrace" >> settings/settings.prop && echo "autotrace=/usr/bin/autotrace" >> settings/settings.prop # TODO: create and copy .prop files

WORKDIR /delineate/0.5

CMD exec /usr/bin/java -jar delineate.jar ./settings/parameters-autotrace.xml ./settings/parameters-potrace.xml