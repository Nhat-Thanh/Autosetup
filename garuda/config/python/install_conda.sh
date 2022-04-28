# install python 3.8
# sudo pacman -Sy python38 --noconfirm 2>/dev/null
# alias python='python3.8'
# sudo pacman -Rcnc python --noconfirm 2>/dev/null
# sudo ln /usr/bin/python3.8 /usr/bin/python
  
# fix pip errors
# wget https://bootstrap.pypa.io/get-pip.py -O config/python/get-pip.py
# python config/python/get-pip.py pip==20.3.4


# install Anaconda
#wget -P /tmp https://repo.anaconda.com/archive/
bash config/python/Anaconda3-2020.07-Linux-x86_64.sh -b -p "~/anaconda3"
source ~/.bashrc

conda activate
conda config --set auto_activate_base false
conda update --all --yes
PACKAGES=$(cat config/python/conda_libs.txt)
for package in ${PACKAGES[*]}; do
	pip install ${package}
done 

conda deactivate
