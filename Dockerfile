FROM firedrakeproject/firedrake:2025.10.2

### Make tmp home so we don't have permissions issues
ENV HOME=/tmp
WORKDIR ${HOME}

RUN pip install jupyter notebook
RUN apt update
RUN apt install -yq patchelf
RUN pip install icepack
RUN git clone https://github.com/dlilien/icepackweb.git
