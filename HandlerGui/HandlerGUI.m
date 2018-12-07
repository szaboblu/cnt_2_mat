function varargout = HandlerGUI(varargin)
% HANDLERGUI MATLAB code for HandlerGUI.fig
%      HANDLERGUI, by itself, creates a new HANDLERGUI or raises the existing
%      singleton*.
%
%      H = HANDLERGUI returns the handle to a new HANDLERGUI or the handle to
%      the existing singleton*.
%
%      HANDLERGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HANDLERGUI.M with the given input arguments.
%
%      HANDLERGUI('Property','Value',...) creates a new HANDLERGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HandlerGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HandlerGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HandlerGUI

% Last Modified by GUIDE v2.5 07-Dec-2018 19:42:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HandlerGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @HandlerGUI_OutputFcn, ...
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


% --- Executes just before HandlerGUI is made visible.
function HandlerGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HandlerGUI (see VARARGIN)

% Choose default command line output for HandlerGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HandlerGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = HandlerGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Paralellbutton.
function Paralellbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Paralellbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.parallel = true;
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of Paralellbutton


% --- Executes on button press in matrixbutton.
function matrixbutton_Callback(hObject, eventdata, handles)
% hObject    handle to matrixbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.matrix = true;
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of matrixbutton


% --- Executes on button press in deblockbutton.
function deblockbutton_Callback(hObject, eventdata, handles)
% hObject    handle to deblockbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.deblock = true;
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of deblockbutton



% --- Executes on button press in Run.
function Run_Callback(hObject, eventdata, handles)
% hObject    handle to Run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%handles.polytrodes_2_run = 5;
%handles.dirpath = uigetdir;

handles.dirpath = uigetdir;

name = [handles.dirpath,'/log_deblock.mat'];
m = matfile(name,'Writable',true);
handles.polytrodes = m.polytrodes;
h = m.handles;

handles.chsign = h.chsign;
handles.chnames =  h.chnames;
handles.chnum = h.chnum;
% addpath([handles.path, '/Mat_files']);
% addpath(genpath(handles.path));

poli = [handles.dirpath, '/Polytrodes'];
if ~exist(poli,'dir')
mkdir(poli);
polytrode_text_maker(handles,handles.polytrodesize);
end
addpath(poli);

spikespath = [handles.dirpath, '/Polytrode_spikes'];
if ~exist(spikespath,'dir')
mkdir(spikespath);
end
cd(spikespath);

c = cell(size(handles.polytrodes_2_run,2),1);
for i = 1:size(handles.polytrodes_2_run,2)
    c{i,1} = [spikespath,'/polytrode',num2str(handles.polytrodes_2_run(1,i)),'_spikes.mat'];
end
handles.spcfiles = c;

tic

parfor i = 1:size(handles.polytrodes_2_run,2)
if  ~exist(handles.spcfiles{i,1},'file')
    disp(['Running Get_spikes_pol on polytrode ' num2str(handles.polytrodes_2_run(1,i)) ' ...'])
    %Get_spikes_pol(handles.polytrodes_2_run(1,i),'parallel',true);
    Get_spikes_pol(handles.polytrodes_2_run(1,i));
end
end

toc
cd(handles.dirpath);
addpath(spikespath)
timespath = [handles.dirpath, '/Times_polytrodes'];
if ~exist(timespath,'dir')
mkdir(timespath);
end
cd(timespath);

d = cell(size(handles.polytrodes_2_run,2),1);
for i = 1:size(handles.polytrodes_2_run,2)
    d{i,1} = [timespath,'/times_polytrode',num2str(handles.polytrodes_2_run(1,i)),'.mat'];
end
handles.timefiles = d;

tic
parfor i = 1: size(handles.spcfiles,1) 
if  ~exist(handles.timefiles{i,1},'file')
    disp(['Running Do_clustering on polytrode ' num2str(handles.polytrodes_2_run(1,i)) ' ...'])
    %Do_clustering(handles.spcfiles{i},'parallel',true);
    Do_clustering(handles.spcfiles{i,1});
end
end
toc
cd(handles.dirpath);


% --- Executes on button press in Load_data.
function Load_data_Callback(hObject, eventdata, handles)
% hObject    handle to Load_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fname, path, findex]=uigetfile('*.cnt','Select the data file');
h = cnt_2_mat([path,fname]);

handles.chsign = h.chsign;
handles.chnames =  h.chnames;
handles.chnum = h.chnum;

handles.fname = fname;
handles.path = path;
handles.findex = findex;
guidata(hObject, handles);


% --- Executes on button press in Polytrode_chooser.
function Polytrode_chooser_Callback(hObject, eventdata, handles)
% hObject    handle to Polytrode_chooser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.dirpath = uigetdir;

name = [handles.dirpath,'/log_deblock.mat'];
m = matfile(name,'Writable',true);
handles.polytrodes = m.polytrodes;
h = m.handles;

prompt=['Existing pages:', newline];
sz = strings(size(handles.polytrodes, 1));
for i=1:size(handles.polytrodes, 1)
        sz(i) = [num2str(i), ' '];
end
prompt = [prompt,  sz{1:end}];

answer=inputdlg(prompt,'Which one do you want to run: ',1,{''});

[val, status] = str2num(answer{1});  
if ~status
    val = 'all';
end
handles.polytrodes_2_run = val;

guidata(hObject, handles);


% --- Executes on selection change in polytrodesize.
function polytrodesize_Callback(hObject, eventdata, handles)
% hObject    handle to polytrodesize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

p = get(hObject,'Value');
handles.polytrodesize = p;
guidata(hObject, handles);

% Hints: contents = cellstr(get(hObject,'String')) returns polytrodesize contents as cell array
%        contents{get(hObject,'Value')} returns selected item from polytrodesize


% --- Executes during object creation, after setting all properties.
function polytrodesize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to polytrodesize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
