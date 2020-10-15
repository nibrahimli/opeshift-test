FROM alpine:latest
LABEL MAINTAINER="Geodis"


RUN ( apk fix     --no-cache || echo "cannot fix."         )                                     && \
    ( apk upgrade --no-cache || echo "cannot upgrade."     )                                     && \
    ( apk cache    -v  clean || echo "cannot clean cache." )                                     && \
      apk add     --no-cache --update --upgrade                

RUN (apk add --no-cache --update --upgrade autoconf automake build-base git libtool pkgconfig)


#LIBPOSTAL init/build/config
RUN mkdir -p /app 
RUN mkdir -p /app/libpostal_data


WORKDIR /app
RUN git clone https://github.com/openvenues/libpostal -b master

RUN git clone https://github.com/openvenues/jpostal -b master


WORKDIR /app/libpostal

RUN ./bootstrap.sh && \
    ./configure --datadir=/app/libpostal_data/ --prefix=/usr  && \
    make -j4 && \
    make install    


#JPOSTAL
WORKDIR /app/jpostal
RUN ./bootstrap.sh && \ 
    ./configure --datadir=/app/libpostal_data/ --prefix=/usr && \   
    make -j4 && \
    make install
