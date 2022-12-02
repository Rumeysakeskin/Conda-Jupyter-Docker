### Conda-Jupyter-Docker

- How to build own **docker container** from **Anaconda** docker image?
- How to create **Conda environment** from a *.yml* file in the docker container?
- How to add the conda environment to the kernel list in **Jupyter notebook**?
- How to launch jupyter notebook from the container?

#### Access the Jupyter notebook from your remote machine over SSH
```
$ ssh -L 2222:localhost:2222 <REMOTE_USER>@<REMOTE_HOST>
```
Note: Also you can access to remote machine without jupyter notebook as following:
```
$ ssh <REMOTE_USER>@<REMOTE_HOST>
```

#### Go to your docker path
```
$ /Path/to/working/directory/docker 
```

#### Create a Dockerfile
```
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
```

#### Build docker container
Note: No need to rebuild once built!
```
$ docker build --no-cache -t deep_learning_docker .
```

#### Run docker container

```
$ PORT=${2222}
$ docker run -it --rm --gpus all -p $PORT:8888 -v /Path/to/working/directory/:/Path/to/working/directory/ deep_learning_docker
```
Note that:
`-it` defines interactive terminal,
`-v` bind mount a volume,
`--gpus all` allow all GPU devices to add to the container and
`-p 2222:8888` publish a container's port(s) to the host.


#### Activate conda environment
```
$ source activate env_name
```

#### After executing the above command we will be in the environment
```
(env_name) root@############:/Path/to/working/directory/#
```
#### Add your environment to the kernel list in jupyter notebook
If reveive `No module named ipykernel`

```
$ pip install ipykernel 
```
Note: No need to rebuild once built!
```
$ python -m ipykernel install --user --name=env_name
```

#### Launch Jupyter notebook with default port from docker container
```
$ jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root
```

#### Enter the URL in your local browser 
To find hostname:
```
$ hostname -I
```
`HOSTNAME=${127.0.0.1}`
Open a browser from your local machine and navigate to `http://${HOSTNAME}:2222/tree` or `127.0.0.1:2222/?token=${TOKEN}`
 and enter your token specified in your terminal.
