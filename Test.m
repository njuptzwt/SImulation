function [falserate,Detectionrate,falsealarmrate,result] = Test( FPC,Mu,dmax,correct,false)
%检测阶段，采用220组正确的数据，100组可能错误的数据
Fcount=0;
Dcount=0;
Detectionrate=0;%检测率
falsealarmrate=0;%错检率
falserate=false/(correct+false);
test=zeros(correct+false,3);
result=zeros(1,correct+false);
X=[0.3 0.35 0.4];%均值集合

%检验正常数据
for i=1:correct
    for j=1:3
        mu=X(randperm(3,1));
        Sigma=0.03;
        test(i,j)=normrnd(mu,Sigma);
    end
    %计算到第一主成分的距离
    s1=test(i,:)-Mu;
    d1=norm(s1,2);
    d2=s1*FPC;
    di=sqrt(d1.^2-d2.^2);
    %判断是否超过阈值，判断是否是故障
    if(di<=dmax)
        result(1,i)=1;
    else
        Fcount=Fcount+1;
    end
end
falsealarmrate=Fcount/correct;
x=test(1:correct,1);
y=test(1:correct,2);
z=test(1:correct,3);
%xlswrite('data.xls',train);%数据写入excel表格保存
scatter3(x,y,z,'b','.');%数据集合的空间分布图形
hold on;
% %检验异常数据
% for i=correct+1:correct+false
%     for j=1:3
%         test(i,j)=unifrnd(0.4,0.6);
%     end
%     s1=test(i,:)-Mu;
%     d1=norm(s1,2);
%     d2=s1*FPC;
%     di=sqrt(d1.^2-d2.^2);
%     %判断是否超过阈值，判断是否是故障
%     if(di<=dmax)
%         result(1,i)=1;
%     end
% end

%检测某个属性异常的数据
for i=correct+1:correct+false
    for j=1:2
        mu=X(randperm(3,1));
        Sigma=0.03;
        test(i,j)=normrnd(mu,Sigma);
    end
    test(i,3)=unifrnd(0.4,0.6);
    s1=test(i,:)-Mu;
    d1=norm(s1,2);
    d2=s1*FPC;
    di=sqrt(d1.^2-d2.^2);
    %判断是否超过阈值，判断是否是故障
    if(di<=dmax)
        result(1,i)=1;
    else
        Dcount=Dcount+1;%检测数据是错误的个数
    end
end
Detectionrate=Dcount/false   
x=test(correct+1:correct+false,1);
y=test(correct+1:correct+false,2);
z=test(correct+1:correct+false,3);
scatter3(x,y,z,'r','*')
end

