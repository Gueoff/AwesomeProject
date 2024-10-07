# Launch the emulator!
$ANDROID_HOME/emulator/emulator -verbose -no-boot-anim @KDS_API_35 &

# Wait for the emulator to boot up completely.
# This script is actually a bit naive. There are various suggestions out there
# as to make this more robust. One alternative is to utilize the "adb wait-for-device" command.
booted=0
while [ "$booted" != "1" ]
do
  echo "Waiting for emulator..."
  booted=`$ANDROID_HOME/platform-tools/adb shell getprop dev.bootcomplete`
  sleep 1
done

# Wait for running processes to cool down.
# Run:
$ANDROID_HOME/platform-tools/adb shell top
