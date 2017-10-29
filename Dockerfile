FROM gitlab/gitlab-runner

ENV QMAKE qmake
ENV PATH $PATH:/opt/qt/5.5/gcc_64/bin/
ADD qt-installer-noninteractive.qs .

RUN apt-get update && apt-get -y install libsm6 libice6 libxext6 libxrender1 libfontconfig1 build-essential \
  && curl -sSL https://download.qt.io/official_releases/online_installers/qt-unified-linux-x64-online.run -o qt.run \
  && chmod +x qt.run \
  && sync \
  && ./qt.run --platform minimal --script qt-installer-noninteractive.qs \
  && rm -rf \
    qt.run \
    /opt/Qt/update.rcc \
    /opt/Qt/components.xml \
    /opt/Qt/InstallationLog.txt \
    /opt/Qt/MaintenanceTool* \
    /opt/Qt/Tools \
    /opt/Qt/Docs \
    /opt/Qt/network.xml \
    /opt/Qt/Examples
