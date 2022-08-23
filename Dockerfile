# Install anaconda
FROM continuumio/anaconda

# Set working directory for the project
WORKDIR /Path/to/working/directory/

# Create new environment named as "env_name"
RUN conda create -n env_name python=3.7

# Install packages to new conda environment
COPY environment.yml .
RUN conda env create -f environment.yml

RUN echo "source activate env_name" > ~/.bashrc

# Set PATH environment variables
ENV PATH /opt/conda/envs/env_name:$PATH 


