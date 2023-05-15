function varargout = xuhuan(varargin)
% XUHUAN MATLAB code for xuhuan.fig
%      XUHUAN, by itself, creates a new XUHUAN or raises the existing
%      singleton*.
%
%      H = XUHUAN returns the handle to a new XUHUAN or the handle to
%      the existing singleton*.
%
%      XUHUAN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in XUHUAN.M with the given input arguments.
%
%      XUHUAN('Property','Value',...) creates a new XUHUAN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before xuhuan_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to xuhuan_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help xuhuan

% Last Modified by GUIDE v2.5 10-Dec-2019 19:17:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @xuhuan_OpeningFcn, ...
                   'gui_OutputFcn',  @xuhuan_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before xuhuan is made visible.
function xuhuan_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to xuhuan (see VARARGIN)

set(handles.axes1,'visible','off');
axes(handles.axes1);
imshow(imread('���Ŵ�.jpg'));
set(hObject,'toolbar','figure');
set(handles.axes2,'visible','off');
axes(handles.axes2);
imshow(imread('��.jpg'));
[x, Fs]=audioread('ͬ�Ĵ��Ի�.wav');
sound(x, Fs);

% Choose default command line output for xuhuan
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes xuhuan wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = xuhuan_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function qidian_Callback(hObject, ~, handles)
% hObject    handle to qidian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 handles.temp=str2double(get(hObject,'String'));
  guidata(hObject, handles);
 
% Hints: get(hObject,'String') returns contents of qidian as text
%        str2double(get(hObject,'String')) returns contents of qidian as a double


% --- Executes during object creation, after setting all properties.
function qidian_CreateFcn(hObject, ~, ~)
% hObject    handle to qidian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function zhongdian_Callback(hObject, ~, handles)
% hObject    handle to zhongdian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.s=str2double(get(hObject,'String'));
 guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of zhongdian as text
%        str2double(get(hObject,'String')) returns contents of zhongdian as a double


% --- Executes during object creation, after setting all properties.
function zhongdian_CreateFcn(hObject, ~, ~)
% hObject    handle to zhongdian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(~, ~, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val
m=load('c.txt');
temp=handles.temp;
s=handles.s;
[mydistance,mypath,time]=mydijkstra(m,temp,s);
value=val;
switch value
    case 1
        T1= mydistance/0.8;
        set(handles.text18,'string','��ע�����У�ڳ�����ף��һ·˳�磡');
    case 2
        T1=mydistance/3.0;
        set(handles.text18,'string','��ע�����У�ڳ��������ˣ����ճ��٣�ף��һ·˳�磡');
    case 3
        T1 =mydistance/11.0;
        set(handles.text18,'string','��ע�����У�ڳ��������ˣ�����20km/h,ף��һ·˳�磡');
    case 4
        T1=mydistance/7.0;
        set(handles.text18,'string','�뵽����Ĺ���վ̨�ŶӵȺ�Լ5~10minһ��Σ�ף��һ·˳�磡');
end

P=strcat('·��Ϊ��',num2str(mypath));
set(handles.text4,'string',P);
Le=strcat('��̾���Ϊ��',num2str(mydistance),'��');
set(handles.text5,'string',Le);
t=strcat('�����ʱ:',num2str(time),'��');
set(handles.text6,'string',t);
T2=strcat('Ԥ����ʱ:',num2str(T1/60),'����');
set(handles.text14,'string',T2);


% Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear sound


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global val
val=get(hObject,'Value');

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(xiugai,'Visible','on');
