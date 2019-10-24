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

result_1_a = standard_1_a(Methods, rootpath, S, K, T, r, sig, U)