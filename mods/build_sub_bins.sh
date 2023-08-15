############################################
# Build all the binaries of the submodules
# Preferred to using the old release binaries
#############################################
set -e

SRC_DIR="$(pwd)/../sources"
BINARY_DIR="$(pwd)/../binaries/"


build_cp(){
    echo "[+] Backup up old $1 submodule's Makefile and copying multi-arch one there..."
    mv "$SRC_DIR/$1/Makefile" "$SRC_DIR/$1/Makefile.bak"
    cp "multi-arch_Makefile_$1" "$SRC_DIR/$1/Makefile"

    echo "[+] Building $1 submodule binaries..."
    sleep 2

    cd "$SRC_DIR/$1/"
    make all_arch
    mv $(find . -executable -name $1'*') $BINARY_DIR
    cd -
    echo ""
}

# libnvram.so
build_cp 'libnvram'
build_cp 'console'

echo "[+] Build successful! Check out your new binaries at ../binaries/"
