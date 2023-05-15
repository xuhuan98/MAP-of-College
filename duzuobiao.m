clc;clear all           %清除所有
fid=fopen('duzuobiao.txt');  %打开数据总文件
B=textscan(fid,'%f %f');%把每一列的数据读入到读入到单元数组B中
C=[B{1} B{2}];          %从单元数组B中提取每列数据赋值给矩阵C
n=max(size(C));         %确定读入数据的坐标数目
x=C(:,1);y=C(:,2);      %赋值
for i=1:n
    [x(i),y(i)]
end