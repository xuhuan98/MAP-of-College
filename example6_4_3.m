%程序如下（放大部分可以随着鼠标移动）
function varargout = example6_4_3(varargin)
% EXAMPLE6_4_3 MATLAB code for example6_4_3.fig
%      EXAMPLE6_4_3, by itself, creates a new EXAMPLE6_4_3 or raises the existing
%      singleton*.
%
%      H = EXAMPLE6_4_3 returns the handle to a new EXAMPLE6_4_3 or the handle to
%      the existing singleton*.
%
%      EXAMPLE6_4_3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXAMPLE6_4_3.M with the given input arguments.
%
%      EXAMPLE6_4_3('Property','Value',...) creates a new EXAMPLE6_4_3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before example6_4_3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to example6_4_3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
% Edit the above text to modify the response to help example6_4_3
% Last Modified by GUIDE v2.5 21-Mar-2017 20:51:05
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @example6_4_3_OpeningFcn, ...
                   'gui_OutputFcn',  @example6_4_3_OutputFcn, ...
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

% --- Executes just before example6_4_3 is made visible.
function example6_4_3_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output=hObject;
global m n mapData
axes(handles.axes1);
cData=imread('pic.jpg');
hImage=image(cData);
axis off;
axes(handles.axes2);
m=size(cData,1);
n=size(cData,2);
mapData=255*ones(m+40,n+40,size(cData,3),'uint8');
mapData(21:m+20,21:n+20,:)=cData;
handles.hImage=hImage;
guidata(hObject,handles);
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to example6_4_3 (see VARARGIN)
% Choose default command line output for example6_4_3
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes example6_4_3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = example6_4_3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
global m n mapData
pos=get(handles.axes1,'CurrentPoint');
posX=pos(1,1);
posY=pos(1,2);
if((posX>=1)&&(posX<=n)&&(posY>=1)&&(posY<=m))
    x=floor(posY)+20;
    y=floor(posX)+20;
    cData=mapData(x-20:x+20,y-20:y+20,:);
    axes(handles.axes2);
    image(cData);
    axis off;
end
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pushbutton3.