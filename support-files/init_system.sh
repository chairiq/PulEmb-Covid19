#!/bin/bash
rm shared_data.zip

git clone https://github.com/AlexeyAB/darknet

cd darknet
sed -i 's/OPENCV=0/OPENCV=1/' Makefile
sed -i 's/GPU=0/GPU=1/' Makefile
sed -i 's/CUDNN=0/CUDNN=1/' Makefile
sed -i 's/CUDNN_HALF=0/CUDNN_HALF=1/' Makefile
sed -i '0,/assert(x < m.w && y < m.h && c < m.c)/s//\/\/assert(x \< m.w \&\& y \< m.h \&\& c \< m.c)/' src/image.c

/usr/local/cuda/bin/nvcc --version

make

mv /content/shared_data/yolov4-ctscans.cfg cfg/yolov4-ctscans.cfg
mv /content/shared_data/ctscans.names ./data
mv /content/shared_data/ctscans.data  ./data
mv /content/shared_data/ctscans.data  ./data
mv /content/shared_data/yolov4-ctscans_best.weights ./data
mv /content/shared_data/classification_model  ./classification_model