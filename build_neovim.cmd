@echo off
pushd "%USERPROFILE%\code\neovim"

rmdir .deps /s /q
mkdir .deps
cd .deps
cmake  -G Ninja ..\third-party\
ninja
cd ..
rmdir build /s /q
mkdir build
cd build
cmake -G Ninja ..
ninja
ninja install

popd
