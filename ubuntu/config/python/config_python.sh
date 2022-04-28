PACKAGES=$(cat config/python/packages.txt)

for package in ${PACKAGES[*]}; do
	pip install ${package}
done
