# Install the emulator tool
$ANDROID_HOME/tools/bin/sdkmanager --install emulator

# Install an AOSP image that would later be used as the AVD's OS
$ANDROID_HOME/tools/bin/sdkmanager --install "system-images;android-35;google_apis;arm64-v8a"

yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses

# Create an AVD with the image we've previously installed
$ANDROID_HOME/tools/bin/avdmanager --verbose create avd --force --name KDS_API_35 --abi "arm64-v8a" --device "medium_tablet" --package "system-images;android-35;google_apis;arm64-v8a"
$ANDROID_HOME/tools/bin/avdmanager list avd
