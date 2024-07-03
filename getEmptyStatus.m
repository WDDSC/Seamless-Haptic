function omni_status = getEmptyStatus()

[button_now button_last] = deal(nan);
[end_position_now end_position_last end_velocity_now end_velocity_last ...
gimbal_angles_now gimbal_angles_last gimbal_velocity_now gimbal_velocity_last ...
joint_angles_now joint_angles_last joint_velocity_now joint_velocity_last ...
end_force_now end_force_last ...
end_torque_now end_torque_last ...
joint_torque_now joint_torque_last ...
gimbal_torque_now gimbal_torque_last] = deal(nan(3,1));
note_str = "";

omni_status.button_now = button_now;
omni_status.button_last = button_last;
omni_status.end_position_now = end_position_now;
omni_status.end_position_last = end_position_last;
omni_status.end_velocity_now = end_velocity_now;
omni_status.end_velocity_last = end_velocity_last;
omni_status.gimbal_angles_now = gimbal_angles_now;
omni_status.gimbal_angles_last = gimbal_angles_last;
omni_status.gimbal_velocity_now = gimbal_velocity_now;
omni_status.gimbal_velocity_last = gimbal_velocity_last;
omni_status.joint_angles_now = joint_angles_now;
omni_status.joint_angles_last = joint_angles_last;
omni_status.joint_velocity_now = joint_velocity_now;
omni_status.joint_velocity_last = joint_velocity_last;
omni_status.end_force_now = end_force_now;
omni_status.end_force_last = end_force_last;
omni_status.end_torque_now = end_torque_now;
omni_status.end_torque_last = end_torque_last;
omni_status.joint_torque_now = joint_torque_now;
omni_status.joint_torque_last = joint_torque_last;
omni_status.gimbal_torque_now = gimbal_torque_now;
omni_status.gimbal_torque_last = gimbal_torque_last;
omni_status.note_str = note_str;

end