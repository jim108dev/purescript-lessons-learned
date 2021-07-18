# Lessons Learned

This is a learning project in order to summarize the insides gained from several learning projects and internet articles.

- [Lessons Learned](#lessons-learned)
  - [Working environment](#working-environment)
    - [SDK](#sdk)
  - [VS Code Extensions](#vs-code-extensions)

## Working environment

### SDK

Source: [Native SDK install on Linux](https://willow.systems/blog/pebble-sdk-installation-guide/).

1. Installation

   ```sh
   sudo apt update && sudo apt upgrade -y

   sudo add-apt-repository universe
   sudo apt update 
   sudo apt install python2 -y

   curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
   sudo python2 get-pip.py

   sudo apt install wget python-dev libsdl1.2debian libfdt1 libpixman-1-0 npm gcc -y

   mkdir -p ~/opt/pebble-dev

   cd ~/opt/pebble-dev
   wget https://rebble-sdk.s3-us-west-2.amazonaws.com/pebble-sdk-4.6-rc2-linux64.tar.bz2
   tar -jxf pebble-sdk-4.6-rc2-linux64.tar.bz2
   cd ~/opt/pebble-dev/pebble-sdk-4.6-rc2-linux64
   
   bash
   python2 -m pip install virtualenv
   python2 -m virtualenv .env
   source .env/bin/activate
   pip install -r requirements.txt
   deactivate

   echo 'export PATH=~/opt/pebble-dev/pebble-sdk-4.6-rc2-linux64/bin:$PATH' >> ~/.bashrc 
   source ~/.bashrc

   pebble sdk install latest
   ```

## VS Code Extensions

1. "willowsystems.pebble-tool": Run command from the UI. Seams to work only with a single workspace.
1. "ms-vscode.cpptools": C/Cpp support. It was only possible to set the SDK path locally with
   1. `.vscode/c_cpp_properties.json`:

   ```json
      "includePath": [
      "~/.pebble-sdk/SDKs/4.3/sdk-core/pebble/aplite/include/**",
      "${workspaceFolder}/**"
      ],
