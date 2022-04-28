PACKAGES=$(cat config/python/global_libs.txt)
   
for package in ${PACKAGES[*]}; do
	pip install ${package}
done 
