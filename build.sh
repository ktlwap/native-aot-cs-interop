#!/bin/bash

echo "Building native shared C# library."
dotnet publish ./native-aot-cs-shared/native-aot-cs-shared.csproj --use-current-runtime

echo "Building native C# application - shared object not required during compilation (copying directly after build just to prove it)."
cp ./native-aot-cs-shared/bin/Release/net8.0/linux-x64/native/native-aot-cs-shared.so ./native-aot-cs-console/bin/Release/net8.0/linux-x64/native/libnativecs.so
dotnet publish ./native-aot-cs-console/native-aot-cs-console.csproj -r linux-x64 -c Release

echo "Building native C application - shared object required for linking process."
cp ./native-aot-cs-shared/bin/Release/net8.0/linux-x64/native/native-aot-cs-shared.so ./native-aot-c-console/bin/libnativecs.so
clang -o ./native-aot-c-console/bin/main.o -c ./native-aot-c-console/main.c
clang -o ./native-aot-c-console/bin/main ./native-aot-c-console/bin/main.o -lnativecs -L./native-aot-c-console/bin -Wl,-rpath,./native-aot-c-console/bin

echo "Execute C# application:"
./native-aot-cs-console/bin/Release/net8.0/linux-x64/native/native-aot-cs-console

echo "Execute C application:"
./native-aot-c-console/bin/main