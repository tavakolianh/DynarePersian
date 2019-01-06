
// ENDOGENOUS VARIABLES

var 

   x    $\hat{x}$      (long_name='شکاف تولید')
   pi   $\hat{\pi}$    (long_name='نرخ تورم')
   i    $\hat{i}$      (long_name='نرخ بهره')
   u    $\hat{u}$      (long_name='خودرگرسیون IS')
   nu   $\hat{\nu}$    (long_name='خودرگرسیون پولی');

// EXOGENOUS VARIABLES

varexo 

     e_u    $\hat{\varepsilon^{u}}$      (long_name='تکانه IS')
     e_pi   $\hat{\varepsilon^{\pi}}$    (long_name='تکانه مارک-آپ') 
     e_nu   $\hat{\varepsilon^{\nu}}$    (long_name='تکانه پولی');

// PARAMETERS

parameters 

           beta      $\beta$       (long_name='عامل تنزیل بین‌دوره‌ای مصرف')
           kappa     $\kappa$      (long_name='ضریب شکاف تولید در فیلیپس')
           sigma     $\sigma$      (long_name='عکس کشش جانشینی بین‌دوره‌ای مصرف')
           omega     $\omega$      (long_name='پارامتر چسبندگی قیمت کالوو')
           eta       $\eta$        (long_name='عکس کشش عرضه کار')
           rho_pi    $\rho_{\pi}$  (long_name='ضریب تورم در قاعده تیلور')
           rho_u     $\rho_u$      (long_name='ضریب خودرگرسیون IS')
           rho_nu    $\rho_{\nu}$  (long_name='ضریب خودرگرسیون پولی');

beta  =0.99;
sigma =1.5;
omega =0.6;
eta   =1.5;

/*
The parameter kappa is a function of other
parameters. You don't need to give it a value. 
Instead, we write it in its functional form.
*/

kappa =(sigma+eta)*((1-omega)*(1-beta*omega))/omega;
rho_pi =1.5;
rho_u  =0.8;
rho_nu =0.8;

// MODEL DECLARATION

model(linear);

// IS CURVE

x=x(+1)-(1/sigma)*(i-pi(+1))+u;

// NKPC

pi=beta*pi(+1)+kappa*x+e_pi;

// MONETARY POLICY RULE

i=rho_pi*pi+nu;

// SHOCKS

u=rho_u*u(-1)+e_u;

nu=rho_nu*nu(-1)+e_nu;

end;

// INITIAL VALUE OF ENDOGENOUS VARIABLES

initval;

x  =0;
pi =0;
i  =0;
u  =0;
nu =0;

end;

// LaTeX OUTPUTS

write_latex_dynamic_model;

write_latex_parameter_table_persian;

write_latex_definitions_persian;

collect_latex_files_persian;



steady;

check;

// THE SHOCKS BLOCK

shocks;

var e_u;

stderr 0.01;

var e_pi;

stderr 0.01;

var e_nu;

stderr 0.01;

end;




// THE SIMULATION BLOCK

stoch_simul(periods=10000, drop=3000, irf=12, tex, graph_format=(pdf,eps));


if ispc;

   system(['xelatex -synctex=1 -interaction=nonstopmode New_keynesian_TeX_binder.tex']);
   system('xelatex X');

else;

    system( [ '/Library/TeX/Distributions/Programs/texbin/xelatex New_keynesian_TeX_binder.tex'] );
end;
open New_keynesian_TeX_binder.pdf;



