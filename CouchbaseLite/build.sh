#!/bin/bash
set -e

BUILD=../build
DST=SQLCipher

#rm -rf $BUILD
rm -rf $DST

pushd ..
xcodebuild -sdk macosx10.10
xcodebuild -sdk iphoneos8.1
xcodebuild -sdk iphonesimulator8.1
popd

echo "Copying built libraries to '$DST' ..."
mkdir $DST
cp $BUILD/Release/libsqlcipher.a $DST/libsqlcipher-macos.a
lipo -create $BUILD/Release-iphoneos/libsqlcipher.a $BUILD/Release-iphonesimulator/libsqlcipher.a \
	 -output $DST/libsqlcipher-ios.a
cp README-CouchbaseLite.md $DST/README.md

echo "Done!"