FROM pimachinelearning/raspi-os-lite

RUN echo "deb-src http://raspbian.raspberrypi.org/raspbian/ bullseye main contrib non-free rpi" >> /etc/apt/sources.list.d/debsrc.list

RUN apt-get update && apt-get build-dep -y python3 && apt-get install -y pkg-config && apt-get install -y build-essential gdb lcov pkg-config \
      libbz2-dev libffi-dev libgdbm-dev libgdbm-compat-dev liblzma-dev \
      libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev \
      lzma lzma-dev tk-dev uuid-dev zlib1g-dev

ARG VERSION

RUN wget https://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tgz && tar -zxf Python-${VERSION}.tgz

RUN cd Python-${VERSION} && ./configure && make -j$(nproc) && make install

RUN rm -rf Python-${VERSION} Python-${VERSION}.tgz /etc/apt/sources.list.d/debsrc.list

RUN echo "[global]\
extra-index-url=https://www.piwheels.org/simple" > /etc/pip.conf 
# replicate raspberry pi os pip.conf