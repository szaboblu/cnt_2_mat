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

% Last Modified by GUIDE v2.5 10-Dec-2018 18:36:13

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

if ~exist(handles.dirpath,'dir')
handles.dirpath = uigetdir;
end

% addpath([handles.path, filesep 'Mat_files']);
% addpath(genpath(handles.path));

spikespath = [handles.dirpath, filesep 'Polytrode_spikes'];
if ~exist(spikespath,'dir')
mkdir(spikespath);
end
cd(spikespath);

c = cell(size(handles.polytrodes_2_run,2),1);
for i = 1:size(handles.polytrodes_2_run,2)
    c{i,1} = [spikespath,filesep 'polytrode',num2str(handles.polytrodes_2_run(1,i)),'_spikes.mat'];
end
handles.spcfiles = c;

tic

parfor i = 1:size(handles.polytrodes_2_run,2)
if  ~exist(handles.spcfiles{i,1},'file')
    if isfield(handles,'par')
        disp(['Running Get_spikes_pol on polytrode ' num2str(handles.polytrodes_2_run(1,i)) ' ...'])
        %Get_spikes_pol(handles.polytrodes_2_run(1,i),'parallel',true);
        Get_spikes_pol(handles.polytrodes_2_run(1,i),'par',handles.par);
    else
        Get_spikes_pol(handles.polytrodes_2_run(1,i));
    end
end
end

toc
addpath(spikespath)

cd(handles.dirpath);
timespath = [handles.dirpath, filesep 'Times_polytrodes'];
if ~exist(timespath,'dir')
mkdir(timespath);
end
cd(timespath);

d = cell(size(handles.polytrodes_2_run,2),1);
for i = 1:size(handles.polytrodes_2_run,2)
    d{i,1} = [timespath,filesep 'times_polytrode',num2str(handles.polytrodes_2_run(1,i)),'.mat'];
end
handles.timefiles = d;

tic
parfor i = 1: size(handles.spcfiles,1) 
if  ~exist(handles.timefiles{i,1},'file')
    if isfield(handles,'par')
        disp(['Running Do_clustering on polytrode ' num2str(handles.polytrodes_2_run(1,i)) ' ...'])
        %Do_clustering(handles.spcfiles{i},'parallel',true);
        Do_clustering(handles.spcfiles{i,1},'par',handles.par);
    else
        Do_clustering(handles.spcfiles{i,1});
    end
end
end
toc

addpath(timespath);
cd(handles.dirpath);

% if handles.deblock && isfield(handles,'segments')
% nspath = [handles.dirpath, filesep 'SUAs'];
% if ~exist(nspath,'dir')
% mkdir(nspath);
% end
% cd(nspath);
% tic
% for i = 1:size(handles.timefiles,2)
% disp(['Running wave_clus_2_nswiew on times_polytrode ' num2str(handles.polytrodes_2_run(1,i)) ' ...'])
% [clusters_2_nswiew] = wave_clus_2_nswiew(num2str(handles.polytrodes_2_run(1,i)), [handles.dirpath,filesep 'log_deblock.mat'], timespath);
% end
% toc
% addpath(nspath);
% cd(handles.dirpath);
% 
% thrpath = [handles.dirpath, filesep 'THRs'];
% if ~exist(thrpath,'dir')
% mkdir(thrpath);
% end
% cd(thrpath);
% tic
% for i = 1:size(handles.timefiles,2)
% disp(['Running wave_clus_2_nswiew on polytrode ' num2str(handles.polytrodes_2_run(1,i)) ' ...'])
% [t_dp_thr, thr_step, ch_id, par] = noise_level_2_nswiew(num2str(handles.polytrodes_2_run(1,i)), [handles.dirpath,filesep 'log_deblock.mat'], spikespath);
% end
% toc
% addpath(thrpath);
% cd(handles.dirpath);
% end
guidata(hObject, handles);


% --- Executes on button press in Load_data.
function Load_data_Callback(hObject, eventdata, handles)
% hObject    handle to Load_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[handles.fname, path, findex] = uigetfile('*.cnt','Select the data file');
h = cnt_2_mat([path,handles.fname]);
handles.h = h;
handles.path = path;
addpath(genpath([handles.path,filesep 'Mat_files']))

if isfield(handles,'dirpath')
poli = [handles.dirpath, filesep 'Polytrodes'];
if ~exist(poli,'dir')
mkdir(poli);
polytrode_text_maker(h,handles.polytrodesize);
end
addpath(genpath(poli));
end

handles.chsign = h.chsign;
handles.chnum = h.chnum;
handles.chnames=h.chnames;

guidata(hObject, handles);


% --- Executes on button press in Polytrode_chooser.
function Polytrode_chooser_Callback(hObject, eventdata, handles)
% hObject    handle to Polytrode_chooser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.dirpath = uigetdir;

% Ha nincs polytrodes létrehoz egyet
if ~exist([handles.dirpath, filesep 'Polytrodes'],'dir')
    prompt=['Set polytrodesize:', newline];
    answer=inputdlg(prompt,'There is no polytrode.txt in the folder: ',1,{''});
    [val, status] = str2num(answer{1});  
    if ~status
         val = 'all';
    end
    handles.polytrodesize = val;
    polsize = handles.polytrodesize;
    polytrode_text_maker(handles,polsize);
end

addpath(genpath([handles.dirpath, filesep 'Polytrodes']));

%ha már futtatunk le batch fájlot azokat a beállításokat kéri be
if exist([handles.dirpath filesep 'Polytrode_spikes'],'dir')
    folderinfo = dir([handles.dirpath filesep 'Polytrode_spikes']);
if ~isempty(folderinfo(3).name)
    for i = 1 : size(folderinfo)-2
        k = folderinfo(i+2).name;
        m = matfile([handles.dirpath, filesep 'Polytrode_spikes' filesep k]);
        if ~isempty(who(m, 'par'))
            handles.par = m.par;
            disp('Par saved')
        end
    end

end
else
    set_parameters_ui;
end

name = [handles.dirpath filesep 'log_deblock.mat'];
m = matfile([handles.dirpath filesep 'log_deblock.mat'],'Writable',true);
varIsInMat = @(name) ~isempty(who(m, name));
if ~exist(name,'file')
    if isfield(handles,'dirpath')
        poli = [handles.dirpath, filesep 'Polytrodes'];
        if ~varIsInMat('handles')
            mkdir(poli);
            polytrode_text_maker(handles,handles.polytrodesize);
        end
    end
    
else
    if varIsInMat('polytrodes')
        handles.polytrodes = m.polytrodes;
        disp('Van polytrodes')
    else
        poli = [handles.dirpath, filesep 'Polytrodes'];
            mkdir(poli);
            cd(mkdir);
            polytrode_text_maker(handles,handles.polytrodesize);
    end

    %end

    if varIsInMat('segments')
        handles.segments = m.segments;
    else
        [fname, path, findex] = uigetfile('*.mat','Select the deblock file');
        name=[path, fname];
        d = matfile(name,'Writable',true);
        handles.segments = d.segments;
        m.segments = d.segments;
        di= ['Segments saved from:' name];
        disp(di)
    end

    %if ~isempty(who('handles', 'polytrodes'))
        
    %end
end

if ~isempty(who('handles', 'polytrodes'))

        prompt=['Existing pages:', newline];
        sz = strings(size(m.polytrodes, 1));
        
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
end
guidata(hObject, handles);


% --- Executes on button press in Set_par.
function Set_par_Callback(hObject, eventdata, handles)
set_parameters_ui
 

% hObject    handle to Set_par (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
