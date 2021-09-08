FROM rocker/tidyverse:4.0.5

# RUN apt-get update &&\
#     DEBIAN_FRONTEND=noninteractive ACCEPT_EULA=Y apt-get install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" --no-install-recommends \
#     vim emacs ess xorg xauth x11-apps dbus-x11 at-spi2-core\
#     texlive-full texmaker

RUN install2.r ALE AzureAuth AzureRMR AzureStor BART carrier cir data.table dplyr formattable ggpot2 glmnet gridExtra iml interactions kernlab lme4 lmtest \
    magrittr MASS mlflow odbc plotly randomForest ranger reshape3 rgenoud robustbase RODBC sandwich scales shinydashboard splines tidyverse xgboost zoo

RUN apt-get update &&\
    DEBIAN_FRONTEND=noninteractive ACCEPT_EULA=Y apt-get install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" --no-install-recommends \
    python3 python3-pip python3.8-venv \
    curl

ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/BIN:$PATH"
RUN python3 -m venv $VIRTUAL_ENV
RUN echo "PATH=${PATH}" >> ${R_HOME}/etc/Renviron.site

COPY resources/R /

RUN pip install wheel --upgrade
RUN pip install notebook
# needs to build from source to install libzmq correctly
RUN install2.r -r "https://cloud.r-project.org/" IRkernel &&\
    Rscript -e "IRkernel::installspec()"

# azure cli
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

RUN pip install mlflow azure-storage-blob azure-identity --upgrade
ENV AZURE_STORAGE_CLI_LOGIN=TRUE
ENV MLFLOW_BIN=${VIRTUAL_ENV}/bin/mlflow
ENV MLFLOW_PYTHON_BIN=${VIRTUALENV}/bin/python
RUN echo "MLFLOW_BIN=${MLFLOW_BIN}" >> ${R_HOME}/etc/Renviron.site &&\
    echo "MLFLOW_PYTHON_BIN=${MLFLOW_PYTHON_BIN}" >> ${R_HOME}/etc/Renviron.site &&\
    echo "AZURE_STORAGE_CLI_LOGIN=TRUE" >> ${R_HOME}/etc/Renviron.site &&\
    echo "PATH=${PATH}" >> ${R_HOME}/etc/Renviron.site