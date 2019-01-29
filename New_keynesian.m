%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'New_keynesian';
M_.dynare_version = '4.5.6';
oo_.dynare_version = '4.5.6';
options_.dynare_version = '4.5.6';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('New_keynesian.log');
M_.exo_names = 'e_u';
M_.exo_names_tex = '\hat{\varepsilon^{u}}';
M_.exo_names_long = 'تکانه IS';
M_.exo_names = char(M_.exo_names, 'e_pi');
M_.exo_names_tex = char(M_.exo_names_tex, '\hat{\varepsilon^{\pi}}');
M_.exo_names_long = char(M_.exo_names_long, 'تکانه مارک-آپ');
M_.exo_names = char(M_.exo_names, 'e_nu');
M_.exo_names_tex = char(M_.exo_names_tex, '\hat{\varepsilon^{\nu}}');
M_.exo_names_long = char(M_.exo_names_long, 'تکانه پولی');
M_.endo_names = 'x';
M_.endo_names_tex = '\hat{x}';
M_.endo_names_long = 'شکاف تولید';
M_.endo_names = char(M_.endo_names, 'pi');
M_.endo_names_tex = char(M_.endo_names_tex, '\hat{\pi}');
M_.endo_names_long = char(M_.endo_names_long, 'نرخ تورم');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, '\hat{i}');
M_.endo_names_long = char(M_.endo_names_long, 'نرخ بهره');
M_.endo_names = char(M_.endo_names, 'u');
M_.endo_names_tex = char(M_.endo_names_tex, '\hat{u}');
M_.endo_names_long = char(M_.endo_names_long, 'خودرگرسیون IS');
M_.endo_names = char(M_.endo_names, 'nu');
M_.endo_names_tex = char(M_.endo_names_tex, '\hat{\nu}');
M_.endo_names_long = char(M_.endo_names_long, 'خودرگرسیون پولی');
M_.endo_partitions = struct();
M_.param_names = 'beta';
M_.param_names_tex = '\beta';
M_.param_names_long = 'عامل تنزیل بین‌دوره‌ای مصرف';
M_.param_names = char(M_.param_names, 'kappa');
M_.param_names_tex = char(M_.param_names_tex, '\kappa');
M_.param_names_long = char(M_.param_names_long, 'ضریب شکاف تولید در فیلیپس');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, '\sigma');
M_.param_names_long = char(M_.param_names_long, 'عکس کشش جانشینی بین‌دوره‌ای مصرف');
M_.param_names = char(M_.param_names, 'omega');
M_.param_names_tex = char(M_.param_names_tex, '\omega');
M_.param_names_long = char(M_.param_names_long, 'پارامتر چسبندگی قیمت کالوو');
M_.param_names = char(M_.param_names, 'eta');
M_.param_names_tex = char(M_.param_names_tex, '\eta');
M_.param_names_long = char(M_.param_names_long, 'عکس کشش عرضه کار');
M_.param_names = char(M_.param_names, 'rho_pi');
M_.param_names_tex = char(M_.param_names_tex, '\rho_{\pi}');
M_.param_names_long = char(M_.param_names_long, 'ضریب تورم در قاعده تیلور');
M_.param_names = char(M_.param_names, 'rho_u');
M_.param_names_tex = char(M_.param_names_tex, '\rho_u');
M_.param_names_long = char(M_.param_names_long, 'ضریب خودرگرسیون IS');
M_.param_names = char(M_.param_names, 'rho_nu');
M_.param_names_tex = char(M_.param_names_tex, '\rho_{\nu}');
M_.param_names_long = char(M_.param_names_long, 'ضریب خودرگرسیون پولی');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.endo_nbr = 5;
M_.param_nbr = 8;
M_.orig_endo_nbr = 5;
M_.aux_vars = [];
M_.Sigma_e = zeros(3, 3);
M_.Correlation_matrix = eye(3, 3);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('New_keynesian_static');
erase_compiled_function('New_keynesian_dynamic');
M_.orig_eq_nbr = 5;
M_.eq_nbr = 5;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 3 8;
 0 4 9;
 0 5 0;
 1 6 0;
 2 7 0;]';
M_.nstatic = 1;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 2;
M_.ndynamic   = 4;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:3];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(5, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = NaN(8, 1);
M_.NNZDerivatives = [18; 0; -1];
M_.params( 1 ) = 0.99;
beta = M_.params( 1 );
M_.params( 3 ) = 1.5;
sigma = M_.params( 3 );
M_.params( 4 ) = 0.6;
omega = M_.params( 4 );
M_.params( 5 ) = 1.5;
eta = M_.params( 5 );
M_.params( 2 ) = (M_.params(3)+M_.params(5))*(1-M_.params(4))*(1-M_.params(4)*M_.params(1))/M_.params(4);
kappa = M_.params( 2 );
M_.params( 6 ) = 1.5;
rho_pi = M_.params( 6 );
M_.params( 7 ) = 0.8;
rho_u = M_.params( 7 );
M_.params( 8 ) = 0.8;
rho_nu = M_.params( 8 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 1 ) = 0;
oo_.steady_state( 2 ) = 0;
oo_.steady_state( 3 ) = 0;
oo_.steady_state( 4 ) = 0;
oo_.steady_state( 5 ) = 0;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
write_latex_parameter_table_persian;
write_latex_definitions_persian;
collect_latex_files_persian;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (0.01)^2;
M_.Sigma_e(2, 2) = (0.01)^2;
M_.Sigma_e(3, 3) = (0.01)^2;
options_.TeX = 1;
options_.drop = 3000;
options_.irf = 12;
options_.periods = 10000;
options_.graph_format = char('pdf','eps');
var_list_ = char();
info = stoch_simul(var_list_);
if ispc;
system(['xelatex -synctex=1 -interaction=nonstopmode New_keynesian_TeX_binder.tex']);
system('xelatex X');
else;
system( [ '/Library/TeX/Distributions/Programs/texbin/xelatex New_keynesian_TeX_binder.tex'] );
end;
open New_keynesian_TeX_binder.pdf;
save('New_keynesian_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('New_keynesian_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('New_keynesian_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('New_keynesian_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('New_keynesian_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('New_keynesian_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('New_keynesian_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
