function [tBSeuCallUII, rBSeuCallUII] = standard_1_a_II(Methods, rootpath, S, K, T, r, sig, U)
fprintf('Problem 1 a) II');
filepathsBSeuCallUII=getfilenames('./','BSeuCallUII_*.m');
par={S,K,T,r,sig};
[timeBSeuCallUII,relerrBSeuCallUII] = executor(rootpath,filepathsBSeuCallUII,U,par)

tBSeuCallUII=NaN(numel(Methods),1); rBSeuCallUII=NaN(numel(Methods),1);
for ii=1:numel(Methods)
    for jj=1:numel(filepathsBSeuCallUII)
        a=filepathsBSeuCallUII{jj}(3:3+numel(Methods{ii}));
        b=[Methods{ii},'/'];
        if strcmp(a,b)
            tBSeuCallUII(ii)=timeBSeuCallUII(jj);
            rBSeuCallUII(ii)=relerrBSeuCallUII(jj);
        end
    end
end

cd(rootpath);
end