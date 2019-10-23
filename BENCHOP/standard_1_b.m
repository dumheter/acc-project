function [tBSamPutUI, rBSamPutUI] = standard_1_b (Methods, rootpath, S, K, T, r, sig, U)
% Problem 1 b) I

fprintf('Problem 1 b) I');
filepathsBSamPutUI=getfilenames('./','BSamPutUI_*.m');
par={S,K,T,r,sig};
[timeBSamPutUI,relerrBSamPutUI] = executor(rootpath,filepathsBSamPutUI,U,par)

tBSamPutUI=NaN(numel(Methods),1); rBSamPutUI=NaN(numel(Methods),1);
for ii=1:numel(Methods)
    for jj=1:numel(filepathsBSamPutUI)
        a=filepathsBSamPutUI{jj}(3:3+numel(Methods{ii}));
        b=[Methods{ii},'/'];
        if strcmp(a,b)
            tBSamPutUI(ii)=timeBSamPutUI(jj);
            rBSamPutUI(ii)=relerrBSamPutUI(jj);
        end
    end
end

cd(rootpath);
end