FROM pytorch/pytorch:1.8.1-cuda11.1-cudnn8-runtime

ADD . /code
COPY . /code
WORKDIR /code
#COPY requirements.txt ./requirements.txt
RUN apt-get update && apt-get install -y git && apt-get install -y curl
RUN pip install -r requirements.txt
EXPOSE 8501

#CMD [ "git", "clone https://github.com/eftSharptooth/vqgan-clip-app" ]
#CMD [ "cd", "vqgan-clipp-app" ]
#RUN pip install -r requirements.txt
CMD [ "git", "clone https://github.com/openai/CLIP" ]
CMD [ "pip", "install -r requirements.txt" ]
CMD [ "cd", "code" ]
CMD [ "git", "clone https://github.com/CompVis/taming-transformers" ]
#ADD app.py /
#ADD gallery.py /
#ADD logic.py /
#ADD gallery_utils.py /
#ADD vqgan_utils.py /
#CMD [ "sh", "download-weights.sh" ]

ENTRYPOINT ["streamlit", "run"]

CMD ["app.py"]
