%% SSVEP paradigm evaluation
% 03-21-2018
% Okba Bekhelifi, <okba.bekhelif@univ-usto.dz>
tic


% set = 'SSVEP_EXOSKELETON';
set = 'SSVEP_DEMO';
%% vanilla CCA
% approach.classifier.learner = 'CCA';
% approach.classifier.options.harmonics = 2;
%% L1 Multiway CCA
approach.classifier.learner = 'L1MCCA';
approach.classifier.options.harmonics = 2;
approach.classifier.options.max_iter = 200; % the maximal number of iteration for running L1MCCA
approach.classifier.options.n_comp = 1;  % number of projection components for learning the reference signals
approach.classifier.options.lamba = 0.02; % regularization parameter for the 3rd-way (i.e., trial-way), which can be more precisely decided by cross-validation
%%
approach.cv.method = 'KFOLD';
approach.cv.nfolds = 0;
%%
[results, output, model] = run_analysis_SSVEP(set, approach);
toc