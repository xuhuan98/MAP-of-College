function varargout = fangda(varargin)
% FANGDA MATLAB code for fangda.fig
%      FANGDA, by itself, creates a new FANGDA or raises the existing
%      singleton*.
%
%      H = FANGDA returns the handle to a new FANGDA or the handle to
%      the existing singleton*.
%
%      FANGDA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FANGDA.M with the given input arguments.
%
%      FANGDA('Property','Value',...) creates a new FANGDA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fangda_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fangda_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fangda

% Last Modified by GUIDE v2.5 30-Nov-2019 15:48:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fangda_OpeningFcn, ...
                   'gui_OutputFcn',  @fangda_OutputFcn, ...
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


% --- Executes just before fangda is made visible.
function fangda_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fangda (see VARARGIN)

% Choose default command line output for fangda
handles.output = hObject;
global m n mapData
axes(handles.axes1);
cData=imread('допе╢С.jpg');
hImage=image(cData);
axis off;
axes(handles.axes1);
m=size(cData,1);
n=size(cData,2);
mapData=255*ones(m+40,n+40,size(cData,3),'uint8');
mapData(21:m+20,21:n+20,:)=cData;
handles.hImage=hImage;
guidata(hObject,handles);


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fangda wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fangda_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(~, ~, handles)
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
