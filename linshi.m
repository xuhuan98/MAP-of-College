[Filename, Pathname]=uigetfile('duzuobiao.txt','E:\���Ĵ���\M_code');
if (Filename==0 & Pathname==0)  
    msgbox('��û��ѡ���ļ���������ѡ��!','ȷ��','error');  
else  
   fid = fopen(Filename,'r');
   if fid==-1
       msgbox('���ļ�����','ȷ��','error');
   else
       B=textscan(fid,'%f %f'); 
       C=[B{1} B{2}];          %�ӵ�Ԫ����B����ȡÿ�����ݸ�ֵ������C
       n=max(size(C));         %ȷ���������ݵ�������Ŀ
       x=C(:,1);y=C(:,2);      %��ֵ
       %for i=1:n
           %[x(i),y(i)]
       %end
       msgbox('�򿪼���ȡ������ϣ�','ȷ��','warn');
       fclose(fid);

temp=input('���������:','s');  %������ʼ��
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
d
path
   end
end
