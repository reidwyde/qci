cd ~

set -e

sudo apt-get -y install python3-pip
if [ ! $? = 0 ]; then
echo "python3 failed to install"
fi

pip3 install IBMQuantumExperience
if [ ! $? = 0 ]; then
echo "IBMQuantumExperience failed to install"
fi

pip3 install qiskit
if [ ! $? = 0 ]; then
echo "qiskit failed to install"
fi

pip3 install matplotlib
if [ ! $? = 0 ]; then
echo "matplotlib failed to install"
fi

pip3 install numpy
if [ ! $? = 0 ]; then
echo "numpy failed to install"
fi



if [ ! -d QCI ] && [ -e QCI ]; then
echo "Unexpected file named QCI in home directory! Cannot install!"
exit 1
elif [ ! -d QCI ]; then
mkdir QCI
fi

pip3 install iPython

if [ ! $? = 0 ]; then
echo "install of iPython failed" 
exit 1
fi 

pip3 install jupyter

if [ ! $? = 0 ]; then
echo "install of jupyter failed" 
exit 1
fi 


cd QCI
echo "Welcome to QCI" > WelcomeToQCI.txt


mkdir IBMQuantumExperienceDeveloperSDK

cd IBMQuantumExperienceDeveloperSDK

git clone https://github.com/IBM/qiskit-sdk-py.git
cd qiskit-sdk-py

if [ ! $? = 0 ]; then
echo "git clone IBMQuantumExperienceSDK failed" 
exit 1
fi 

cd ~/QCI

mkdir IBMQuantumExperienceTutorials
cd IBMQuantumExperienceTutorials

git clone https://github.com/QISKit/qiskit-tutorial

cd qiskit-tutorial

jupyter notebook --allow-root

if [ ! $? = 0 ]; then
echo "jupyter notebook launch failed" 
exit 1
fi 





