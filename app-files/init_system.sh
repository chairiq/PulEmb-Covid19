#!/bin/bash

git clone https://github.com/AlexeyAB/darknet

cd darknet
sed -i 's/OPENCV=0/OPENCV=1/' Makefile
sed -i 's/GPU=0/GPU=1/' Makefile
sed -i 's/CUDNN=0/CUDNN=1/' Makefile
sed -i 's/CUDNN_HALF=0/CUDNN_HALF=1/' Makefile
sed -i '0,/assert(x < m.w && y < m.h && c < m.c)/s//\/\/assert(x \< m.w \&\& y \< m.h \&\& c \< m.c)/' src/image.c

/usr/local/cuda/bin/nvcc --version

make

mv /content/PulEmb-Covid19/support-files/yolov4-ctscans.cfg cfg/yolov4-ctscans.cfg
mv /content/PulEmb-Covid19/support-files/ctscans.names ./data
mv /content/PulEmb-Covid19/support-files/ctscans.data  ./data
mv /content/PulEmb-Covid19/models/yolov4-ctscans_best.weights ./data
tar -xzvf /content/PulEmb-Covid19/models/classification_model.tar -C /content/darknet/
