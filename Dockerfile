FROM show0k/alpine-miniconda
COPY widgets-env.txt .
RUN conda env create -f widgets-env.txt
RUN source activate widgets
CMD ['jupyter', 'lab', '--no-browser']
