function polytrode_txt_maker(handles,poli)
% poli : how many electrodes do we want to be in 1 polytrode


path = [handles.rep.folder , '/Polytrode_txt'];

if exist(path) ~= 0
 rmdir(path , 's') ;
end

mkdir(path);

for i = 1 : handles.chnum - poli +1
    pol = [];
        for n = 0 : poli-2
            pol =  [pol , handles.chsign, handles.chnames{i+n},'.mat','\n'];
        end
        pol =  [pol , handles.chsign, handles.chnames{i+poli-1},'.mat'];
    num = num2str(i);
    name = [path,'/polytrode',num,'.txt'];
    fileID = fopen(name,'w');
    fprintf(fileID,pol);
end

end