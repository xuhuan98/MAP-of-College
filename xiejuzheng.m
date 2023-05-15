m=[];n=str2double(input('矩阵大小：','s'));
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
    fprintf('第%d行录入开始：\n',i);
    for j=1:n
        a1=input('节点:','s');
        if strcmp(a1,over)
            fprintf('第%d行录入结束！\n',i);
            break
        elseif strcmp(a1,End)
            flag=0;
            break
        end
        a2=input('距离:','s');
        if strcmp(a2,over)
            fprintf('第%d行录入结束！\n',i);
            break
        elseif strcmp(a1,End)
            flag=0;
            break
        end
        k=int8(str2double(a1));
        m(i,k)=str2double(a2);
        m(k,i)=m(i,k);
        if k==n
           fprintf('第%d行录入结束！\n',i);
           break
        end
     end

    if flag==0
        fprintf('录入结束!\n');
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

%录入的矩阵m存入c.txt文件下，以下为取出存入的矩阵
% C=load('c.txt');[~,s]=size(C);s=int8(sqrt(s));A=[];b=1;
% for i=1:s
%     for j=1:s
%         A(i,j)=C(1,b);
%         b=b+1;
%     end
% end
