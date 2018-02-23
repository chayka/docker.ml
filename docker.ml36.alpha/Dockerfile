FROM alpine:3.7

# install bash, python, etc
# RUN apk add --no-cache bash python3-dev gcc gfortran build-base wget openblas lapack freetype-dev libpng-dev subversion
RUN apk --no-cache --update-cache add gcc gfortran python3 python3-dev build-base wget freetype-dev libpng-dev openblas-dev

# setup python3
RUN python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    ln -s pip3 /usr/bin/pip && \
    ln -sf /usr/bin/python3 /usr/bin/python && \
    rm -r /root/.cache

RUN pip3 install --upgrade numpy scipy pandas matplotlib
RUN pip3 install --upgrade ipython jupyter seaborn

RUN apk --no-cache --update-cache add libjpeg-turbo-dev zlib-dev
RUN pip3 install --upgrade scikit-learn scikit-image

RUN pip3 install --upgrade theano
RUN pip3 install --upgrade keras

RUN apk --no-cache --update-cache add build-essential openjdk-8-jdk python zip
# RUN pip3 install --upgrade tensorflow tensorflow-tensorboard

# copy requirements.txt for machine learning environment
# COPY requirements.micro.txt /etc/chayka/requirements.txt

# install requirements for machine learning
# RUN pip3 install --upgrade -r /etc/chayka/requirements.txt
