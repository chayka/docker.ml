FROM tensorflow/tensorflow:latest-gpu-py3

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
ENV OPENCV_VERSION="3.4.0"
RUN git clone -b ${OPENCV_VERSION} --single-branch https://github.com/opencv/opencv.git && \
    git clone -b ${OPENCV_VERSION} --single-branch https://github.com/opencv/opencv_contrib.git && \
    mkdir /opencv/build && \
    cd /opencv/build && \
    cmake -DBUILD_TIFF=ON \
        -DBUILD_opencv_java=OFF \
        -DWITH_CUDA=ON \
        -DENABLE_AVX=ON \
        -DWITH_OPENGL=ON \
        -DWITH_OPENCL=ON \
        -DWITH_IPP=ON \
        -DWITH_TBB=ON \
        -DWITH_EIGEN=ON \
        -DWITH_V4L=ON \
        -DBUILD_TESTS=OFF \
        -DBUILD_PERF_TESTS=OFF \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=$(python3.5 -c "import sys; print(sys.prefix)") \
        -DPYTHON_EXECUTABLE=$(which python3.5) \
        -DPYTHON_INCLUDE_DIR=$(python3.5 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
        -DPYTHON_PACKAGES_PATH=$(python3.5 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") .. \
    && make install

RUN pip install scikit-image seaborn theano keras
RUN pip install falcon falcon-cors gunicorn httpie
