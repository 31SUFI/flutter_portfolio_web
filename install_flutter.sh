#!/bin/bash

# Clone Flutter stable branch
git clone https://github.com/flutter/flutter.git -b stable --depth 1
export PATH="$PATH:`pwd`/flutter/bin"

# Run flutter doctor to complete installation
flutter doctor

# Enable web support for Flutter
flutter config --enable-web
