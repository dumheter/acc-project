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

%Standard Params for 1 a) II
S=[97,98,99]; sig=0.01; r=0.1; T=0.25; K=100;
U=[0.033913177006141   0.512978189232598   1.469203342553328];

result_1_a_II = standard_1_a_II(Methods, rootpath, S, K, T, r, sig, U)
