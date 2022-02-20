#!/bin/bash
cat << EOF > _config.yml
title: $(echo ${GITHUB_REPOSITORY} | awk -F '/' '{print $2}')
author: pyiron
logo: logo_dark.png

execute:
  execute_notebooks           : off

html:
    extra_navbar              : Powered by <a href="https://pyiron.org">pyiron</a>

repository:
    url                       : https://github.com/${GITHUB_REPOSITORY}
    path_to_book              : ""

launch_buttons:
  notebook_interface          : jupyterlab
  binderhub_url               : https://mybinder.org

EOF
