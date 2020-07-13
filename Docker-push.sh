#!/bin/bash
set -o errexit
set -o pipefail
#registry_server='registry here '
registry_path='/pcte-docker-dev-local/services/simplace/'

GLOBAL_TAG=dev

images=(
    "image/name-here:version"
    "image/name-here:version"
    "image/name-here:version"
)

if [ $1 == "save" ]
then
    for img in "${images[@]}"
    do
        image_name="${img%:*}"
        image_tag="${img#*:}"
        docker pull "${image_name}:${image_tag}"
    done
fi


if [ $1 == "package" ]
then
	mkdir -p ./output
    for img in "${images[@]}"
	do
		printf "packaging ${img}\n"
        image_name="${img%:*}"
        image_tag="${img#*:}"
		filename="$(echo ${image_name} |tr '/' '-')"
		docker save -o "./output/${filename}.tar" "${img}"
	done
fi

if [ $1 == "push" ]
then
    for img in "${images[@]}"
    do
        image_name="${img%:*}"
        image_tag="${img#*:}"
        docker tag "${image_name}:${image_tag}" "${registry_server}${registry_path}$image_name:${image_tag}"
        docker push "${registry_server}${registry_path}${image_name}:${image_tag}"
    done
fi
