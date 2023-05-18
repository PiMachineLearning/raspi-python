docker build --build-arg VERSION=$1 -t pimachinelearning/raspi-python:$1 .

docker tag pimachinelearning/raspi-python:$1 pimachinelearning/raspi-python:$1
docker tag pimachinelearning/raspi-python:$1 ghcr.io/pimachinelearning/raspi-python:$1

docker push pimachinelearning/raspi-python:$1
docker push ghcr.io/pimachinelearning/raspi-python:$1