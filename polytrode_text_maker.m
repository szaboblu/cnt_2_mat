function polytrode_text_maker(handles,varargin)
% poli : how many electrodes do we want to be in 1 polytrode

polytrodes ={};
if size(varargin)>0
    poli = varargin{1};
    


for i = 1 : (handles.chnum - poli +1)
        if ~exist([handles.dirpath,'/Polytrodes'],'dir')
            mkdir([handles.dirpath,'/Polytrodes']);
        end
            textfile_name = [handles.dirpath,'/Polytrodes','/','polytrode' ,num2str(i) ,'.txt'];
            fileID = fopen(textfile_name,'w');
            vec = [];
        for n = 1 : poli-1
            vec = [vec, handles.chsign ,handles.chnames{i+n-1} , '.mat','\n'];
            polytrodes{i,n} =  [handles.chsign,handles.chnames{i+n-1},'.mat'];
        end
            vec = [vec, handles.chsign ,handles.chnames{i+poli-1} , '.mat'];
            polytrodes{i,poli} =  [handles.chsign,handles.chnames{i+poli-1},'.mat'];
            %fprintf(fileID,[list(i).name '\n' list(i+1).name]);
            fprintf(fileID,vec);
            fclose(fileID);
end

end


name = [handles.dirpath,'/log_deblock.mat'];
m = matfile(name,'Writable',true);
if size(polytrodes,2) > 0
m.polytrodes = polytrodes;
end
%handles.path =[handles.path,'/',handles.par];
if ~isempty(who('handles','h'))
m.handles = handles.h;
end
end