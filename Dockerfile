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

RUN apt update
RUN apt install -yq patchelf gmsh
RUN pip install jupyter notebook pygmsh
RUN pip install rioxarray xarray rasterio pandas geopandas
RUN pip install ipykernel ipywidgets
RUN git clone https://github.com/icepack/icepack.git
RUN pip install --editable ./icepack
RUN git clone https://github.com/dlilien/icepackweb.git
WORKDIR ${HOME}/icepackweb
