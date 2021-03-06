DOCKER_IMAGE=tanjasper/ug2_2020_samples:challenge2-1
EVALUATION_DIR=../evaluation_data

# Pull the Docker image
docker pull $DOCKER_IMAGE

# Run the Docker container, mounting the input images and output directory
echo Running submission
docker run --rm -i -t \
    --name ug2_challenge2-1_evaluationA \
    -v $(pwd)/../recon_input/:/root/challenge2-1_test_input:ro \
    -v $(pwd)/outputs/:/root/challenge2-1_test_output \
    -v $(pwd)/run_submissions.sh:/root/run_submissions.sh \
    $DOCKER_IMAGE \
    /bin/bash ./run_submissions.sh
echo Done running submission

docker pull tanjasper/ug2_2020_samples:evaluation

echo Running verification and evaluation
docker run --rm -i -t \
    --name ug2_challenge2-1_evaluationB \
    -v $(pwd)/outputs/:/root/images \
		-v $(pwd)/test_gt.txt/:/root/test_gt.txt \
		-v $(pwd)/test_pairs.txt/:/root/test_pairs.txt \
    tanjasper/ug2_2020_samples:evaluation \
    python evaluate_verification.py --subchallenge 1

echo Evaluation complete
