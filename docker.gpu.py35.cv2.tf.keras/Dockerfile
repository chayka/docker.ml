# FROM tensorflow/tensorflow:latest-gpu-py3
FROM tensorflow/tensorflow:latest-devel-gpu-py3

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

# RUN pip install numpy==1.13.0 
RUN pip install numpy

WORKDIR /
ENV OPENCV_VERSION="3.4.1"
RUN git clone -b ${OPENCV_VERSION} --single-branch https://github.com/opencv/opencv.git && \
    git clone -b ${OPENCV_VERSION} --single-branch https://github.com/opencv/opencv_contrib.git && \
    mkdir /opencv/build
ENV CUDA_TOOLKIT_ROOT_DIR="/usr/local/cuda-9.0"
ENV CUDA_LIB_PATH="${CUDA_TOOLKIT_ROOT_DIR}/targets/x86_64-linux/lib"
ENV LD_LIBRARY_PATH="${CUDA_LIB_PATH}:${LD_LIBRARY_PATH}"
RUN apt-get install -y cuda-npp-9-0
RUN cd /opencv/build && \
    cmake -LAH \
        -D WITH_CUDA=ON \
        -D CUDA_TOOLKIT_ROOT_DIR=${CUDA_TOOLKIT_ROOT_DIR} \
        -D CUDA_LIB_PATH=${CUDA_LIB_PATH} \
        -D WITH_OPENGL=ON \
        -D WITH_OPENCL=ON \
        -D WITH_IPP=ON \
        -D WITH_TBB=ON \
        -D WITH_EIGEN=ON \
        -D WITH_V4L=ON \
        -D ENABLE_AVX=ON \
        -D BUILD_TIFF=ON \
        -D BUILD_TESTS=OFF \
        -D BUILD_PERF_TESTS=OFF \
        -D BUILD_opencv_java=OFF \
        -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_INSTALL_PREFIX=$(python3.5 -c "import sys; print(sys.prefix)") \
        -D PYTHON_EXECUTABLE=$(which python3.5) \
        -D PYTHON_INCLUDE_DIR=$(python3.5 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
        -D PYTHON_PACKAGES_PATH=$(python3.5 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
        .. \
    && make install
        # -DCUDA_cublas_LIBRARY="${CUDA_LIB_PTH}/libcublas.so" \
        # -DCUDA_cufft_LIBRARY="${CUDA_LIB_PTH}/libcufft.so" \
        # -DCUDA_nppc_LIBRARY="${CUDA_LIB_PTH}/libnppc.so" \
        # -DCUDA_nppial_LIBRARY="${CUDA_LIB_PTH}/libnppial.so" \
        # -DCUDA_nppicc_LIBRARY="${CUDA_LIB_PTH}/libnppicc.so" \
        # -DCUDA_nppicom_LIBRARY="${CUDA_LIB_PTH}/libnppicom.so" \
        # -DCUDA_nppidei_LIBRARY="${CUDA_LIB_PTH}/libnppidei.so" \
        # -DCUDA_nppif_LIBRARY="${CUDA_LIB_PTH}/libnppif.so" \
        # -DCUDA_nppig_LIBRARY="${CUDA_LIB_PTH}/libnppig.so" \
        # -DCUDA_nppim_LIBRARY="${CUDA_LIB_PTH}/libnppim.so" \
        # -DCUDA_nppist_LIBRARY="${CUDA_LIB_PTH}/libnppist.so" \
        # -DCUDA_nppisu_LIBRARY="${CUDA_LIB_PTH}/libnppisu.so" \
        # -DCUDA_nppitc_LIBRARY="${CUDA_LIB_PTH}/libnppitc.so" \
        # -DCUDA_npps_LIBRARY="${CUDA_LIB_PTH}/libnpps.so" \

RUN pip install scikit-image seaborn theano keras

RUN pip install falcon falcon-cors gunicorn httpie
RUN apt-get install -y python3-tk
