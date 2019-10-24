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

%Standard Params for 1 c) II
S=[97,98,99]; sig=0.01; r=0.1; T=0.25; K=100; B=1.25*K;
U=[0.033913177006134   0.512978189232598   1.469203342553328];

result_1_c_II = standard_1_c_II(Methods, roothpath, S, K, T, r, sig, B, U)