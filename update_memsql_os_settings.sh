#! /bin/bash
echo "vm.overcommit_memory = 2" >> /etc/sysctl.conf
echo "vm.overcommit_ratio = 99" >> /etc/sysctl.conf
echo "vm.swappiness = 1" >> /etc/sysctl.conf
echo "vm.max_map_count=1000000000" >> /etc/sysctl.conf
echo "vm.min_free_kbytes=2500000" >> /etc/sysctl.conf
echo "net.core.somaxconn=1024" >> /etc/sysctl.conf
echo "net.core.netdev_max_backlog=1024" >> /etc/sysctl.conf
echo "net.core.rmem_max = 6291456" >> /etc/sysctl.conf
echo "net.core.wmem_max=4194304" >> /etc/sysctl.conf
echo "kernel.pid_max = 400000" >> /etc/sysctl.conf
echo "net.ipv4.tcp_rmem=4096 1048576 6291456" >> /etc/sysctl.conf
echo "net.ipv4.tcp_wmem=4096 1048576 4194304" >> /etc/sysctl.conf
echo "net.ipv4.tcp_adv_win_scale=1" >> /etc/sysctl.conf
echo "net.ipv4.tcp_app_win=31" >> /etc/sysctl.conf
echo "net.core.default_qdisc=fq_codel" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=htcp" >> /etc/sysctl.conf
echo "vm.zone_reclaim_mode=1" >> /etc/sysctl.conf
echo "kernel.numa_balancing=0" >> /etc/sysctl.conf
echo "vm.oom_kill_allocating_task=1" >> /etc/sysctl.conf
echo "kernel.nmi_watchdog=0" >> /etc/sysctl.conf
echo "kernel.numa_balancing=0" >> /etc/sysctl.conf

echo never > /sys/kernel/mm/transparent_hugepage/enabled
echo never > /sys/kernel/mm/transparent_hugepage/defrag
echo "cpupower frequency-set -g performance" >> /etc/rc.d/rc.local
echo "echo never > /sys/kernel/mm/transparent_hugepage/enabled" >> /etc/rc.d/rc.local
echo "echo never > /sys/kernel/mm/transparent_hugepage/defrag" >> /etc/rc.d/rc.local

echo "echo 0 > /sys/kernel/mm/ksm/merge_across_nodes" >> /etc/rc.d/rc.local
echo "echo 2 > /sys/kernel/mm/ksm/run" >> /etc/rc.d/rc.local

echo "echo 0 > /sys/devices/system/cpu/cpufreq/boost" >> /etc/rc.d/rc.local
echo "modprobe -r intel_powerclamp" >> /etc/rc.d/rc.local
echo "modprobe -r acpi_power_meter" >> /etc/rc.d/rc.local

echo "memsql          soft    nofile          1024000" >> /etc/security/limits.conf
echo "memsql          hard    nofile          1024000"  >> /etc/security/limits.conf
echo "memsql          soft    nproc           256000"  >> /etc/security/limits.conf
echo "memsql          hard    nproc           256000"  >> /etc/security/limits.conf
echo "session     required      pam_limits.so” >> /etc/pam.d/login
chmod 0755 /etc/rc.d/rc.local
sysctl -p
