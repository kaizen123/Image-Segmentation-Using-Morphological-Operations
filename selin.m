function varargout = selin(varargin)
% SELIN MATLAB code for selin.fig
%      SELIN, by itself, creates a new SELIN or raises the existing
%      singleton*.
%
%      H = SELIN returns the handle to a new SELIN or the handle to
%      the existing singleton*.
%
%      SELIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELIN.M with the given input arguments.
%
%      SELIN('Property','Value',...) creates a new SELIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before selin_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to selin_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help selin

% Last Modified by GUIDE v2.5 13-Dec-2012 21:39:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @selin_OpeningFcn, ...
                   'gui_OutputFcn',  @selin_OutputFcn, ...
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


% --- Executes just before selin is made visible.
function selin_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to selin (see VARARGIN)

% Choose default command line output for selin
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes selin wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% global oldImageName;
% global newImage;
% global method;
% method = 1;
% oldImageName = 0;
% newImage = imread(oldImageName);
global oldImageName;
global method;
method = 1;
oldImageName = 'coast1.PNG';


% --- Outputs from this function are returned to the command line.
function varargout = selin_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in openImage.
function openImage_Callback(hObject, eventdata, handles)
% hObject    handle to openImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global oldImage;
global newImage;
global oldImageName;
[filename, pathname] = uigetfile('*.PNG', 'Pick a file');
oldImageName = filename;
if isequal(filename,0) | isequal(pathname,0)
    disp('User pressed cancel')
else
    disp(['User selected ', fullfile(pathname, filename)])
end
newImage = 0;
oldImage = imread(filename);
axis(handles.axes1);
image(oldImage,'Parent',handles.axes1);

% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
global method;
method = get(hObject, 'Value');


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in compute.
function compute_Callback(hObject, eventdata, handles)
% hObject    handle to compute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global oldImageName;
global newImage;
global method;
newImage = morph(oldImageName, method);
axis(handles.axes2);
image(newImage,'Parent',handles.axes2);




