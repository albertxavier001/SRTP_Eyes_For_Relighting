function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 12-May-2013 12:57:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%显示一张图片
global im   %定义一个全局变量im
[filename,pathname]=...
    uigetfile({'*.*';'*.bmp';'*.tif';'*.png'},'select picture');  %选择图片路径
global image_path
image_path=[pathname filename];  %合成路径+文件名
im=imread(image_path);   %读取图片
axes(handles.axes1);  %使用第一个axes
imshow(im);  %显示图片







% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%[imcroped rect] = imcrop(im);
%拖动鼠标选取你要处理的范围，双击完成
%范围图像存放在imcroped中，坐标存放在rect中
%imtmp = improcess(imcroped); % 你的处理
%把处理后效果的覆盖原图
%im(rect(2):rect(2)+rect(4),rect(1):rect(1)+rect(3)) = imtmp;
%axes(handles.axes1);  
%imshow(im);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[imcroped, rect] = imcrop(im);%拖动鼠标选取你要处理的范围，双击完成,范围图像存放在imcroped中，坐标存放在rect中
rectangle('Position',rect(:),'edgecolor','r','LineWidth',2,'LineStyle','-');
im=imcroped;
imshow(im);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)

% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im 
global image_path 
im=imread(image_path);   %读取图片
axes(handles.axes1);  %使用第一个axes
imshow(im);  %显示图片

