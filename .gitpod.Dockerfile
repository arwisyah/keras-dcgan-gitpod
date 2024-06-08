FROM gitpod/workspace-full

USER gitpod

# Install Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    bash ~/miniconda.sh -b -p $HOME/miniconda && \
    rm ~/miniconda.sh

# Create a Python 3.6 environment
RUN ~/miniconda/bin/conda create -n dcgan_env python=3.6

# Make RUN commands use the new environment
ENV PATH /home/gitpod/miniconda/envs/dcgan_env/bin:$PATH
ENV CONDA_DEFAULT_ENV dcgan_env

# Install Python packages
ADD environment.yml environment.yml
RUN conda env update --name dcgan_env --file environment.yml