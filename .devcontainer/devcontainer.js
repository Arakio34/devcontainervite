{
  "name": "Jetson ML DL",
  "build": {
    "dockerfile": "../Dockerfile"
  },
  "settings": {
    "terminal.integrated.defaultProfile.linux": "bash"
  },
  "mounts": [
  "source=/home/tueleau/projet/vietnam,target=/home/devuser/vietnam,type=bind,consistency=cached"
  ],
  "extensions": [
    "ms-python.python",
    "ms-toolsai.jupyter"
  ],
  "remoteUser": "devuser"
}
