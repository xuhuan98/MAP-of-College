m=[];n=str2double(input('�����С��','s'));
for i=1:n
    for j=1:n
        m(i,j)=inf;
    end
end
for i=1:n
        m(i,i)=0;
end
flag=1;over='g';End='gg';
for i=1:n
    fprintf('��%d��¼�뿪ʼ��\n',i);
    for j=1:n
        a1=input('�ڵ�:','s');
        if strcmp(a1,over)
            fprintf('��%d��¼�������\n',i);
            break
        elseif strcmp(a1,End)
            flag=0;
            break
        end
        a2=input('����:','s');
        if strcmp(a2,over)
            fprintf('��%d��¼�������\n',i);
            break
        elseif strcmp(a1,End)
            flag=0;
            break
        end
        k=int8(str2double(a1));
        m(i,k)=str2double(a2);
        m(k,i)=m(i,k);
        if k==n
           fprintf('��%d��¼�������\n',i);
           break
        end
     end

    if flag==0
        fprintf('¼�����!\n');
        fid=fopen('c.txt','w');
        for a=1:n
            for g=1:n
                fprintf(fid,'%d\t',m(a,g));
                if g==n
                    fprintf(fid,'\n');
                end
            end
        end
        fclose(fid);
        break
    end
end

%¼��ľ���m����c.txt�ļ��£�����Ϊȡ������ľ���
% C=load('c.txt');[~,s]=size(C);s=int8(sqrt(s));A=[];b=1;
% for i=1:s
%     for j=1:s
%         A(i,j)=C(1,b);
%         b=b+1;
%     end
% end
