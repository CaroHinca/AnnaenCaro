# Student A: Complete the following Dockerfile
FROM ubuntu:26.10
# Set environment variable to prevent user input by switching to noninteractive mode.
ARG DEBIAN_FRONTEND=noninteractive

# Install the pip command.
RUN apt update \
  && apt install --yes --no-install-recommends \
    python3-pip=26.1.2+dfsg-1 \
    curl=8.20.0-2ubuntu11.1

##########################################################################
# TODO: Install pandas[gcp] and sci-kit learn Python package using `pip`.#
##########################################################################
RUN python3 -m pip install \
  --no-cache-dir \
  --break-system-packages \
  google-cloud-storage==3.17.1 \
  scikit-learn==1.9.1 \
  "pandas[gcp]==3.1.1"

COPY trainer.py /app/
##########################################################################

WORKDIR /app/

ENTRYPOINT ["python3", "/app/trainer.py"]
