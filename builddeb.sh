#!/bin/bash


#
# args TMP_DIR PACKAGE VERSION
#
args=("$@")


echo ${args[0]} ${args[1]} ${args[2]}


TMP_DIR=${args[0]}
PACKAGE=${args[1]}
VERSION=${args[2]}
TOP_DIR=`pwd`

echo "Building debian package."
echo "tmp dir is ${TMP_DIR}"


echo "Creating temp directory ${TMP_DIR}."
rm -rf ${TMP_DIR}
mkdir -p ${TMP_DIR}

if [ -f  ${PACKAGE}-${VERSION}.tar.gz ]
  then
    cp ${PACKAGE}-${VERSION}.tar.gz ${TMP_DIR}
  else
    echo "Source tarball ${PACKAGE}-${VERSION}.tar.gz is not found."
    echo "Can't build debian pakage."
    exit
fi

echo "Unzipping distribtion code in ${TMP_DIR}"

tar -C  ${TMP_DIR} -zxvf ${PACKAGE}-${VERSION}.tar.gz
rm ${PACKAGE}-${VERSION}.tar.gz

mkdir -p ${TMP_DIR}/${PACKAGE}-${VERSION}/debian

cp install/deb/changelog ${TMP_DIR}/${PACKAGE}-${VERSION}/debian
cp install/deb/copyright ${TMP_DIR}/${PACKAGE}-${VERSION}/debian
cp install/deb/control ${TMP_DIR}/${PACKAGE}-${VERSION}/debian
cp install/deb/rules ${TMP_DIR}/${PACKAGE}-${VERSION}/debian

echo "Changing directory to  ${TMP_DIR}"
cd ${TMP_DIR}/${PACKAGE}-${VERSION}

# run configure to generate a makefile
./configure

echo "Generating package enviroment"
# use the -s flag to generate the single binary
#dh_make -s -e hugo.cornelis@gmail.com -f ../${PACKAGE}-${VERSION}.tar.gz
dpkg-buildpackage  -us -uc -rfakeroot

cd ..
echo `pwd`

if [ -e *.deb ] 
  then 
    echo "Debian package build successful"
    echo "- Moving output to ${TOP_DIR}"
    mv -f *.deb ${TOP_DIR}
    mv -f *.dsc ${TOP_DIR}
    mv -f *.changes ${TOP_DIR}
  else
    echo "Debian package build failed."
fi

# moving back to the top directory
cd ${TOP_DIR}

echo "Removing ${TMP_DIR}"
rm -rf ${TMP_DIR}

echo "done"