[Filename, Pathname]=uigetfile('duzuobiao.txt','E:\许欢的代码\M_code');
if (Filename==0 & Pathname==0)  
    msgbox('您没有选择文件，请重新选择!','确认','error');  
else  
   fid = fopen(Filename,'r');
   if fid==-1
       msgbox('打开文件出错','确认','error');
   else
       B=textscan(fid,'%f %f'); 
       C=[B{1} B{2}];          %从单元数组B中提取每列数据赋值给矩阵C
       n=max(size(C));         %确定读入数据的坐标数目
       x=C(:,1);y=C(:,2);      %赋值
       %for i=1:n
           %[x(i),y(i)]
       %end
       msgbox('打开及读取数据完毕！','确认','warn');
       fclose(fid);

temp=input('请输入起点:','s');  %设置起始点
m=[];
for i=1:n
    for j=1:n
        m(i,j)=sqrt((x(i)-x(j))^2+(y(i)-y(j))^2);
    end
end
for i=1:n
    for j=1:n
       if(m(i,j)==0)
           m(i,j)=inf;
       end
    end
end
for i=1:n
    m(i,i)=0;
end
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
d
path
   end
end
