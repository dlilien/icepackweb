FROM firedrakeproject/firedrake:2025.10.2
RUN pip install jupyter
RUN apt update
RUN apt install -yq patchelf
RUN pip install icepack
