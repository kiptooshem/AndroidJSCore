# set INSTALL_LOC
# set ABI
# set PREBUILT
# set CMAKE
# set MAKE
# set PYTHON
# set PERL
# set RUBY
# set BISON
# set GPERF
# set JNI_LIBS
# set PROJECT_ROOT
set -e

mkdir -p ${ABI}/webkit
cd ${ABI}/webkit

$CMAKE -DCMAKE_TOOLCHAIN_FILE=${PROJECT_ROOT}/scripts/android.toolchain.cmake \
-DANDROID_ABI=${ABI} \
-DCMAKE_BUILD_TYPE=MinSizeRel \
-DANDROID_STANDALONE_TOOLCHAIN=${PREBUILT} \
-DANDROID_USE_STLPORT=1 -DENABLE_WEBKIT=0 -ENABLE_WEBCORE=0 -DENABLE_TOOLS=0 \
-DENABLE_WEBKIT=0 -DENABLE_WEBKIT2=0 -DENABLE_API_TESTS=0 -DPORT=Android \
-DCMAKE_FIND_ROOT_PATH=${INSTALL_LOC} \
-DPYTHON_EXECUTABLE=$PYTHON -DPERL_EXECUTABLE=$PERL \
-DRUBY_EXECUTABLE=$RUBY -DENABLE_LLINT=1 -DSHARED_CORE=1 \
-DBISON_EXECUTABLE=$BISON -DGPERF_EXECUTABLE=$GPERF \
-DEXPORT_ONLY_PUBLIC_SYMBOLS=1 -DCMAKE_INSTALL_PREFIX=${JNI_LIBS} \
${PROJECT_ROOT}/webkit

$MAKE -j6 install

