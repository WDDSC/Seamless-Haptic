【适用环境】
1. Windows 7及以上
2. 安装有MATLAB/Simulink 2021a及以上版本

【使用方法】
1. 使用网线连接Phantom Omni设备并上电，过20秒后按一下pairing按钮
2. 打开QgcServerSim_v2021a.slx
3. 运行QgcServerSim_v2021a.slx
4. 双击运行Omni_comm.exe

【注意事项】
1. slx中的仿真步长可调整，但请勿超过0.1或设置为动态步长
2. slx中支持增添其他模块，包括：
   2.1. 绝大部分不涉及IP网络通信的模块
   2.3. 大部分设计IP网络通信的模块（如TCP模块、UDP模块），但请勿占用127.0.0.1:10301
   2.3. 暂不兼容ROS通信模块，对ROS通信模块的支持将在下一版本给出
