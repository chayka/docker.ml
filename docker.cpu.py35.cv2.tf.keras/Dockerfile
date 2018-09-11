FROM tensorflow/tensorflow:latest-py3

RUN apt-get update && \
        apt-get install -y \
        build-essential \
        cmake \
        git \
        wget \
        unzip \
        yasm \
        pkg-config \
        libswscale-dev \
        libtbb2 \
        libtbb-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libjasper-dev \
        libavformat-dev \
        libpq-dev

RUN pip install numpy==1.13.0 

WORKDIR /
ENV OPENCV_VERSION="3.4.3"

RUN git clone -b ${OPENCV_VERSION} --single-branch https://github.com/opencv/opencv.git && \
    git clone -b ${OPENCV_VERSION} --single-branch https://github.com/opencv/opencv_contrib.git && \
    mkdir /opencv/build
    
RUN cd /opencv/build && \
    cmake -DBUILD_TIFF=ON \
        -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
        -D BUILD_opencv_java=OFF \
        -D WITH_CUDA=OFF \
        -D ENABLE_AVX=ON \
        -D WITH_OPENGL=ON \
        -D WITH_OPENCL=ON \
        -D WITH_IPP=ON \
        -D WITH_TBB=ON \
        -D WITH_EIGEN=ON \
        -D WITH_V4L=ON \
        -D BUILD_TESTS=OFF \
        -D BUILD_PERF_TESTS=OFF \
        -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_INSTALL_PREFIX=$(python3.5 -c "import sys; print(sys.prefix)") \
        -D PYTHON_EXECUTABLE=$(which python3.5) \
        -D PYTHON_INCLUDE_DIR=$(python3.5 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
        -D PYTHON_PACKAGES_PATH=$(python3.5 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") .. \
    && make install

RUN pip install scikit-image seaborn theano keras
RUN pip install falcon falcon-cors falcon-auth PyJWT cryptography gunicorn httpie
RUN apt-get install -y python3-tk
