clc;clear;
m=load('M.txt');
n=size(m);   %设置矩阵大小

temp=str2double(input('请输入起点:','s')); 
while (temp<1 | temp>n)      
    disp('!起点不存在,请输入正确起点');  
    temp=str2double(input('请输入起点:','s'));
end
s=str2double(input('请输入终点:','s'));
while (s<1 | s>n )      
    disp('!终点不存在,请输入正确终点');  
    s=str2double(input('请输入终点:','s'));
end
tic;
pb(1:length(m))=0;pb(temp)=1;%求出最短路径的点为1，未求出的为0
d(1:length(m))=0;%存放各点的最短距离
path(1:length(m))=0;%存放各点最短路径的上一点标号
while sum(pb)<n %判断每一点是否都已找到最短路径
 tb=find(pb==0);%找到还未找到最短路径的点
 fb=find(pb);%找出已找到最短路径的点
 min=inf;
 for i=1:length(fb)
     for j=1:length(tb)
         plus=d(fb(i))+m(fb(i),tb(j));  %比较已确定的点与其相邻未确定点的距离
         if((d(fb(i))+m(fb(i),tb(j)))<min)
             min=d(fb(i))+m(fb(i),tb(j));
             lastpoint=fb(i);
             newpoint=tb(j);
         end
     end
 end
 d(newpoint)=min;
 pb(newpoint)=1;
 path(newpoint)=lastpoint; %最小值时的与之连接点
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

fprintf('从%d出发到%d的最短距离为\n',temp,s)
disp(d(1,s))
fprintf('从%d出发到%d的路径为\n',temp,s)
C=[];C=find(x(s,:)~=0);k=size(C);K=[];j=1;
for i=k(2):-1:1
if temp==x(s,i)
        disp(x(s,i:-1:1));
        K(1,:)=x(s,i:-1:1);
end
end
t=toc; fprintf(['算法运行时间为:',num2str(t),'S\n']); 

