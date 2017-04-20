#!/bin/bash

function breadth_first() {

	local depth=$1
	local breadth=$2
	local path=("")

	for((i=0;i<depth;i++)); do

		for x in "${path[@]}"; do

			temp=""

			for((j=0;j<breadth;j++)); do

				mkdir -p "$3"$x/$j

				temp=(${temp[@]} $x/$j)

			done;

		done;

		path=(${temp[@]})

	done;

}

function depth_first() {

	local depth=$1
	local breadth=$2
	local breadth_changed=0
	local path=$3

	((depth--))

	if [ "$depth" -lt 0 ]; then
		return
	
	else

		while [ "$breadth_changed" -lt "$breadth" ]; do

			mkdir "$path"/$breadth_changed
			depth_first "$depth" "$breadth" "$path"/"$breadth_changed"
			((breadth_changed++))

		done

	fi

}

if [[ "$4" == "depth" ]]; then
	depth_first "$1" "$2" "$3"
fi

if [[ "$4" == "breadth" ]]; then
	breadth_first "$1" "$2" "$3"
fi
