FROM jupyter/scipy-notebook

USER root

RUN conda install --quiet --yes \
    opencv \
    libopencv \
    py-opencv \
    pyvips && \
    conda clean --all -f -y && \
    npm cache clean --force && \
    #jupyter notebook --generate-config && \
    rm -rf $CONDA_DIR/share/jupyter/lab/staging && \
    rm -rf /home/$NB_USER/.cache/yarn && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

USER $NB_UID
