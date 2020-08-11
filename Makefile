IMAGE_NAME=chimebcast
IMAGE_VERSION=latest
CONTAINER_NAME=chimebcast
IMAGE_LABEL=$(IMAGE_NAME):$(IMAGE_VERSION)

all: image

image:
	docker image build -t $(IMAGE_LABEL) .

run:
	docker run --rm --shm-size 2g -e "MEETING_URL=$(MEETING_URL)" -e "RTMP_URL=$(RTMP_URL)" --name $(CONTAINER_NAME) $(IMAGE_LABEL) 2>&1 | tee $(CONTAINER_NAME).log

.PHONY: all image run
