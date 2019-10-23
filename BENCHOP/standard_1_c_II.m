function [tBSupoutCallII, rBSupoutCallII] = standard_1_c_II(Methods, rootpath, S, K, T, r, sig, B, U)
filepathsBSupoutCallII=getfilenames('./','BSupoutCallII_*.m');
par={S,K,T,r,sig,B};
[timeBSupoutCallII,relerrBSupoutCallII] = executor(rootpath,filepathsBSupoutCallII,U,par)

tBSupoutCallII=NaN(numel(Methods),1); rBSupoutCallII=NaN(numel(Methods),1);
for ii=1:numel(Methods)
    for jj=1:numel(filepathsBSupoutCallII)
        a=filepathsBSupoutCallII{jj}(3:3+numel(Methods{ii}));
        b=[Methods{ii},'/'];
        if strcmp(a,b)
            tBSupoutCallII(ii)=timeBSupoutCallII(jj);
            rBSupoutCallII(ii)=relerrBSupoutCallII(jj);
        end
    end
end

cd(rootpath);
end