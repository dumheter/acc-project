function [tBSamPutUII, rBSamPutUII] = standard_1_b_II(Methods, rootpath, S, K, T, r, sig, U)
filepathsBSamPutUII=getfilenames('./','BSamPutUII_*.m');
par={S,K,T,r,sig};
[timeBSamPutUII,relerrBSamPutUII] = executor(rootpath,filepathsBSamPutUII,U,par)

tBSamPutUII=NaN(numel(Methods),1); rBSamPutUII=NaN(numel(Methods),1);
for ii=1:numel(Methods)
    for jj=1:numel(filepathsBSamPutUII)
        a=filepathsBSamPutUII{jj}(3:3+numel(Methods{ii}));
        b=[Methods{ii},'/'];
        if strcmp(a,b)
            tBSamPutUII(ii)=timeBSamPutUII(jj);
            rBSamPutUII(ii)=relerrBSamPutUII(jj);
        end
    end
end

cd(rootpath);
end