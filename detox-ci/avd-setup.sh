# in my .zshrc file
# export ANDROID_HOME=/Users/geoffreydesbrosses/Library/Android/sdk
# path=("${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools" $path)
# export PATH=$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH


# Install the emulator tool
sdkmanager --install emulator

# Install an AOSP image that would later be used as the AVD's OS
sdkmanager --install "system-images;android-29;default;x86_64"

# Accept all licenses...
sdkmanager --licenses
# To do that automatically in a script, try this:
yes | sdkmanager --licenses

# Create an AVD with the image we've previously installed
avdmanager --verbose create avd --force --name Pixel_4_API_29 --abi x86_64 --device "pixel" --package "system-images;android-29;default;x86_64"

# (optional) Review your brand new AVD:
avdmanager list avd
