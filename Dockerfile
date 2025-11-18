FROM firedrakeproject/firedrake-vanilla-default:2025.10.2
RUN userdel -r ubuntu
ARG NB_USER
ARG NB_UID
ENV USER=${NB_USER}
ENV HOME=/home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

WORKDIR ${HOME}

RUN pip install jupyter notebook
RUN apt update
RUN apt install -yq patchelf
RUN pip install icepack
RUN git clone https://github.com/dlilien/icepackweb.git
