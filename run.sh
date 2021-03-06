#!/bin/bash

if [[ !(-a bin/) ]]; then
	echo Creating directory for class files...
	mkdir bin
fi

echo Compiling...
javac -g -d bin/ src/*.java

if [[ !(-a bin/Manifest.txt) ]]; then
	echo Creating manifest file...
	printf "Main-Class: Zorkesque\n" > bin/Manifest.txt
fi

cd bin

echo Creating jar file...
jar cfm zorkesque.jar Manifest.txt *.class

echo Opening jar file...
java -cp . -jar zorkesque.jar
