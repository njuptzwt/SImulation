function [falserate,Detectionrate,falsealarmrate,result] = Test( FPC,Mu,dmax,correct,false)
%���׶Σ�����220����ȷ�����ݣ�100����ܴ��������
Fcount=0;
Dcount=0;
Detectionrate=0;%�����
falsealarmrate=0;%�����
falserate=false/(correct+false);
test=zeros(correct+false,3);
result=zeros(1,correct+false);
X=[0.3 0.35 0.4];%��ֵ����

%������������
for i=1:correct
    for j=1:3
        mu=X(randperm(3,1));
        Sigma=0.03;
        test(i,j)=normrnd(mu,Sigma);
    end
    %���㵽��һ���ɷֵľ���
    s1=test(i,:)-Mu;
    d1=norm(s1,2);
    d2=s1*FPC;
    di=sqrt(d1.^2-d2.^2);
    %�ж��Ƿ񳬹���ֵ���ж��Ƿ��ǹ���
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
%xlswrite('data.xls',train);%����д��excel��񱣴�
scatter3(x,y,z,'b','.');%���ݼ��ϵĿռ�ֲ�ͼ��
hold on;
% %�����쳣����
% for i=correct+1:correct+false
%     for j=1:3
%         test(i,j)=unifrnd(0.4,0.6);
%     end
%     s1=test(i,:)-Mu;
%     d1=norm(s1,2);
%     d2=s1*FPC;
%     di=sqrt(d1.^2-d2.^2);
%     %�ж��Ƿ񳬹���ֵ���ж��Ƿ��ǹ���
%     if(di<=dmax)
%         result(1,i)=1;
%     end
% end

%���ĳ�������쳣������
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
    %�ж��Ƿ񳬹���ֵ���ж��Ƿ��ǹ���
    if(di<=dmax)
        result(1,i)=1;
    else
        Dcount=Dcount+1;%��������Ǵ���ĸ���
    end
end
Detectionrate=Dcount/false   
x=test(correct+1:correct+false,1);
y=test(correct+1:correct+false,2);
z=test(correct+1:correct+false,3);
scatter3(x,y,z,'r','*')
end

