【适用环境】
1. Windows 7及以上
2. 安装有MATLAB/Simulink 2021a及以上版本

【使用方法】
1. 使用网线连接Phantom Omni设备并上电，过20秒后按一下pairing按钮
2. 打开QgcServerSim_v2021a.slx
3. 运行QgcServerSim_v2021a.slx
4. 双击运行Omni_Comm.exe
5. 观察Omni_Comm.exe控制台输出，若无报错则下一步，否则等待其每10秒自动重启
6. 正常使用Omni设备，即可在slx的scope中看到实时获取的Omni信号，Omni_Comm.exe也会实时输出Omni末端位姿信号

【注意事项】
1. Omni_Comm.exe运行过程中，请勿单击其控制台
2. 若Omni_Comm.exe打开后超过60秒，仍然在每次重启时报错，则：

	2.1若每次报错信息完全相同，请检查Omni设备连接情况后，重启Omni并执行上述步骤1.
   
	2.2 若每次报错信息有所变化，重启Omni并执行上述步骤1.

   2.3 若观察到Omni_Comm.exe输出Omni末端位姿信号后报错并进入重启倒计时，请尝试按Omni的pairing按钮，若无效则重启Omni并执行上述步骤1.

14. slx中的仿真步长可调整（默认为0.01），但请勿超过0.1、小于0.002、或设置为动态步长
15. slx中支持增添其他模块，包括：

	4.1. 绝大部分不涉及IP网络通信的模块
	
 	4.2. 大部分设计IP网络通信的模块（如TCP模块、UDP模块），但请勿占用127.0.0.1:10301

17. 暂不兼容ROS通信模块，对ROS通信模块的支持将在后续版本给出
