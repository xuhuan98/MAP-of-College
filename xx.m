m=load('M.txt');n=100;
for i=1:n
    m(i,i)=0;
end
% s = xlswrite('m.xls', m); 
fid=fopen('M.txt','w');
for a=1:n
    for g=1:n
        fprintf(fid,'%d\t',m(a,g));
        if g==n
           fprintf(fid,'\n');
        end
    end
end