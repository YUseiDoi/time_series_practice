FROM nvcr.io/nvidia/pytorch:21.06-py3
#FROM nvidia/cuda:12.2.2-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

# タイムゾーンを明示的に設定
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && \
    apt install -y \
    wget \
    bzip2 \
    build-essential \
    git \
    git-lfs \
    curl \
    ca-certificates \
    libsndfile1-dev \
    python3.8 \
    python3-pip

COPY requirements.txt /app

RUN pip3 install --no-cache-dir -U pip && \
    pip3 install --no-cache-dir -r requirements.txt

#RUN pip3 install --no-cache-dir torch==2.1.0+cu122 torchvision==0.16.0+cu122 -f https://download.pytorch.org/whl/torch_stable.html
