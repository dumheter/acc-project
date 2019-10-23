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

%Standard Params for 1 a) I
S=[90,100,110]; K=100; T=1.0; r=0.03; sig=0.15;
U=[2.758443856146076 7.485087593912603 14.702019669720769];

result_1_a = standard_1_a(Methods, rootpath, S, K, T, r, sig, U);

%Standard Params for 1 b) I
S=[90,100,110]; K=100; T=1.0; r=0.03; sig=0.15;
U=[10.726486710094511 4.820608184813253 1.828207584020458];

result_1_b = standard_1_b(Methods, rootpath, S, K, T, r, sig, U);

%Standard Params for 1 c) I
S=[90,100,110]; K=100; T=1.0; r=0.03; sig=0.15; B=1.25*K;
U=[1.822512255945242 3.294086516281595 3.221591131246868];

result_1_c = standard_1_c(Methods, rootpath, S, K, T, r, sig, B, U);

%Standard Params for 1 a) II
S=[97,98,99]; sig=0.01; r=0.1; T=0.25; K=100;
U=[0.033913177006141   0.512978189232598   1.469203342553328];

result_1_a_II = standard_1_a_II(Methods, rootpath, S, K, T, r, sig, U);

%Standard Params for 1 b) II
S=[97,98,99]; K=100; T=0.25; r=0.1; sig=0.01;
U=[3.000000000000682 2.000000000010786   1.000000000010715];
result_1_b_II = standard_1_b_II(Methods, rootpath, S, K, T, r, sig, U);

%Standard Params for 1 c) II
S=[97,98,99]; sig=0.01; r=0.1; T=0.25; K=100; B=1.25*K;
U=[0.033913177006134   0.512978189232598   1.469203342553328];
result_1_c_II = standard_1_c_II(Methods, roothpath, S, K, T, r, sig, B, U);

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