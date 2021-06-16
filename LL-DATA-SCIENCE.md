# Lessons Learned

This is a learning project in order to summarize the insides gained from several learning projects and internet articles.

- [Lessons Learned](#lessons-learned)
  - [Development](#development)
    - [Useful Extensions](#useful-extensions)
    - [Anaconda Installation](#anaconda-installation)
  - [Anaconda environment setup](#anaconda-environment-setup)

## Development

### Useful Extensions

1. "nwolverson.ide-purescript","nwolverson.language-purescript": Default PureScript IDE

### Anaconda Installation

General information is given by [Installing on Linux](https://docs.anaconda.com/anaconda/install/linux/).

1. Install:

   ```sh
   sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
   ```

2. Download [64-Bit Installer](https://www.anaconda.com/products/individual#linux) and install

   ```sh
   bash ~/Downloads/Anaconda3-
   #Do you wish the installer to initialize Anaconda3 by running conda init?yes
   source ~/.bashrc
   ```

## Anaconda environment setup

1. Create

   ```sh
   conda create --name myenv
   conda activate myenv
   ```