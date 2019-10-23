%Global Script that runs each problem%
clear
close all
format long
warning off

Methods={'MC','MC-S','QMC-S','MLMC','MLMC-A',...
    'FFT','FGL','COS',...
    'FD','FD-NU','FD-AD',...
    'RBF','RBF-FD','RBF-PUM','RBF-LSML','RBF-AD','RBF-MLT'};

rootpath=pwd;
S=[90,100,110]; K=100; T=1.0; r=0.03; sig=0.15;
U=[2.758443856146076 7.485087593912603 14.702019669720769];

result_1_a = standard_1_a(Methods, rootpath, S, K, T, r, sig, U);
result_1_b = standard_1_b(Methods, rootpath, S, K, T, r, sig, U);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Table2=table(result_1_a(0),tBSamPutUI,tBSupoutCallI,tBSeuCallUII,tBSamPutUII,tBSupoutCallII,'RowNames',Methods)
%err=[rBSeuCallUI,rBSamPutUI,rBSupoutCallI,rBSeuCallUII,rBSamPutUII,rBSupoutCallII];
%err=round(log10(err));

% Now use this table as input in our input struct:
%input.data = Table2;
%input.error = err;

% Set the row format of the data values (in this example we want to use
% integers only):
%input.dataFormat = {'%.1e'};

% Switch transposing/pivoting your table:
%input.transposeTable = 1;

% Column alignment ('l'=left-justified, 'c'=centered,'r'=right-justified):
%input.tableColumnAlignment = 'c';

% Switch table borders on/off:
%input.tableBorders = 0;

% Switch to generate a complete LaTex document or just a table:
%input.makeCompleteLatexDocument = 0;

%latex = latexTable(input);