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

%Standard Params for 1 b) II
S=[97,98,99]; K=100; T=0.25; r=0.1; sig=0.01;
U=[3.000000000000682 2.000000000010786   1.000000000010715];
result_1_b_II = standard_1_b_II(Methods, rootpath, S, K, T, r, sig, U)