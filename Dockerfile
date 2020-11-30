FROM continuumio/miniconda:latest

RUN pip install --upgrade pip

WORKDIR /app

COPY environment.yml ./
COPY run.py ./
COPY boot.sh ./

RUN chmod +x boot.sh

RUN conda env create -f environment.yml

RUN echo "source activate anaconda_docker_flask" > ~/.bashrc
ENV PATH /opt/conda/envs/anaconda_docker_flask/bin:$PATH

EXPOSE 5000

ENTRYPOINT ["./boot.sh"]

