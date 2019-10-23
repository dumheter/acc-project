function [tBSeuCallUI, rBSeuCallUI] = standard_1_a(Methods, rootpath, S, K, T, r, sig, U)
%STARDARD_1_a Solves the problem of 1 a
% Problem 1 a) I
%   Detailed explanation goes here

fprintf('Problem 1 a) I');


filepathsBSeuCallUI=getfilenames('./','BSeuCallUI_*.m');
par={S,K,T,r,sig};
[timeBSeuCallUI,relerrBSeuCallUI] = executor(rootpath,filepathsBSeuCallUI,U,par)

tBSeuCallUI=NaN(numel(Methods),1); rBSeuCallUI=tBSeuCallUI;
for ii=1:numel(Methods)
    for jj=1:numel(filepathsBSeuCallUI)
        a=filepathsBSeuCallUI{jj}(3:3+numel(Methods{ii}));
        b=[Methods{ii},'/'];
        if strcmp(a,b)
            tBSeuCallUI(ii)=timeBSeuCallUI(jj);
            rBSeuCallUI(ii)=relerrBSeuCallUI(jj);
        end
    end
end

cd(rootpath);


end

