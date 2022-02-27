FROM pytorch/pytorch:1.7.0-cuda11.0-cudnn8-devel

RUN apt-get update

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get update

RUN apt-get -y install apt-utils git curl ca-certificates bzip2 cmake tree htop bmon iotop g++
RUN apt-get -y install libglib2.0-0 libsm6 libxext6 libxrender-dev vim wget sudo ffmpeg

RUN pip install ipython
RUN pip install requests ninja yacs cython matplotlib opencv-python tqdm

#RUN git clone https://github.com/cocodataset/cocoapi.git && cd cocoapi/PythonAPI && python setup.py build_ext install
#RUN git clone https://github.com/NVIDIA/apex.git && cd apex && python setup.py install --cuda_ext --cpp_ext --fast_layer_norm
#ARG FORCE_CUDA="1"
#ENV FORCE_CUDA=${FORCE_CUDA}
#RUN git clone https://github.com/facebookresearch/maskrcnn-benchmark.git && cd maskrcnn-benchmark && python setup.py build develop

RUN wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get -y update
RUN apt-get -y install blobfuse libcurl3-gnutls

RUN mkdir /mnt/resource/blobfusetmp -p
RUN mkdir /mnt/cvgroupsouthcentral -p
