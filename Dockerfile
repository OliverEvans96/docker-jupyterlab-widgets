FROM jupyter/scipy-notebook

USER root
RUN apt-get update && apt-get install -y python-igraph
USER jovyan

RUN conda install -c conda-forge jupyterlab=0.32.0 \
                                 ipywidgets=7.2.1 \
                                 ipyvolume=0.4.5 \
                                 bqplot=0.10.2 \
                                 plotly=2.4.1 \
                                 ipyleaflet=0.7.1

RUN pip install python-igraph sympy

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
