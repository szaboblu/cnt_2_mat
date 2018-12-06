function [hand] = cnt_2_mat(filename, varargin)
fid = fopen(filename,'r');

if size(varargin) > 0
matrix = varargin{2};
paralell = varargin{3};
%ch = varargin{1};
else 
    matrix = false;
    paralell = false;
    %ch = all;
end


%hand.fid = fid;
if fid == -1
  error('Author:Function:OpenFile', 'Cannot open file: %s', filename);
end

disp(['Loading file ' filename ' ...'])

fileinfo = dir(filename);
hand.name = fileinfo.name;
hand.path = fileinfo.folder;
mkdir([hand.path, '/Mat_files']);

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
   % hand.chnames{n} = e(n).physicalchnl;
end


%hand.filename = filename;
hand.databyte = 2;
hand.srate=h.rate;
hand.chnum=h.nchannels;
%hand.wsize = h.numsamples/hand.srate;
%hand.byte = h.numsamples;
%hand.trig = h.trigisi;
     
%hand.inx1=0;
%hand.amp=0.02;
%lengt=hand.wsize;


%hand.fileinfo=dir(hand.filename);
hand.filesize=fileinfo.bytes;
%hand.page={[1:hand.chnum]};
hand.bytepersec=hand.srate * hand.databyte * hand.chnum;
hand.minbyte=900+75*hand.chnum;
%hand.maxbyte=hand.filesize-hand.minbyte;

maxsec=(fileinfo.bytes-hand.minbyte)/hand.bytepersec;

% ha a végén lennének hamis adatpontok
dif = mod(maxsec,10);
if dif < 0.5 
   hand.maxsec = maxsec-dif;
else 
    hand.maxsec = maxsec;
end

% channel nevek
for n = 1:hand.chnum
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
        
        hand.chnames{n}=str(num)';
        
%         if ~isempty(das)
%             c1=str(1:das(1)-1)';
%             c2=str(das(1)+1:space(1))';
%             hand.orig.chnames{n,1}=c1;
%             hand.orig.chnames{n,1}=c2;
%         else
%             c1=str(1:space(1))';
%             c2='REF';
%             hand.orig.chnames{n,1}=c1;
%             hand.orig.chnames{n,2}=c2;
%         end
    end

hand.chsign = fileinfo.name(1,1:12);

path = [hand.path,'/Mat_files'];
if exist(path) == 0
if matrix == true
    %% Mátrixba kiolvasás onnan mentés
    % Gyorsabb(1,5 GB : ~11 min) viszont sok memóriát foglal(1,5 GB -> 7 GB(túlcsordult Ram?)) 
    % --> nagyobb fájl esetén megtelik a memória
    % minél kisebb annél gyorsabb? - nem csordul túl

    tic
    fseek(fid,hand.minbyte,-1);
    adat = fread(fid,[hand.chnum, hand.maxsec*hand.srate],'int16');
    toc
    tic
    if paralell == true
        %%Ezen belül parallel kiolvasással:
        % 1.5 GB: 9 min (nem annyira jelentõs mint a párhuzamos kiolvasásnál)
        
        parfor n = 1 : hand.chnum
            data = [];
            data(:,n) = adat(n,:)'.*0.25;
            disp(['Saving Channel ' num2str(n) '/' num2str(hand.chnum) ' ...'])
            m = matfile([path, '/', hand.chsign , num2str(hand.chnames{1,n}), '.mat'],'writable',true);
            m.data = data(:,n);
        end
        toc
    else
        for n = 1 : hand.chnum
            data = adat(n,:)'.*0.25;
            hand.chname{n,1} = [path, '/', hand.chsign , num2str(hand.chnames{1,n}), '.mat'];
            disp(['Saving Channel ' num2str(n) '/' num2str(hand.chnum) ' ...'])
            save(hand.chname{n,1},'data');
        end
        toc
    end
elseif matrix ~= true
    %% --> Csatornánkénti kiolvasás és mentés
    %valamivel lassabb(1,5 GB: ~13 min) viszont kevés memóriát használ(1 channel + matlab)~1 GB)
    % --> jó nagy fájlokhoz is

    if paralell == true
        %% Parallel Csatornából kiolvasás és mentés
        % kihasználja az összes magot (nekem 2)
        % nagyon gyors (1.5 GB : 7.5 min)
        % a leglassab folyamat határozza meg egy szakasz gyorsaságát
        % két munkásnál két csatorna = 25 + 12 s
        % két munkással 24 csatorna = 24/2 * (25 + 12) ~ 7.4 min

        skip = (hand.chnum-1)*2;
        tic

        parfor n = 1:hand.chnum
            data = [];
            fid = fopen(filename,'r'); 
            fseek(fid,hand.minbyte + 2*(n - 1),-1);
            data(:,n) = fread(fid, [1,hand.maxsec*hand.srate]...
            ,'int16',skip)'.*0.25; % ~ 25 s/ch
            disp(['Saving Channel ' num2str(n) '/' num2str(hand.chnum) ' ...'])
            m = matfile([path, '/', hand.chsign , num2str(hand.chnames{1,n}), '.mat'],'writable',true);
            m.data = data(:,n); % ~ 10-12 s/ch
        end
        toc
    else
        tic
        for n = 1:hand.chnum
            fseek(fid,hand.minbyte + 2*(n-1),-1);
            skip = (hand.chnum-1)*2;
            data = fread(fid, [1,hand.maxsec*hand.srate]...
            ,'int16',skip)'.*0.25; % ~ 20 s/ch
            hand.chname{n,1} = [path, '/', hand.chsign , num2str(hand.chnames{1,n}), '.mat'];
            disp(['Saving Channel ' num2str(n) '/' num2str(hand.chnum) ' ...']);
            save (hand.chname{n,1},'data'); % ~ 11 s/ch
        end
        toc
    end
end
end
end

