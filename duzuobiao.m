clc;clear all           %�������
fid=fopen('duzuobiao.txt');  %���������ļ�
B=textscan(fid,'%f %f');%��ÿһ�е����ݶ��뵽���뵽��Ԫ����B��
C=[B{1} B{2}];          %�ӵ�Ԫ����B����ȡÿ�����ݸ�ֵ������C
n=max(size(C));         %ȷ���������ݵ�������Ŀ
x=C(:,1);y=C(:,2);      %��ֵ
for i=1:n
    [x(i),y(i)]
end