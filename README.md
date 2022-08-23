# Conda-Docker
Activate Conda environment in Docker container

Build Docker container
-`$ docker build --no-cache -t deep_learning_docker .`

Run Docker container
-`$ docker run -it --rm --gpus all -v /PATH/TO/WORKING/DIRECTORY/:/PATH/TO/WORKING/DIRECTORY/ deep_learning_docker`

Activate conda environment
-`$ source activate env_name`

After execution, you will be in the following path:
(env_name) root@############:/PATH/TO/WORKING/DIRECTORY#

