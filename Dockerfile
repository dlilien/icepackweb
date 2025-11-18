FROM firedrakeproject/firedrake:2025.10.2
ARG NB_USER
ARG NB_UID
ENV USER=${NB_USER}
ENV HOME=/home/${NB_USER}

WORKDIR ${HOME}

RUN pip install jupyter notebook
RUN apt update
RUN apt install -yq patchelf
RUN pip install icepack
RUN git clone https://github.com/dlilien/icepackweb.git
