function [falserate,Detectionrate,falsealarmrate,result,test]= ActuralDistributeDetectionRate(Mu,dmax,FPC,Mediandmax,Compare,correct,false)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
Fcount=0;
Dcount=0;
falserate=false/(correct+false);
test=ones(correct+false,3);%�����������������ݺ��쳣���ݹ���
result=ones(1,correct+false);%��֤����Ϊ1��û�д����ʱ��
X=[19 23 14];%��ֵ����
%������������
for i=1:correct
    for j=1:3
        mu=X(1,j);
        Sigma=0.7;%�������ݵ�ȡֵ����0.04���������������������
        test(i,j)=normrnd(mu,Sigma);
    end
end
%�쳣ֵ����
for i=correct+1:correct+false
    for j=1:2
        mu=X(1,j);
        Sigma=0.5;%��������
        test(i,j)=normrnd(mu,Sigma);
    end
    test(i,3)=unifrnd(16,18);%�쳣����,��ֵ�ֲ�
end
test=test./Compare(1,:);
for i=1:correct
    %���㵽��һ���ɷֵľ���
    s1=test(i,:)-Mu(1,:);%ȡ���ǵ�һ���ڵ�
    d1=norm(s1,2);
    d2=s1*FPC(:,1);
    di=sqrt(d1.^2-d2.^2);
    %�ж��Ƿ񳬹���ֵ���ж��Ƿ��ǹ��ϣ��͵�һ��group�ڵ���Ϊ�Ƚ϶���
    if(di<=dmax(1,1))
        result(1,i)=1;
    elseif(di>Mediandmax)%������ݴ���dmax�����ݴ���MedianMax
        result(1,i)=0;
        Fcount=Fcount+1;
    end
end
falsealarmrate=Fcount/correct

%���ĳ�������쳣������
for i=correct+1:correct+false
    s1=test(i,:)-Mu(1,:);%�ʹ�ͷ�ڵ�Ƚ�
    d1=norm(s1,2);
    d2=s1*FPC(:,1);
    di=sqrt(d1.^2-d2.^2);
    %�ж��Ƿ񳬹���ֵ���ж��Ƿ��ǹ���
    if(di<=dmax(1,1))
        result(1,i)=1;%��������
    elseif(di>Mediandmax)
        result(1,i)=0;
        Dcount=Dcount+1;%��������Ǵ���ĸ���
    end
end
Detectionrate=Dcount/false
end