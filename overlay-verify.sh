#!/bin/bash

# Compile our overlays against an android framework to ensure there are no compile errors

echo "Cloning Builder"
git clone --quiet --branch=master  https://github.com/PitchedApps/Substratum-Builder-Resources.git   master > /dev/null

overlays=$PWD/substratum/src/main/assets/overlays
printf "Testing overlays at %s" "$overlays"

cd Substratum-Builder-Resources
sh build-overlays.sh "$overlays"    # run builder

if [ -s "builds/log.txt" ]; then    # error occurred
    sh ../generate-apk-release.sh   # this will release the error
fi

echo "Done verification"

exit 1