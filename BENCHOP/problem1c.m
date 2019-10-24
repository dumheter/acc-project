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

%Standard Params for 1 c) I
S=[90,100,110]; K=100; T=1.0; r=0.03; sig=0.15; B=1.25*K;
U=[1.822512255945242 3.294086516281595 3.221591131246868];

result_1_c = standard_1_c(Methods, rootpath, S, K, T, r, sig, B, U)