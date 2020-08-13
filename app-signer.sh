# MD5: 6947527ec0c80da412e71b2fe63da3d6

#!/bin/bash

filename=$1

if [ -f $filename ]; then 
	keytool -genkey -v -keystore my-release-key.keystore -alias new-app -keyalg RSA -keysize 2048 -validity 10000
	jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore my-release-key.keystore $filename new-app

	echo "App is signed"
else
	echo "App is not signed"

fi
