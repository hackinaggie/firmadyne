############################################
# Build all the binaries of the submodules
# Preferred to using the old release binaries
#############################################
set -e

SRC_DIR="$(pwd)/sources"
BINARY_DIR="$(pwd)/binaries/"

# libnvram.so
echo "[+] Building libNVRAM submodule..."
sleep 2
cd $SRC_DIR/libnvram/
make all_arch
mv libnvram_*.so $BINARY_DIR

# console
echo ""
echo "[+] Building Console submodule..."
sleep 2
cd $SRC_DIR/console/
make all_arch
mv console_* $BINARY_DIR

echo "[+] Build successful!"
