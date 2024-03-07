#include ../../../make.inc
include .env
build_docker_image:
	echo ${DOCKER_IMAGE_NAME}
	docker build -t ${DOCKER_IMAGE_NAME} .

run_docker_image:
	docker run --rm -it -e PORT=8000 -p 8000:8000 ${DOCKER_IMAGE_NAME}


push_docker_image:
	docker tag "${DOCKER_IMAGE_NAME}" "${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}"
	docker push  "${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}"


deploy_docker_image:
	gcloud run deploy fastapie --image=${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME} --region=europe-west9
