clc;clear;
m=load('M.txt');
n=size(m);   %���þ����С

temp=str2double(input('���������:','s')); 
while (temp<1 | temp>n)      
    disp('!��㲻����,��������ȷ���');  
    temp=str2double(input('���������:','s'));
end
s=str2double(input('�������յ�:','s'));
while (s<1 | s>n )      
    disp('!�յ㲻����,��������ȷ�յ�');  
    s=str2double(input('�������յ�:','s'));
end
tic;
pb(1:length(m))=0;pb(temp)=1;%������·���ĵ�Ϊ1��δ�����Ϊ0
d(1:length(m))=0;%��Ÿ������̾���
path(1:length(m))=0;%��Ÿ������·������һ����
while sum(pb)<n %�ж�ÿһ���Ƿ����ҵ����·��
 tb=find(pb==0);%�ҵ���δ�ҵ����·���ĵ�
 fb=find(pb);%�ҳ����ҵ����·���ĵ�
 min=inf;
 for i=1:length(fb)
     for j=1:length(tb)
         plus=d(fb(i))+m(fb(i),tb(j));  %�Ƚ���ȷ���ĵ���������δȷ����ľ���
         if((d(fb(i))+m(fb(i),tb(j)))<min)
             min=d(fb(i))+m(fb(i),tb(j));
             lastpoint=fb(i);
             newpoint=tb(j);
         end
     end
 end
 d(newpoint)=min;
 pb(newpoint)=1;
 path(newpoint)=lastpoint; %��Сֵʱ����֮���ӵ�
end

x=zeros(n); 
for i=n:-1:1 
    z=i; b=i; 
    for a=1:n
        if z==0 
            break 
        end 
        if a==1 
            x(b,a)=z; 
            continue 
        end 
        x(b,a)=path(z); 
        z=path(z); 
    end
end

fprintf('��%d������%d����̾���Ϊ\n',temp,s)
disp(d(1,s))
fprintf('��%d������%d��·��Ϊ\n',temp,s)
C=[];C=find(x(s,:)~=0);k=size(C);K=[];j=1;
for i=k(2):-1:1
if temp==x(s,i)
        disp(x(s,i:-1:1));
        K(1,:)=x(s,i:-1:1);
end
end
t=toc; fprintf(['�㷨����ʱ��Ϊ:',num2str(t),'S\n']); 

