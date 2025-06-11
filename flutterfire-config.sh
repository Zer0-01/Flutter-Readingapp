#!/bin/bash
# Script to generate Firebase configuration files for different environments/flavors
# Feel free to reuse and adapt this script for your own projects

if [[ $# -eq 0 ]]; then
  echo "Error: No environment specified. Use 'dev', 'stag', or 'prod'."
  exit 1
fi

case $1 in
  dev)
    flutterfire config \
      --project=flutter-iseba-dev \
      --out=lib/firebase_options_dev.dart \
      --ios-bundle-id=com.anas.iseba.dev \
      --ios-out=ios/flavors/dev/GoogleService-Info.plist \
      --android-package-name=com.anas.iseba.dev \
      --android-out=android/app/src/dev/google-services.json
    ;;
  stag)
    flutterfire config \
      --project=flutter-iseba-stag \
      --out=lib/firebase_options_stag.dart \
      --ios-bundle-id=com.anas.iseba.stag \
      --ios-out=ios/flavors/stag/GoogleService-Info.plist \
      --android-package-name=com.anas.iseba.stag \
      --android-out=android/app/src/stag/google-services.json
    ;;
  prod)
    flutterfire config \
      --project=flutter-iseba-prod \
      --out=lib/firebase_options_prod.dart \
      --ios-bundle-id=com.anas.iseba \
      --ios-out=ios/flavors/prod/GoogleService-Info.plist \
      --android-package-name=com.anas.iseba \
      --android-out=android/app/src/prod/google-services.json
    ;;
  *)
    echo "Error: Invalid environment specified. Use 'dev', 'stag', or 'prod'."
    exit 1
    ;;
esac