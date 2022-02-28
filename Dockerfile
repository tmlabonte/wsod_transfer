FROM pytorch/pytorch:1.7.0-cuda11.0-cudnn8-devel

RUN apt-get update

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get update

RUN apt-get -y install apt-utils git curl ca-certificates bzip2 cmake tree htop bmon iotop g++
RUN apt-get -y install libglib2.0-0 libsm6 libxext6 libxrender-dev vim wget sudo ffmpeg

RUN pip install ipython
RUN pip install requests ninja yacs cython matplotlib opencv-python tqdm
