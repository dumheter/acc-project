function output = standard_1_c(Methods, rootpath, S, K, T, r, sig, B, U)
fprintf('Problem 1 c) I');

filepathsBSupoutCallI=getfilenames('./','BSupoutCallI_*.m');
par={S,K,T,r,sig,B};
[timeBSupoutCallI,relerrBSupoutCallI] = executor(rootpath,filepathsBSupoutCallI,U,par)

tBSupoutCallI=NaN(numel(Methods),1); rBSupoutCallI=NaN(numel(Methods),1);
for ii=1:numel(Methods)
    for jj=1:numel(filepathsBSupoutCallI)
        a=filepathsBSupoutCallI{jj}(3:3+numel(Methods{ii}));
        b=[Methods{ii},'/'];
        if strcmp(a,b)
            tBSupoutCallI(ii)=timeBSupoutCallI(jj);
            rBSupoutCallI(ii)=relerrBSupoutCallI(jj);
        end
    end
end
output = [tBSupoutCallI, rBSupoutCallI];
cd(rootpath);
end