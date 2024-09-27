# Use Ubuntu as the base image
FROM ubuntu:20.04
LABEL maintainer="Jordan Hayes jordanhayes98@gmail.com"

# Configure timezone
ENV DEBIAN_FRONTEND=noninteractive 
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/"$TZ" /etc/localtime && echo "$TZ" > /etc/timezone

# Update and install basic packages
RUN apt-get update && \
    apt-get install -y \
        build-essential \
        gdb \
        git \
        nano \
        openssh-server \
        pkg-config \
        systemd-coredump \
        valgrind && \
    apt-get clean

# GCC 13
RUN echo "************************ GCC 13 ************************" && \
    apt-get update && \    
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
    apt-get update && \
    apt-get install -y gcc-13 g++-13 && \
    apt-get clean

# Clang-Format
RUN echo "********************* Clang-Format *********************" && \
    apt-get update && \
    apt-get install -y clang-format && \
    apt-get clean

# NodeJs (SonarLint)
RUN echo "************************ NodeJs ************************" && \
    apt-get update && \
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean

# CMake 3.28
RUN echo "************************ CMake ************************" && \
    apt-get update && \
    apt-get install -y wget && \
    wget https://github.com/Kitware/CMake/releases/download/v3.28.0/cmake-3.28.0-Linux-x86_64.tar.gz && \
    tar -xf cmake-3.28.0-Linux-x86_64.tar.gz && \
    mv cmake-3.28.0-linux-x86_64 /opt/cmake-3.28.0 && \
    ln -s /opt/cmake-3.28.0/bin/cmake /usr/local/bin/cmake && \
    ln -s /opt/cmake-3.28.0/bin/ctest /usr/local/bin/ctest && \
    apt-get clean

# Ninja
RUN echo "************************ Ninja ************************"
ADD https://github.com/ninja-build/ninja/releases/latest/download/ninja-linux.zip ninja-linux.zip
RUN apt-get update && \
    apt-get install -y unzip && \
    unzip ninja-linux.zip -d /usr/local/bin/ && \
    rm ninja-linux.zip && \
    apt-get clean

# Google Benchmark
RUN echo "****************** Google Benchmark *******************"
RUN git clone https://github.com/google/benchmark
RUN mkdir -p  /benchmark/build
WORKDIR "/benchmark/build"
RUN cmake -DCMAKE_CXX_FLAGS=-std=c++1z \
          -DBENCHMARK_DOWNLOAD_DEPENDENCIES=TRUE \
          -DCMAKE_BUILD_TYPE=Release \
          -DBUILD_SHARED_LIBS=ON ../ && \
    cmake --build . --parallel && \
    cmake --install .
WORKDIR "/"
RUN rm -rf benchmark

# Google Test
RUN echo "********************* Google Test *********************"
RUN git clone https://github.com/google/googletest
RUN mkdir -p /googletest/build
WORKDIR "/googletest/build"
RUN cmake -DCMAKE_CXX_FLAGS=-std=c++1z \
          -DCMAKE_BUILD_TYPE=Release \
          -DBUILD_SHARED_LIBS=ON ../ && \
    cmake --build . --parallel && \
    cmake --install .
WORKDIR "/"
RUN rm -rf googletest

# Uninstall standard version of GCC
RUN apt-get remove -y gcc-9 g++-9
