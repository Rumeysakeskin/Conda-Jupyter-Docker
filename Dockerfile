# Install anaconda
FROM continuumio/anaconda

# Set working directory for the project
WORKDIR /Path/to/working/directory/

# Install packages to new conda environment
COPY environment.yml .
RUN conda env create -f environment.yml

# Set PATH environment variables
ENV PATH /opt/conda/envs/env_name:$PATH 


