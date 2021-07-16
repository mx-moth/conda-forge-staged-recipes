mkdir -p $PREFIX/bin
cp -r . $PREFIX/bin/cmdstan

cd $PREFIX/bin/cmdstan

echo "TBB_CXX_TYPE=$c_compiler"  >> make/local
#echo "TBB_INTERFACE_NEW=true" >> make/local
echo TBB_INC=$PREFIX/include/ >> make/local
echo TBB_LIB=$PREFIX/lib/ >> make/local

cat make/local

make clean-all

make build -j${CPU_COUNT}

