#!/bin/bash

cd ~

set -e

wget http://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh
err="$?"
if [ ! $err = 0 ]; then
	echo "Failed to wget anaconda. Install terminated. check internet connection!"
	exit 1
fi

chmod +x ./Anaconda3-4.4.0-Linux-x86_64.sh

./Anaconda3-4.4.0-Linux-x86_64.sh -b
if [ ! $err = 0 ]; then
	echo "Failed to install anaconda. Install terminated."
	exit 1
fi

export PATH=/home/raw0000/anaconda3/bin:$PATH
echo "export PATH=/home/raw0000/anaconda3/bin:$PATH" >> ~/.bashrc

conda install pip -y
if [ ! $? = 0 ]; then
	echo "Failed to install pip using conda. Install terminated."
	exit 1
fi


pip install IBMQuantumExperience
if [ ! -d QCI ] && [ -e QCI ]; then
	echo "Unexpected file named QCI in home directory! Cannot install!"
	exit 1
elif [ ! -d QCI ]; then
	mkdir QCI
fi
cd QCI
echo "Welcome to QCI" > WelcomeToQCI.txt
mkdir IBMQuantumExperienceSDK

git clone https://github.com/IBM/qiskit-sdk-py.git IBMQuantumExperienceSDK/

if [ ! $? = 0 ]; then
	echo "git clone IBMQuantumExperienceSDK failed" 
	exit 1
fi 

pip install iPython

if [ ! $? = 0 ]; then
	echo "install of iPython failed" 
	exit 1
fi 



cd IBMQuantumExperienceSDK/qiskit-sdk-py

make env

make run






