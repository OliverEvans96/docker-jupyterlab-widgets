FROM jupyter/scipy-notebook

USER root
RUN apt-get update && apt-get install -y python-igraph
USER jovyan

RUN conda install -c conda-forge jupyterlab=0.32.0
RUN conda install -c conda-forge ipywidgets=7.2.1
RUN conda install -c conda-forge ipyvolume=0.4.5
RUN conda install -c conda-forge bqplot=0.10.2
RUN conda install -c conda-forge plotly=2.4.1
RUN conda install -c conda-forge ipyleaflet=0.7.1

RUN pip install python-igraph

RUN jupyter labextension install \
    @jupyter-widgets/jupyterlab-manager@0.35.0 \
# "Not a valid origin" error. I guess I'm missing a cert or something
#    @jupyterlab/google-drive@0.12.0 \
    @jupyterlab/plotly-extension@0.14.4 \
    bqplot@0.3.6 \
    ipyvolume@0.4.5 \
    jupyter-leaflet@0.7.1 \
    jupyterlab_vim@0.7.0

COPY WidgetTest.ipynb /home/jovyan

CMD ["start.sh", "jupyter", "lab"]
