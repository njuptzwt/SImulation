function [Detectionrate,falsealarmrate,result]= IDPCAandDPCAFAR(Mu,dmax,FPC,Mediandmax,correct,false,control)
Fcount=0;
Dcount=0;
test=ones(correct+false,3);%测试数据由正常数据和异常数据构成
result=ones(1,correct+false);%保证数据为1（没有错误的时候）
X=[0.3 0.35 0.4];%均值集合
%检验正常数据
for i=1:correct
    for j=1:3
        mu=X(randperm(3,1));
        Sigma=0.041-0.001*control;%误报率，不然非常小
        test(i,j)=normrnd(mu,Sigma);
    end
    %计算到第一主成分的距离
    s1=test(i,:)-Mu(1,:);
    d1=norm(s1,2);
    d2=s1*FPC(:,1);
    di=sqrt(d1.^2-d2.^2);
    %判断是否超过阈值，判断是否是故障，和第一个group节点作为比较对象
    if(di<=dmax(1,1))
        result(1,i)=1;
    elseif(di>Mediandmax)%如果数据大于dmax且数据大于MedianMax
        result(1,i)=0;
        Fcount=Fcount+1;
    end
end
falsealarmrate=(Fcount/correct)*100

%检测某个属性异常的数据
for i=correct+1:correct+false
    for j=1:2
        mu=X(randperm(3,1));
        Sigma=0.03;%正常数据
        test(i,j)=normrnd(mu,Sigma);
    end
    test(i,3)=unifrnd(0.5,1);%异常数据,均值分布
    s1=test(i,:)-Mu(1,:);
    d1=norm(s1,2);
    d2=s1*FPC(:,1);
    di=sqrt(d1.^2-d2.^2);
    %判断是否超过阈值，判断是否是故障
    if(di<=dmax(1,1))
        result(1,i)=1;%正常数据
    elseif(di>Mediandmax)
        result(1,i)=0;
        Dcount=Dcount+1;%检测数据是错误的个数
    end
end
Detectionrate=(Dcount/false)*100
end