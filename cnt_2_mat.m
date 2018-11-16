function [h,e,handles] = cnt_2_mat(filename)
fid = fopen(filename,'r');
disp(['Loading file ' filename ' ...'])

handles.rep = dir(filename);
handles.path = [handles.rep.folder , '/Mat_files'];
mkdir(handles.path);

h.rev               = fread(fid,12,'char');
h.nextfile          = fread(fid,1,'long');
h.prevfile          = fread(fid,1,'long');
h.type              = fread(fid,1,'char');
h.id                = fread(fid,20,'char');
h.oper              = fread(fid,20,'char');
h.doctor            = fread(fid,20,'char');
h.referral          = fread(fid,20,'char');
h.hospital          = fread(fid,20,'char');
h.patient           = fread(fid,20,'char');
h.age               = fread(fid,1,'short');
h.sex               = fread(fid,1,'char');
h.hand              = fread(fid,1,'char');
h.med               = fread(fid,20, 'char');
h.category          = fread(fid,20, 'char');
h.state             = fread(fid,20, 'char');
h.label             = fread(fid,20, 'char');
h.date              = fread(fid,10, 'char');
h.time              = fread(fid,12, 'char');
h.mean_age          = fread(fid,1,'float');
h.stdev             = fread(fid,1,'float');
h.n                 = fread(fid,1,'short');
h.compfile          = fread(fid,38,'char');
h.spectwincomp      = fread(fid,1,'float');
h.meanaccuracy      = fread(fid,1,'float');
h.meanlatency       = fread(fid,1,'float');
h.sortfile          = fread(fid,46,'char');
h.numevents         = fread(fid,1,'int');
h.compoper          = fread(fid,1,'char');
h.avgmode           = fread(fid,1,'char');
h.review            = fread(fid,1,'char');
h.nsweeps           = fread(fid,1,'ushort');
h.compsweeps        = fread(fid,1,'ushort');
h.acceptcnt         = fread(fid,1,'ushort');
h.rejectcnt         = fread(fid,1,'ushort');
h.pnts              = fread(fid,1,'ushort');
h.nchannels         = fread(fid,1,'ushort');
h.avgupdate         = fread(fid,1,'ushort');
h.domain            = fread(fid,1,'char');
h.variance          = fread(fid,1,'char');
h.rate              = fread(fid,1,'ushort');
h.scale             = fread(fid,1,'double');
h.veogcorrect       = fread(fid,1,'char');
h.heogcorrect       = fread(fid,1,'char');
h.aux1correct       = fread(fid,1,'char');
h.aux2correct       = fread(fid,1,'char');
h.veogtrig          = fread(fid,1,'float');
h.heogtrig          = fread(fid,1,'float');
h.aux1trig          = fread(fid,1,'float');
h.aux2trig          = fread(fid,1,'float');
h.heogchnl          = fread(fid,1,'short');
h.veogchnl          = fread(fid,1,'short');
h.aux1chnl          = fread(fid,1,'short');
h.aux2chnl          = fread(fid,1,'short');
h.veogdir           = fread(fid,1,'char');
h.heogdir           = fread(fid,1,'char');
h.aux1dir           = fread(fid,1,'char');
h.aux2dir           = fread(fid,1,'char');
h.veog_n            = fread(fid,1,'short');
h.heog_n            = fread(fid,1,'short');
h.aux1_n            = fread(fid,1,'short');
h.aux2_n            = fread(fid,1,'short');
h.veogmaxcnt        = fread(fid,1,'short');
h.heogmaxcnt        = fread(fid,1,'short');
h.aux1maxcnt        = fread(fid,1,'short');
h.aux2maxcnt        = fread(fid,1,'short');
h.veogmethod        = fread(fid,1,'char');
h.heogmethod        = fread(fid,1,'char');
h.aux1method        = fread(fid,1,'char');
h.aux2method        = fread(fid,1,'char');
h.ampsensitivity    = fread(fid,1,'float');
h.lowpass           = fread(fid,1,'char');
h.highpass          = fread(fid,1,'char');
h.notch             = fread(fid,1,'char');
h.autoclipadd       = fread(fid,1,'char');
h.baseline          = fread(fid,1,'char');
h.offstart          = fread(fid,1,'float');
h.offstop           = fread(fid,1,'float');
h5.reject            = fread(fid,1,'char');
h.rejstart          = fread(fid,1,'float');
h.rejstop           = fread(fid,1,'float');
h.rejmin            = fread(fid,1,'float');
h.rejmax            = fread(fid,1,'float');
h.trigtype          = fread(fid,1,'char');
h.trigval           = fread(fid,1,'float');
h.trigchnl          = fread(fid,1,'char');
h.trigmask          = fread(fid,1,'short');
h.trigisi           = fread(fid,1,'float');
h.trigmin           = fread(fid,1,'float');
h.trigmax           = fread(fid,1,'float');
h.trigdir           = fread(fid,1,'char');
h.autoscale         = fread(fid,1,'char');
h.n2                = fread(fid,1,'short');
h.dir               = fread(fid,1,'char');
h.dispmin           = fread(fid,1,'float');
h.dispmax           = fread(fid,1,'float');
h.xmin              = fread(fid,1,'float');
h.xmax              = fread(fid,1,'float');
h.automin           = fread(fid,1,'float');
h.automax           = fread(fid,1,'float');
h.zmin              = fread(fid,1,'float');
h.zmax              = fread(fid,1,'float');
h.lowcut            = fread(fid,1,'float');
h.highcut           = fread(fid,1,'float');
h.common            = fread(fid,1,'char');
h.savemode          = fread(fid,1,'char');
h.manmode           = fread(fid,1,'char');
h.ref               = fread(fid,10,'char');
h.rectify           = fread(fid,1,'char');
h.displayxmin       = fread(fid,1,'float');
h.displayxmax       = fread(fid,1,'float');
h.phase             = fread(fid,1,'char');
h.screen            = fread(fid,16,'char');
h.calmode           = fread(fid,1,'short');
h.calmethod         = fread(fid,1,'short');
h.calupdate         = fread(fid,1,'short');
h.calbaseline       = fread(fid,1,'short');
h.calsweeps         = fread(fid,1,'short');
h.calattenuator     = fread(fid,1,'float');
h.calpulsevolt      = fread(fid,1,'float');
h.calpulsestart     = fread(fid,1,'float');
h.calpulsestop      = fread(fid,1,'float');
h.calfreq           = fread(fid,1,'float');
h.taskfile          = fread(fid,34,'char');
h.seqfile           = fread(fid,34,'char');
h.spectmethod       = fread(fid,1,'char');
h.spectscaling      = fread(fid,1,'char');
h.spectwindow       = fread(fid,1,'char');
h.spectwinlength    = fread(fid,1,'float');
h.spectorder        = fread(fid,1,'char');
h.headgain          = fread(fid,1,'short');
h.additionalfiles   = fread(fid,1,'int');
h.unused            = fread(fid,5,'char');
h.fspstopmethod     = fread(fid,1,'short');
h.fspstopmode       = fread(fid,1,'short');
h.fspfvalue         = fread(fid,1,'float');
h.fsppoint          = fread(fid,1,'short');
h.fspblocksize      = fread(fid,1,'short');
h.fspp1             = fread(fid,1,'ushort');
h.fspp2             = fread(fid,1,'ushort');
h.fspalpha          = fread(fid,1,'float');
h.fspnoise          = fread(fid,1,'float');
h.fspv1             = fread(fid,1,'short');
h.montage           = fread(fid,40,'char');
h.eventfile         = fread(fid,40,'char');
h.fratio            = fread(fid,1,'float');
h.minor_rev         = fread(fid,1,'char');
h.eegupdate         = fread(fid,1,'short');
h.compressed        = fread(fid,1,'char');
h.xscale            = fread(fid,1,'float');
h.yscale            = fread(fid,1,'float');
h.xsize             = fread(fid,1,'float');
h.ysize             = fread(fid,1,'float');
h.acmode            = fread(fid,1,'char');
h.commonchnl        = fread(fid,1,'uchar');
h.xtics             = fread(fid,1,'char');
h.xrange            = fread(fid,1,'char');
h.ytics             = fread(fid,1,'char');
h.yrange            = fread(fid,1,'char');
h.xscalevalue       = fread(fid,1,'float');
h.xscaleinterval    = fread(fid,1,'float');
h.yscalevalue       = fread(fid,1,'float');
h.yscaleinterval    = fread(fid,1,'float');
h.scaletoolx1       = fread(fid,1,'float');
h.scaletooly1       = fread(fid,1,'float');
h.scaletoolx2       = fread(fid,1,'float');
h.scaletooly2       = fread(fid,1,'float');
h.port              = fread(fid,1,'short');
h.numsamples        = fread(fid,1,'ulong');
h.filterflag        = fread(fid,1,'char');
h.lowcutoff         = fread(fid,1,'float');
h.lowpoles          = fread(fid,1,'short');
h.highcutoff        = fread(fid,1,'float');
h.highpoles         = fread(fid,1,'short');
h.filtertype        = fread(fid,1,'char');
h.filterdomain      = fread(fid,1,'char');
h.snrflag           = fread(fid,1,'char');
h.coherenceflag     = fread(fid,1,'char');
h.continuoustype    = fread(fid,1,'char');
h.eventtablepos     = fread(fid,1,'long');
h.continuousseconds = fread(fid,1,'float');
h.channeloffset     = fread(fid,1,'long');
h.autocorrectflag   = fread(fid,1,'char');
h.dcthreshold       = fread(fid,1,'uchar');

for n = 1:h.nchannels
   e(n).lab            = deblank(char(fread(fid,14,'char')'));
    e(n).reference      = fread(fid,1,'char');
    e(n).skip           = fread(fid,1,'char');
    e(n).reject         = fread(fid,1,'char');
    e(n).display        = fread(fid,1,'char');
    e(n).bad            = fread(fid,1,'char');
    e(n).n              = fread(fid,1,'ushort');
    e(n).avg_reference  = fread(fid,1,'char');
    e(n).clipadd        = fread(fid,1,'char');
    e(n).x_coord        = fread(fid,1,'float');
    e(n).y_coord        = fread(fid,1,'float');
    e(n).veog_std       = fread(fid,1,'float');
    e(n).snr            = fread(fid,1,'float');
    e(n).heog_wt        = fread(fid,1,'float');
    e(n).heog_std       = fread(fid,1,'float');
    e(n).baseline       = fread(fid,1,'short');
    e(n).filtered       = fread(fid,1,'char');
    e(n).fsp            = fread(fid,1,'char');
    e(n).aux1_wt        = fread(fid,1,'float');
    e(n).aux1_std       = fread(fid,1,'float');
    e(n).senstivity     = fread(fid,1,'float');
    e(n).gain           = fread(fid,1,'char');
    e(n).hipass         = fread(fid,1,'char');
    e(n).lopass         = fread(fid,1,'char');
    e(n).page           = fread(fid,1,'uchar');
    e(n).size           = fread(fid,1,'uchar');
    e(n).impedance      = fread(fid,1,'uchar');
    e(n).rectify        = fread(fid,1,'char');
    e(n).physicalchnl   = fread(fid,1,'char');
    e(n).calib          = fread(fid,1,'float');
   % handles.chnames{n} = e(n).physicalchnl;
end


handles.filename = filename;
handles.databyte = 2;
handles.srate=h.rate;
handles.chnum=h.nchannels;
handles.wsize = h.numsamples/handles.srate;
handles.byte = h.numsamples;
handles.trig = h.trigisi;
     
handles.inx1=0;
handles.amp=0.02;
lengt=handles.wsize;


handles.fileinfo=dir(handles.filename);
handles.filesize=handles.fileinfo.bytes;
handles.page={[1:handles.chnum]};
handles.bytepersec=handles.srate * handles.databyte * handles.chnum;
handles.minbyte=900+75*handles.chnum;
handles.maxbyte=handles.filesize-handles.minbyte;

maxsec=(handles.maxbyte-handles.minbyte)/handles.bytepersec;

% ha a v�g�n lenn�nek hamis adatpontok
dif = mod(maxsec,10);
if dif < 0.5 
   handles.maxsec = maxsec-dif;
else 
    handles.maxsec = maxsec;
end

% channel nevek
for n = 1:handles.chnum
        fseek(fid,900+75*(n-1),-1);
        str=fread(fid,10,'char');
        space=find(str== 32);
        das=find(str==45);
        num = str > 47 & str < 58;
        str=char(str);
        
        
        if isempty(space)
            space=10;
        else
            space=space-1;
        end
        
        handles.chnames{n}=str(num)';
        
        if ~isempty(das)
            c1=str(1:das(1)-1)';
            c2=str(das(1)+1:space(1))';
            handles.orig.chnames{n,1}=c1;
            handles.orig.chnames{n,1}=c2;
        else
            c1=str(1:space(1))';
            c2='REF';
            handles.orig.chnames{n,1}=c1;
            handles.orig.chnames{n,2}=c2;
        end
    end

handles.chsign = handles.filename(1,1:12);

%% M�trixba kiolvas�s onnan ment�s
% Gyorsabb(1,5 GB : ~11 min) viszont sok mem�ri�t foglal(1,5 GB -> 7 GB(t�lcsordult Ram?)) 
% --> nagyobb f�jl eset�n megtelik a mem�ria
% min�l kisebb ann�l gyorsabb? - nem csordul t�l

% tic
% fseek(fid,handles.minbyte,-1);
% adat = fread(fid,[handles.chnum, handles.maxsec*handles.srate],'int16');
% toc
% 
% for n = 1 : handles.chnum
%   data = adat(n,:)'.*handles.trig;
%   handles.chname{n,1} = [handles.path, '/', handles.chsign , num2str(handles.chnames{1,n}), '.mat'];
%   disp(['Saving Channel ' num2str(n) '/' num2str(handles.chnum) ' ...'])
%   save(handles.chname{n,1},'data');
% end
% toc

%% --> Csatorn�nk�nti kiolvas�s �s ment�s
%valamivel lassabb(1,5 GB: ~13 min) viszont kev�s mem�ri�t haszn�l(1 channel + matlab)~1 GB)
% --> j� nagy f�jlokhoz is

tic
%for n = 1:handles.chnum
n = 1;
    fseek(fid,handles.minbyte + 2*(n-1),-1);
    skip = (handles.chnum-1)*2;
    data = fread(fid, [1,handles.maxsec*handles.srate] ,'int16',skip)'.*handles.trig;
    handles.chname{n,1} = [handles.path, '/', handles.chsign , num2str(handles.chnames{1,n}), '.mat'];
    disp(['Saving Channel ' num2str(n) '/' num2str(handles.chnum) ' ...']);
    save (handles.chname{n,1},'data');
%end
toc

end

