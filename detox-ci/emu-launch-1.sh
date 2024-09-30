# Launch the emulator!
./emulator/emulator -verbose -no-boot-anim @Pixel_4_API_29 &
# (or, if running on a headless machine)
./emulator/emulator -verbose -no-boot-anim -no-audio -no-window -gpu swiftshader_indirect @Pixel_4_API_29 &

# Wait for the emulator to boot up completely.
# This script is actually a bit naive. There are various suggestions out there
# as to make this more robust. One alternative is to utilize the "adb wait-for-device" command.
booted=0
while [ "$booted" != "1" ]
do
  echo "Waiting for emulator..."
  booted=`./platform-tools/adb shell getprop dev.bootcomplete`
  sleep 1
done

# Wait for running processes to cool down.
# Run:
./platform-tools/adb shell top
# And continuously inspect the refreshing output - wait for the idle
# percent indicator to settle down, as in line 4 (L4):
#
#(L1)  Tasks: 173 total,   1 running, 172 sleeping,   0 stopped,   0 zombie
#(L2)   Mem:      1.9G total,      1.5G used,      426M free,       17M buffers
#(L3)   Swap:      1.4G total,       64M used,      1.3G free,      561M cached
#(L4)  400%cpu   0%user   0%nice   2%sys 398%idle   0%iow   0%irq   0%sirq   0%host    <-- 398% idle out of 400% cpu
#(L5)   PID USER         PR  NI VIRT  RES  SHR S[%CPU] %MEM     TIME+ ARGS
#(L6)  5387 system       18  -2 4.9G 270M 194M S  3.6  13.5   3:23.70 system_server
#(L7)  1633 system       RT   0  20M  12M 3.9M S  1.3   0.6   0:28.22 android.hardwar+
#(L8)  1613 system       20   0  24M 6.8M 4.5M S  1.0   0.3   0:17.38 android.system.+
#(L9)  1630 system       -3   0 154M  22M 7.5M S  0.6   1.1   0:15.86 android.hardwar+
#(L10) 9437 shell        20   0  14M 7.6M 3.4M R  0.3   0.3   0:00.34 top
#(L11) 5535 u0_a89       20   0 4.7G 177M 111M S  0.3   8.8   0:25.40 com.android.sys+
# ...
