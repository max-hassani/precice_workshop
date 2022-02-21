FROM muhhassani/precice-workshop:2022-02-21@sha256:9613839a8361844afa104fbbcb5380ac862e9ad07da3cf7d518dffe45453c1f5
COPY . ${HOME}/

USER root
RUN fix-permissions /home/$DOCKER_USER
USER $DOCKER_UID
