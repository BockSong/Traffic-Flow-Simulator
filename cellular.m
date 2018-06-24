clear all;
clc;
W = 0;
% 每个格子的状态有三种：
% 用1表示车辆，0表示空位，-888表示不可进入区域
for j = 1
    B = 6; %收费站的数量
    L = 3; %车道数量
    T = 23; % 更新时间为24毫秒
    global plazalength;%定义全局变量，车道长度
    plazalength = 20;
    plaza = create_plaza(B,L);%表示元胞空间的状态矩阵
    v=plaza;
    %====================================================
    h = show_plaza(plaza,B,NaN);                        %图像显示
    %====================================================
    num = 7;%绘图周期
    entry_vector = create_entry(T,L);%表示车辆到来数的向量
      entry_vector = create_temp_entry(num,30,30);
     waiting_time = 0;%等待时间一开始为0
     output = 0;
     k=1;
%     total_wait = zeros((greenTime+redTime)*num,1);
     total_entry = zeros(2*num,1);
     total_ac = zeros(2*num,1);
     total_traffic_capacity = zeros(2*num,1);
%     total_traffic_density = zeros((redTime+greenTime)*num,1);
     cross_point = plazalength-4;
%     average_wait = zeros(2*num,1);
     k=1;
    for i = 1:5
%         waiting_time = 0;
%         output = 0;
         entry = 0;
         ac=0;
         traffic_capacity = 0;
            for xx=1:60
                for cc = (plazalength-1):-1:1  %动力系统
                    for ccc = 2:7
                        if v(cc,ccc)==1 && rand>0.7
                            v(cc,ccc)=2;
                        else if v(cc,ccc)==2 && rand>0.8
                                v(cc,ccc)=3;
                            end
                        end
                    end
                end
                [plaza,v,acone] = move_forward(plaza,v); %前进规则
                ac = ac + acone;
                [plaza,v] = new_cars(plaza,xx,v); %将上面生成的车辆到来情况加到元胞空间矩阵中
                
                [plaza,v] = switch_lanes(plaza,v); %换道规则
%                 %交叉路口来的车辆
%                 [plaza,flag] = newCross_cas(plaza,cross_point);
                %计算这个时间步长元胞空间的车辆逗留时间
                %waiting_time = waiting_time + compute_wait(plaza); %进行求和求总的时间
                %output = output + compute_output(plaza);%每辆车的平均费时，计算离开收费站的总车辆数
                %===============================================
                h = show_plaza(plaza,B,h);                     %更新图像
                drawnow
                %===============================================
                [plaza,v,flag] = clear_boundary(plaza,v);%移除离开系统的车辆，即将元胞空间中最后一行大于0的设为0
                entry = entry + flag;

%                  if plaza((plazalength+1)/2,2) == 1
%                      traffic_capacity = traffic_capacity+1;
%                 end
%                  total_traffic_density(k) = size(find(plaza((plazalength+1)/4:(plazalength+1)/2-1,:)>0),1);
%                 total_wait(k) = waiting_time;
                 k = k+1;
                 pause(0.1);
            end
% %         total_wait(i) = waiting_time;
%         average_wait(i) = waiting_time/greenTime;
         total_entry(i) = entry;
         total_ac(i) = ac;
%         total_traffic_capacity(i) = traffic_capacity;
%         
%         
    end
    show_plaza(plaza,B,h);
%     W(j+1) = waiting_time/output;
%     xlabel({strcat('B = ',num2str(B)), ...
%         strcat('mean cost time = ', num2str(round(W(j+1))))})
%     count = 1;
%     average_traffic_density = zeros(2*num,1);
%     for i=1:num
%         average_traffic_density(count) = sum(total_traffic_density((i-1)*(greenTime+redTime)+1:(i-1)*(greenTime+redTime)+greenTime));
%         count = count+1;
%         average_traffic_density(count) = sum(total_traffic_density((i-1)*(greenTime+redTime)+1+greenTime:(i-1)*(greenTime+redTime)+greenTime+redTime));
%         count = count+1;
%     end
     hold on;
     figure(2);
     plot(total_entry)%车流量
     title('车流量');
     figure(3);
     plot(total_ac)%急刹车数
     title('急刹车数');
     hold off;
%     figure(3);
%     plot(total_wait)%等待时间
%     title('等待时间');
%     figure(4)
%     plot(total_traffic_capacity);%通行能力
%     title('通行能力');
%     figure(5)
%     plot(average_traffic_density)%车流密度
%     title('车流密度');
%     xlswrite('统计结果', total_entry, '车流量');
%     xlswrite('统计结果', average_wait, '等待时间');
%     xlswrite('统计结果', total_traffic_capacity, '通行能力');
%     xlswrite('统计结果', average_traffic_density, '车流密度');
end
