function polytrode_txt_maker(handles,par,poli)
% poli : how many electrodes do we want to be in 1 polytrode

polytrodes = {};
mkdir([handles.path,'/Polytrodes']);
for i = 1 : handles.chnum - poli +1
            textfile_name = ['polytrode' handles.chnames{i} '.txt'];
            fileID = fopen(textfile_name,'w');
            vec = [];
        for n = 1 : poli-1
            vec = [vec, handles.chsign ,handles.chnames{i+n-1} , '.mat','\n'];
            %polytrodes{i,n} =  [handles.chsign,handles.chnames{i+n-1},'.mat'];
        end
            vec = [vec, handles.chsign ,handles.chnames{i+poli} , '.mat'];
            %fprintf(fileID,[list(i).name '\n' list(i+1).name]);
            fprintf(fileID,vec);
            fclose(fileID);
            %disp([num2str(i-2) '. file']);
end

% name = [handles.fileinfo.folder,'/',par,'/log_deblock.mat'];
% m = matfile(name,'Writable',true);
% m.polytrodes = polytrodes;
% handles.path =[handles.path,'/',par];
% m.handles = handles;
end