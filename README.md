## Conda-Docker
Conda environments provide a form of isolation: each environment has its own set of C libraries, Python libraries, binaries, and so on. 

#### Access the Jupyter notebook from your remote machine over SSH
```
$ ssh -L 2222:localhost:2222 <REMOTE_USER>@<REMOTE_HOST>
```

#### Go to your docker path
```
$ /PATH/TO/WORKING/DIRECTORY/docker 
```

#### Build docker container
```
$ docker build --no-cache -t deep_learning_docker .
```

#### Run docker container
```
$ docker run -it --rm --gpus all -p 2222:8888 -v /PATH/TO/WORKING/DIRECTORY/:/PATH/TO/WORKING/DIRECTORY/ deep_learning_docker
```

#### Activate conda environment
```
$ source activate env_name
```

#### After execution, you will be in the following path
```
(env_name) root@############:/PATH/TO/WORKING/DIRECTORY#
```

#### Launch Jupyter notebook with default port
```
$ jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root
```

#### Enter the URL in your local browser 
`http://127.0.0.1:2222/tree`

Finally, enter your token specified in your terminal.









