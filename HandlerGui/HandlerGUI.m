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

% Last Modified by GUIDE v2.5 05-Dec-2018 14:03:18

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
% Hint: get(hObject,'Value') returns toggle state of Paralellbutton


% --- Executes on button press in matrixbutton.
function matrixbutton_Callback(hObject, eventdata, handles)
% hObject    handle to matrixbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.matrix = true;
% Hint: get(hObject,'Value') returns toggle state of matrixbutton


% --- Executes on button press in deblockbutton.
function deblockbutton_Callback(hObject, eventdata, handles)
% hObject    handle to deblockbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.deblock = true;
% Hint: get(hObject,'Value') returns toggle state of deblockbutton



function file_chooser_Callback(hObject, eventdata, handles)
% hObject    handle to file_chooser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of file_chooser as text
%        str2double(get(hObject,'String')) returns contents of file_chooser as a double


% --- Executes during object creation, after setting all properties.
function file_chooser_CreateFcn(hObject, eventdata, handles)
% hObject    handle to file_chooser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function save_repo_name_Callback(hObject, eventdata, handles)
% hObject    handle to save_repo_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

save_repo_name = get(hObject,'String');
fprintf('Itt vagyunk')
if ~isempty(handles.save_repo_name) && ~isempty(handles.path)
    fprintf('Itt vagyunk2')
    handles.save_repo_name = [handles.path,save_repo_name];
    mkdir(handles.save_repo_name) ;
end
% Hints: get(hObject,'String') returns contents of save_repo_name as text
%        str2double(get(hObject,'String')) returns contents of save_repo_name as a double


% --- Executes during object creation, after setting all properties.
function save_repo_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to save_repo_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Polytrodes_2_run_Callback(hObject, eventdata, handles)
% hObject    handle to Polytrodes_2_run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

s = get(hObject,'string');
handles.polytrodes_2_run = s;

% space =  find(s == ' ', 1); 
% dots = find(s == ':', 1);
% 
% if strcmp(s,'all')
%     handles.polytrodes_2_run = handles.chnum;
% elseif isempty(space) && isempty(dots)
%     handles.polytrodes_2_run = str2double(s);
% elseif ~isempty(dots)
%     s(dots) = ' ';
%     s = split(s);
%     h = str2double(s);
%     %if ismepty(handles.polytrodes_2_run)
%        handles.polytrodes_2_run = h(1,1):1:h(2,1);
% %     else
% %         handles.polytrodes_2_run = h(1,1):1:h(2,1);
% %     end
%     
% elseif ~isempty(space)
%     s = split(s);
%     handles.polytrodes_2_run = str2double(s)';
% elseif ~isempty(space) && ~isempty(dots)
% end
guidata(hObject, handles);

% Hints: get(hObject,'String') returns contents of Polytrodes_2_run as text
%        str2double(get(hObject,'String')) returns contents of Polytrodes_2_run as a double


% --- Executes during object creation, after setting all properties.
function Polytrodes_2_run_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Polytrodes_2_run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%end


% --- Executes on selection change in Polytrode_size.
function Polytrode_size_Callback(hObject, eventdata, handles)
% hObject    handle to Polytrode_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.polytrodesize = str2double(get(hObject,'String'));
guidata(hObject, handles);
% Hints: contents = cellstr(get(hObject,'String')) returns Polytrode_size contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Polytrode_size


% --- Executes during object creation, after setting all properties.
function Polytrode_size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Polytrode_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


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
addpath([handles.path, '/Mat_files']);
addpath(genpath(handles.path));

poli = [handles.dirpath, '/Polytrodes'];
mkdir(poli);
polytrode_text_maker(handles,handles.polytrodesize);
addpath(poli);

handles.hand = cnt_2_mat(handles.fname);

spikespath = [handles.dirpath, '/Polytrode_spikes'];
mkdir(spikespath);
cd(spikespath);
if exist([spikespath,'/polytrode',handles.polytrodes_2_run,'_spikes.mat']) ==0
Get_spikes_pol(handles.polytrodes_2_run);
end
cd(handles.dirpath);
addpath(spikespath)
timespath = [handles.dirpath, '/Times_polytrodes'];
mkdir(timespath);
cd(timespath);
if exist([timespath, 'times_polytrode', handles.polytrodes_2_run,'.mat']) ==0
Do_clustering(['polytrode',num2str(handles.polytrodes_2_run),'_spikes.mat']);
end
cd(handles.dirpath);


% --- Executes on button press in Load_data.
function Load_data_Callback(hObject, eventdata, handles)
% hObject    handle to Load_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fname, path, findex]=uigetfile('*.cnt','Select the data file');
handles.fname = fname;
handles.path = path;
handles.findex = findex;
guidata(hObject, handles);

% --- Executes on button press in Save_repo.
function Save_repo_Callback(hObject, eventdata, handles)
% hObject    handle to Save_repo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.dirpath = uigetdir;

name = [handles.dirpath,'/log_deblock.mat'];
m = matfile(name,'Writable',true);
handles.polytrodes = m.polytrodes;
guidata(hObject, handles);

