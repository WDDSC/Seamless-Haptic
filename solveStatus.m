% function [...
%     button_now button_last ...
%     end_position_now end_position_last end_velocity_now end_velocity_last ...
%     gimbal_angles_now gimbal_angles_last gimbal_velocity_now gimbal_velocity_last ...
%     joint_angles_now joint_angles_last joint_velocity_now joint_velocity_last ...
%     end_force_now end_force_last ...
%     end_torque_now end_torque_last ...
%     joint_torque_now joint_torque_last ...
%     gimbal_torque_now gimbal_torque_last ...
%     note_str]...
function omni_status = solveStatus(char_data, omni_status_last)

%临时变量各自初始化
[button_now button_last] = deal(nan);
[end_position_now end_position_last end_velocity_now end_velocity_last ...
gimbal_angles_now gimbal_angles_last gimbal_velocity_now gimbal_velocity_last ...
joint_angles_now joint_angles_last joint_velocity_now joint_velocity_last ...
end_force_now end_force_last ...
end_torque_now end_torque_last ...
joint_torque_now joint_torque_last ...
gimbal_torque_now gimbal_torque_last] = deal(nan(1,3));
note_str = "";

%加载宏定义
DEF = MacroDef();

%数据粗处理
state = nan;
double_data = nan(1,22);

id = double(typecast(uint8(char_data(5:8)), 'int32'));
state = double(typecast(uint8(char_data(9:12)), 'int32'));
error_code = double(typecast(uint8(char_data(13:16)), 'int32'));
time = double(typecast(uint8(char_data(17:24)), 'int64'));

% 根据不同state进行对应解包
switch state
    case DEF.OMNI_SEND_STATE_ERROR %-100
        note_str = string(char(uint8(char_data(201:256)')));
    case DEF.OMNI_SEND_STATE_EMPTY %0
        ;
    case DEF.OMNI_SEND_STATE_HEARTBEAT %10
        disp("Uncompleted state received (OMNI_SEND_STATE_HEARTBEAT)")
    case DEF.OMNI_SEND_STATE_SYN %20
        disp("Uncompleted state received (OMNI_SEND_STATE_SYN)")
    case DEF.OMNI_SEND_STATE_ONLY_NOTE %30
        note_str = string(char(uint8(char_data(25:256)')));
    case DEF.OMNI_SEND_STATE_CURRENT_CORE %100
        for i=4:25
            double_data(i-3) = typecast(uint8(char_data((i-1)*8+1 : i*8)), 'double');
        end
        note_str = string(char(uint8(char_data(201:256)')));
        joint_angles_now = double_data(1:3);
        gimbal_angles_now = double_data(4:6);
        end_position_now = double_data(7:9);
        button_now = double_data(10);
        end_force_now = double_data(11:13);
        end_torque_now = double_data(14:16);
        joint_torque_now = double_data(17:19);
        gimbal_torque_now = double_data(20:22);
    case DEF.OMNI_SEND_STATE_LAST_CORE %101
        for i=4:25
            double_data(i-3) = typecast(uint8(char_data((i-1)*8+1 : i*8)), 'double');
        end
        note_str = string(char(uint8(char_data(201:256)')));
        joint_angles_now = double_data(1:3);
        gimbal_angles_now = double_data(4:6);
        end_position_now = double_data(7:9);
        button_now = double_data(10);
        end_force_now = double_data(11:13);
        end_torque_now = double_data(14:16);
        joint_torque_now = double_data(17:19);
        gimbal_torque_now = double_data(20:22);
    case DEF.OMNI_SEND_STATE_CURRENT_POSE %200
        for i=4:25
            double_data(i-3) = typecast(uint8(char_data((i-1)*8+1 : i*8)), 'double');
        end
        note_str = string(char(uint8(char_data(201:256)')));
        joint_angles_now = double_data(1:3);
        gimbal_angles_now = double_data(4:6);
        end_position_now = double_data(7:9);
        gimbal_velocity_now = double_data(10:12);
        end_velocity_now = double_data(13:15);
        button_now = double_data(16);
    case DEF.OMNI_SEND_STATE_LAST_POSE %201
        for i=4:25
            double_data(i-3) = typecast(uint8(char_data((i-1)*8+1 : i*8)), 'double');
        end
        note_str = string(char(uint8(char_data(201:256)')));
        joint_angles_last = double_data(1:3);
        gimbal_angles_last = double_data(4:6);
        end_position_last = double_data(7:9);
        gimbal_velocity_last = double_data(10:12);
        end_velocity_last = double_data(13:15);
        button_last = double_data(16);
    case DEF.OMNI_SEND_STATE_CURRENT_FORCE %300
        for i=4:25
            double_data(i-3) = typecast(uint8(char_data((i-1)*8+1 : i*8)), 'double');
        end
        note_str = string(char(uint8(char_data(201:256)')));
        end_force_now = double_data(1:3);
        end_torque_now = double_data(4:6);
        joint_torque_now = double_data(7:9);
        gimbal_torque_now = double_data(10:12);
        button_now = double_data(13);
    case DEF.OMNI_SEND_STATE_LAST_FORCE %301
        for i=4:25
            double_data(i-3) = typecast(uint8(char_data((i-1)*8+1 : i*8)), 'double');
        end
        note_str = string(char(uint8(char_data(201:256)')));
        end_force_last = double_data(1:3);
        end_torque_last = double_data(4:6);
        joint_torque_last = double_data(7:9);
        gimbal_torque_last = double_data(10:12);
        button_last = double_data(13);
    otherwise
end

%临时变量打包
omni_status = omni_status_last;

omni_status.button_now = button_now(1);
omni_status.button_last = button_last(1);
omni_status.end_position_now = end_position_now(1:3);
omni_status.end_position_last = end_position_last(1:3);
omni_status.end_velocity_now = end_velocity_now(1:3);
omni_status.end_velocity_last = end_velocity_last(1:3);
omni_status.gimbal_angles_now = gimbal_angles_now(1:3);
omni_status.gimbal_angles_last = gimbal_angles_last(1:3);
omni_status.gimbal_velocity_now = gimbal_velocity_now(1:3);
omni_status.gimbal_velocity_last = gimbal_velocity_last(1:3);
omni_status.joint_angles_now = joint_angles_now(1:3);
omni_status.joint_angles_last = joint_angles_last(1:3);
omni_status.joint_velocity_now = joint_velocity_now(1:3);
omni_status.joint_velocity_last = joint_velocity_last(1:3);
omni_status.end_force_now = end_force_now(1:3);
omni_status.end_force_last = end_force_last(1:3);
omni_status.end_torque_now = end_torque_now(1:3);
omni_status.end_torque_last = end_torque_last(1:3);
omni_status.joint_torque_now = joint_torque_now(1:3);
omni_status.joint_torque_last = joint_torque_last(1:3);
omni_status.gimbal_torque_now = gimbal_torque_now(1:3);
omni_status.gimbal_torque_last = gimbal_torque_last(1:3);
omni_status.note_str = note_str(1);

%结构体更新（不乱覆盖）
omni_status = UpdateStruct(omni_status, omni_status_last);

end


function res = UpdateStruct(new, old)

if isempty(old)
    res = new;
else
    res = old;
    membertags = fieldnames(old);
    for i = 1:length(membertags)
        tag = membertags{i};
        member_old = old.(tag);
        if isstring(member_old)
            if isempty(member_old)
                res.(tag) = new.(tag);
            end
        else
            if isnan(member_old(1))
                if length(member_old) == 1
                    res.(tag) = new.(tag);
                else
                    res.(tag)(1:3) = new.(tag)(1:3);
                end
            end
        end
    end
end

end