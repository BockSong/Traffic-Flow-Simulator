clear all;
clc;
W = 0;
% ÿ�����ӵ�״̬�����֣�
% ��1��ʾ������0��ʾ��λ��-888��ʾ���ɽ�������
for j = 1
    B = 6; %�շ�վ������
    L = 3; %��������
    T = 23; % ����ʱ��Ϊ24����
    global plazalength;%����ȫ�ֱ�������������
    plazalength = 20;
    plaza = create_plaza(B,L);%��ʾԪ���ռ��״̬����
    v=plaza;
    %====================================================
    h = show_plaza(plaza,B,NaN);                        %ͼ����ʾ
    %====================================================
    num = 7;%��ͼ����
    entry_vector = create_entry(T,L);%��ʾ����������������
      entry_vector = create_temp_entry(num,30,30);
     waiting_time = 0;%�ȴ�ʱ��һ��ʼΪ0
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
                for cc = (plazalength-1):-1:1  %����ϵͳ
                    for ccc = 2:7
                        if v(cc,ccc)==1 && rand>0.7
                            v(cc,ccc)=2;
                        else if v(cc,ccc)==2 && rand>0.8
                                v(cc,ccc)=3;
                            end
                        end
                    end
                end
                [plaza,v,acone] = move_forward(plaza,v); %ǰ������
                ac = ac + acone;
                [plaza,v] = new_cars(plaza,xx,v); %���������ɵĳ�����������ӵ�Ԫ���ռ������
                
                [plaza,v] = switch_lanes(plaza,v); %��������
%                 %����·�����ĳ���
%                 [plaza,flag] = newCross_cas(plaza,cross_point);
                %�������ʱ�䲽��Ԫ���ռ�ĳ�������ʱ��
                %waiting_time = waiting_time + compute_wait(plaza); %����������ܵ�ʱ��
                %output = output + compute_output(plaza);%ÿ������ƽ����ʱ�������뿪�շ�վ���ܳ�����
                %===============================================
                h = show_plaza(plaza,B,h);                     %����ͼ��
                drawnow
                %===============================================
                [plaza,v,flag] = clear_boundary(plaza,v);%�Ƴ��뿪ϵͳ�ĳ���������Ԫ���ռ������һ�д���0����Ϊ0
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
     plot(total_entry)%������
     title('������');
     figure(3);
     plot(total_ac)%��ɲ����
     title('��ɲ����');
     hold off;
%     figure(3);
%     plot(total_wait)%�ȴ�ʱ��
%     title('�ȴ�ʱ��');
%     figure(4)
%     plot(total_traffic_capacity);%ͨ������
%     title('ͨ������');
%     figure(5)
%     plot(average_traffic_density)%�����ܶ�
%     title('�����ܶ�');
%     xlswrite('ͳ�ƽ��', total_entry, '������');
%     xlswrite('ͳ�ƽ��', average_wait, '�ȴ�ʱ��');
%     xlswrite('ͳ�ƽ��', total_traffic_capacity, 'ͨ������');
%     xlswrite('ͳ�ƽ��', average_traffic_density, '�����ܶ�');
end
