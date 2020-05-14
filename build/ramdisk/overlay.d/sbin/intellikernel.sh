#!/system/bin/sh

chmod 755 /sbin/sswap
chmod 755 /sbin/busybox

# VNSwap
/sbin/sswap -s -r
sysctl -w vm.swappiness=130

# Disable adaptive lmk
echo '0' > /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk

# SafetyNet
chmod 640 /sys/fs/selinux/enforce;
chmod 440 /sys/fs/selinux/policy;

# Set SmartDim
echo '1' > /sys/class/graphics/fb0/smart_dim

# Set I/O scheduler to ZEN
echo "zen" > /sys/block/mmcblk0/queue/scheduler;
chown root.root /sys/block/mmcblk0/queue/scheduler;
chmod 0444 /sys/block/mmcblk0/queue/scheduler;
echo "0" > /sys/block/mmcblk0/queue/iostats;
echo "1024" > /sys/block/mmcblk0/queue/read_ahead_kb;
chown root.root /sys/block/mmcblk0/queue/read_ahead_kb;
chmod 0444 /sys/block/mmcblk0/queue/read_ahead_kb;
echo "zen" > /sys/block/mmcblk1/queue/scheduler;
chown root.root /sys/block/mmcblk1/queue/scheduler;
chmod 0444 /sys/block/mmcblk1/queue/scheduler;
echo "0" > /sys/block/mmcblk1/queue/iostats;
echo "2048" > /sys/block/mmcblk1/queue/read_ahead_kb;
chown root.root /sys/block/mmcblk1/queue/read_ahead_kb;
chmod 0444 /sys/block/mmcblk1/queue/read_ahead_kb;
echo "256" > /proc/sys/kernel/random/read_wakeup_threshold;
echo "320" > /proc/sys/kernel/random/write_wakeup_threshold;

# Set CPU governor
echo 'intelliactive' > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor;
echo 'intelliactive' > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor;
echo 'intelliactive' > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor;
echo 'intelliactive' > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor;

# Set CPU governor tweaks
echo '20000 1190400:60000 1728000:75000 1958400:80000 2265600:100000' > /sys/devices/system/cpu/cpufreq/intelliactive/above_hispeed_delay;
echo '98 300000:28 422400:34 652800:41 729600:12 883200:52 960000:9 1036800:8 1190400:73 1267200:6 1497600:87 1574400:5 1728000:89 1958400:91 2265600:94' > /sys/devices/system/cpu/cpufreq/intelliactive/target_loads; 
