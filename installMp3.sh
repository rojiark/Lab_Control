
mkdir tmpMP3
cd tmpMP3

echo "acomodar entorno"
source ${HOME}/ti-sdk-beagleboard-06.00.00.00/linux-devkit/environment-setup 

echo "instalar libmad"

wget http://ftp.de.debian.org/debian/pool/main/libm/libmad/libmad_0.15.1b.orig.tar.gz
tar -xzvf libmad_0.15.1b.orig.tar.gz 
cd libmad-0.15.1b/

./configure --host=arm-none-linux --enable-shared --prefix=${HOME}/ti-sdk-beagleboard-06.00.00.00/targetNFS/usr
make install

cd ..
echo "instalar libid3tag"

wget http://ftp.de.debian.org/debian/pool/main/libi/libid3tag/libid3tag_0.15.1b.orig.tar.gz
tar -xzvf libid3tag_0.15.1b.orig.tar.gz 

cd libid3tag-0.15.1b/
./configure --host=arm-none-linux --enable-shared --prefix=${HOME}/ti-sdk-beagleboard-06.00.00.00/targetNFS/usr
make install

cd ..

echo "instalar ugly con mad"
wget http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-0.10.19.tar.xz
tar -xJf gst-plugins-ugly-0.10.19.tar.xz

cd gst-plugins-ugly-0.10.19/

./configure --host=arm-none-linux --enable-shared --prefix=${HOME}/ti-sdk-beagleboard-06.00.00.00/targetNFS/usr/ CFLAGS="-I${HOME}/ti-sdk-beagleboard-06.00.00.00/targetNFS/usr/include" LIBS="-L${HOME}/ti-sdk-beagleboard-06.00.00.00/targetNFS/usr/lib"
make install

cd ../..

echo "clean...."
rm -r tmpMP3


echo "terminó"
