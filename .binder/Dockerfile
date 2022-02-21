FROM muhhassani/precice-workshop:2022-02-21@sha256:d2325b246d0854706a9661b1fbe409ca0a3380338ef1efa831c557007743bd3e
COPY . ${HOME}/

USER root
RUN fix-permissions /home/$DOCKER_USER
USER $DOCKER_UID
