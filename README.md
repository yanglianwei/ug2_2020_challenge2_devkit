# UG2 2020 Challenge 2 Development Kit
This repository contains the development kit for Challenge 2 of the CVPR 2020 UG2 Challenge.

### Tikhonov Reconstruction Code

We provide code to perform Tikhonov reconstruction in _tikhonov_reconstruction_code_. Both Python and Matlab functions are provided. Examples are available in _tikhonov_reconstruction_code/matlab/demo.m_ and _tikhonov/reconstruction_code/python/demo.py_. 

For details on the reconstruction procedure, see the following paper (in particular, Sections III and IV):

https://ieeexplore.ieee.org/document/7517296 (or pre-print available here: https://arxiv.org/abs/1509.00116)

### Sample Submissions

Submissions must be **Docker images** uploaded to Dockerhub. Sample submissions provided by the organizers for each of the subchallenges can be found in the following Dockerhub repository: 

https://hub.docker.com/repository/docker/tanjasper/ug2_2020_samples

We also provide the source Dockerfiles and accompanying scripts in _sample_submissions_. To build the Docker images, simply navigate to the correct subchallenge directory in _sample_submissions_ and run `Docker build -t <image_name> .`.

### Sample Evaluation Code

We also provide sample evaluation code, found in _sample_evaluation_ based on the code we will use to grade your submissions. These can be used to ensure your submission follows the expected format.

For subchallenges 1 and 2, we will run off-the-shelf face verification algorithms on your provided images. For the sample evaluation code, we simply use a dummy face verification algorithm.

In the sample evaluation code, the data we use is based on the validation set provided with the FlatCam Face Dataset (based on subjects 61-87). You may use this data to validate your methods. The actual test data consists of images of subjects not included in the FCFD (but captured in the same manner).

To run the sample evaluation code, follow the corresponding steps:

1. Navigate to _sample_evaluation/challenge2-#_ where # is the subchallenge number.
2. Set the `DOCKER_IMAGE` variable in _sample_evaluation/challenge2-#/evaluate_submissions.sh_ to the name of your Docker image submission in Dockerhub.
3. Run _sample_evaluation/challenge2-#/evaluation_submissions.sh_. The outputs will be placed in _sample_evaluation/challenge2-#/output_. 
