function polytrode_txt_maker(handles,par,poli)
% poli : how many electrodes do we want to be in 1 polytrode

polytrodes = {};
for i = 1 : handles.chnum - poli +1
    
        for n = 1 : poli
            polytrodes{i,n} =  [handles.chsign,handles.chnames{i+n-1},'.mat'];
        end    
end

name = [handles.fileinfo.folder,'/',par,'/log_deblock.mat'];
m = matfile(name,'Writable',true);
m.polytrodes = polytrodes;
handles.path =[handles.path,'/',par];
m.handles = handles;
end