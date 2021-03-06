
default_tolerance = 10^(-8); %** Default tolerance CG method

cas_test=cell(0);

%** parameter data cesare webpage
% cas_test{(end+1)} = struct('nom', 'Greedy test: cheap surrogate',...
% 		     'nbeq', 1,...
% 		     'nbc', 1,...
%              'coeff_diffusion', @(nu,n) 1+0*nu.*(1-n).^2.*n.^2,...
% 		     'mat_B', @(n) intervalle(n,1/7,4/5),...
%              'y_d', @(n) intervalle(n,1.7/3,3.5/4),...
%              'beta', 1e4,...
%              'eps', 5e-3,...     %% greedy control error
%              'nu_min', 1,...,    %% nu \in [nu_min,nu_max]
%              'nu_max', 10,...
%              'k', 100,...       %% number of discretization points of [nu_min,nu_max]
%              'surrogate', 'cheap',...  %% cheap or regular
%              'maillage','uniforme',...
%              'methode', 'diff_finite',...
%              'atracer', false...
% );

% %%% evolution problem data
% cas_test{(end+1)} = struct('nom', 'Controllability fractional heat eq.',...
% 		     'nbeq', 1,...
% 		     'nbc', 1,...
%              'T', 1,...,
%              'param_s', 0.5,...
% 		       'mat_B', @(x) intervalle(x,0.3,0.8),...
%              'y0', @(x) sin(pi.*x),...
%              'maillage','uniforme',...
%              'discr_spatiale', 'elem_finite',...
%              'phi', 'h^4',... %penalization parameter
%              'methode', 'euler',...
%              'atracer', false...
% );

cas_test{(end+1)} = struct('nom', 'Greedy test: regular surrogate',...
		     'nbeq', 1,...
		     'nbc', 1,...
             'dim', '1d',...
             'coeff_diffusion', @(nu,n) 1+nu.*(1-n).^2.*n.^2,...
		     'mat_B', @(n) intervalle(n,0.3,0.9),...
             'y_d', @(n) 0.00005*sin(2*pi.*n),...
             'beta', 1e4,...
             'eps', 5e-3,...     %% greedy control error
             'nu_min', 1,...    %% nu \in [nu_min,nu_max]
             'nu_max', 10,...
             'k', 100,...       %% number of discretization points of [nu_min,nu_max]
             'surrogate', 'regular',...  %% cheap or regular
             'maillage','uniforme',...
             'methode', 'diff_finite',...
             'atracer', false...
);

cas_test{(end+1)} = struct('nom', 'Greedy test: cheap surrogate (epsilon)',...
		     'nbeq', 1,...
		     'nbc', 1,...
             'dim', '1d',...
             'coeff_diffusion', @(nu,n) 1+nu.*(1-n).^2.*n.^2,...
		     'mat_B', @(n) intervalle(n,0.3,0.9),...
             'y_d', @(n) 0.000005*sin(2*pi.*n),...
             'beta', 1e4,...
             'eps', 5e-3,...     %% greedy control error
             'nu_min', 1,...    %% nu \in [nu_min,nu_max]
             'nu_max', 10,...
             'k', 100,...       %% number of discretization points of [nu_min,nu_max]
             'surrogate', 'vectorial',...  %% cheap or regular
             'maillage','uniforme',...
             'methode', 'diff_finite',...
             'atracer', false...
);

cas_test{(end+1)} = struct('nom', 'Greedy test 2-D: regular surrogate ',...
		     'nbeq', 1,...
		     'nbc', 1,...
             'dim', '2d',...
             'coeff_diffusion', @(nu,x,y) 1+nu*(x.^2+y.^2),...
		     'mat_B', @(x,y) indicator_2D(x,y,0.4,0.9,0.4,0.9),...
             'y_d', @(x,y) sin(2*pi*x).*intervalle(y,0.0,1.0),...
             'potential', @(x,y) sin(pi*x).*sin(pi*y),...
             'beta', 1e4,...
             'eps', 5e-3,...     %% greedy control error
             'nu_min', 1,...    %% nu \in [nu_min,nu_max]
             'nu_max', 10,...
             'k', 100,...       %% number of discretization points of [nu_min,nu_max]
             'surrogate', 'regular',...  %% cheap or regular
             'maillage','uniforme',...
             'methode', 'diff_finite',...
             'atracer', false...
);

cas_test{(end+1)} = struct('nom', 'Greedy test 2-D: cheap surrogate ',...
		     'nbeq', 1,...
		     'nbc', 1,...
             'dim', '2d',...
             'coeff_diffusion', @(nu,x,y) 1+nu*(x.^2+y.^2),...
		     'mat_B', @(x,y) indicator_2D(x,y,0.4,0.9,0.4,0.9),...
             'y_d', @(x,y) sin(2*pi*x).*intervalle(y,0.0,1.0),...
             'potential', @(x,y) sin(pi*x).*sin(pi*y),...
             'beta', 1e4,...
             'eps', 5e-3,...     %% greedy control error
             'nu_min', 1,...    %% nu \in [nu_min,nu_max]
             'nu_max', 10,...
             'k', 100,...       %% number of discretization points of [nu_min,nu_max]
             'surrogate', 'vectorial',...  %% cheap or regular
             'maillage','uniforme',...
             'methode', 'diff_finite',...
             'atracer', false...
);

%%% O.C. elliptic + controllability for evolution
%** parameter data cesare webpage
cas_test{(end+1)} = struct('nom', 'O.C. elliptic + controllability evolution',...
		     'nbeq', 1,...
		     'nbc', 1,...
             'dim', '1d',...
             'T', 5.0, .... %just for the evolution part
             'y0', @(x) 0*intervalle(x,0,1),...
             'coeff_diffusion', @(nu,n) 1+0*nu.*(1-n).^2.*n.^2,...
		     'mat_B', @(n) intervalle(n,1/7,4/5),...
             'y_d', @(n) intervalle(n,1.7/3,3.5/4),...
             'beta', 1e4,...
             'maillage','uniforme',...
             'methode', 'diff_finite',...
             'atracer', false...
);

%%% O.C. elliptic with potential 1-D
%** parameter data cesare webpage
cas_test{(end+1)} = struct('nom', 'elliptic with potential 1-D',...
		     'nbeq', 1,...
		     'nbc', 1,...
             'dim', '1d',...
             'T', 5.0, .... %just for the evolution part
             'y0', @(x) 1*intervalle(x,0,1),...
             'coeff_diffusion', @(nu,n) 1+0*nu.*(1-n).^2.*n.^2,...
             'potential', @(x) -0*intervalle(x,0.0,1.0),...
		     'mat_B', @(n) intervalle(n,0,1),...
             'y_d', @(n) 2+sin(3*pi.*n),...
             'beta', 1e2,...
             'maillage','uniforme',...
             'methode', 'diff_finite',...
             'atracer', false...
);

%%% O.C. elliptic with potential 2-D
%** parameter data cesare webpage
cas_test{(end+1)} = struct('nom', 'elliptic with potential 2-D',...
		     'nbeq', 1,...
		     'nbc', 1,...
             'dim', '2d',...
             'T', 5.0, .... %just for the evolution part
             'y0', @(x,y) sin(pi*x).*sin(pi*y),...
             'coeff_diffusion', @(nu,x,y) 1+0*nu*(x.^2+y.^2),...
             'potential', @(x,y) sin(pi*x).*sin(pi*y),...
             'mat_B', @(x,y) indicator_2D(x,y,0.0,1.0,0.0,1.0),...
             'y_d', @(x,y) 0.00001*indicator_2D(x,y,0.0,1.0,0.0,1.0),...
             'beta', 1,...
             'maillage','uniforme',...
             'methode', 'diff_finite',...
             'atracer', false...
);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Experiments with unstable potential
%%%%%% Full set of experiments with unstable potential
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cas_test{(end+1)} = struct('nom', 'Greedy test 2-D unstable: regular surrogate ',...
		     'nbeq', 1,...
		     'nbc', 1,...
             'dim', '2d',...
             'coeff_diffusion', @(nu,x,y) 1+nu*(x.^2+y.^2),...
		     'mat_B', @(x,y) indicator_2D(x,y,0.2,0.4,0.2,0.5)+indicator_2D(x,y,0.4,0.7,0.2,0.8),...
             'y_d', @(x,y) sin(pi*x).*intervalle(y,0.0,1.0),...
             'potential', @(x,y) -37*indicator_2D(x,y,0.0,1.0,0.0,1.0),...
             'beta', 1e4,...
             'eps', 5e-3,...     %% greedy control error
             'nu_min', 1,...    %% nu \in [nu_min,nu_max]
             'nu_max', 10,...
             'k', 100,...       %% number of discretization points of [nu_min,nu_max]
             'surrogate', 'regular',...  %% cheap or regular
             'maillage','uniforme',...
             'methode', 'diff_finite',...
             'atracer', false...
);

cas_test{(end+1)} = struct('nom', 'Greedy test 2-D unstable: cheap surrogate ',...
		     'nbeq', 1,...
		     'nbc', 1,...
             'dim', '2d',...
             'coeff_diffusion', @(nu,x,y) 1+nu*(x.^2+y.^2),...
		     'mat_B', @(x,y) indicator_2D(x,y,0.2,0.4,0.2,0.5)+indicator_2D(x,y,0.4,0.7,0.2,0.8),...
             'y_d', @(x,y) sin(pi*x).*intervalle(y,0.0,1.0),...
             'potential', @(x,y) -37*indicator_2D(x,y,0.0,1.0,0.0,1.0),...
             'beta', 1e4,...
             'eps', 5e-3,...     %% greedy control error
             'nu_min', 1,...    %% nu \in [nu_min,nu_max]
             'nu_max', 10,...
             'k', 100,...       %% number of discretization points of [nu_min,nu_max]
             'surrogate', 'vectorial',...  %% cheap or regular
             'maillage','uniforme',...
             'methode', 'diff_finite',...
             'atracer', false...
);

%%% O.C. elliptic with potential 2-D
cas_test{(end+1)} = struct('nom', 'elliptic+evolution with unstable potential 2-D',...
		     'nbeq', 1,...
		     'nbc', 1,...
             'dim', '2d',...
             'T', 5.0, .... %just for the evolution part
             'y0', @(x,y) 0*x.*y,...
             'coeff_diffusion', @(nu,x,y) 1+nu*(x.^2+y.^2),...
             'potential', @(x,y) -37*indicator_2D(x,y,0.0,1.0,0.0,1.0),...
             'mat_B', @(x,y) indicator_2D(x,y,0.2,0.4,0.2,0.5)+indicator_2D(x,y,0.4,0.7,0.2,0.8),...
             'y_d', @(x,y) sin(pi*x).*intervalle(y,0.0,1.0),...
             'beta', 1e4,...
             'maillage','uniforme',...
             'methode', 'diff_finite',...
             'atracer', false...
);

cas_test{(end+1)} = struct('nom', 'Greedy test 2-D stable: regular surrogate ',...
		     'nbeq', 1,...
		     'nbc', 1,...
             'dim', '2d',...
             'coeff_diffusion', @(nu,x,y) 1+nu*(x.^2+y.^2),...
		     'mat_B', @(x,y) indicator_2D(x,y,0.2,0.4,0.2,0.5)+indicator_2D(x,y,0.4,0.7,0.2,0.8),...
             'y_d', @(x,y) sin(pi*x).*intervalle(y,0.0,1.0),...
             'potential', @(x,y) sin(2*pi*x).*sin(2*pi*y),...
             'y0', @(x,y) sin(3*pi*x).*sin(2*pi*y),...
             'phi', 'h^4',...
             'T', 5.0, .... %just for the evolution part
             'beta', 1e4,...
             'eps', 5e-3,...     %% greedy control error
             'nu_min', 1,...    %% nu \in [nu_min,nu_max]
             'nu_max', 10,...
             'k', 100,...       %% number of discretization points of [nu_min,nu_max]
             'surrogate', 'vectorial',...  %% cheap or regular
             'maillage','uniforme',...
             'methode', 'diff_finite',...
             'atracer', false...
);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Controllability to trajectories
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cas_test{(end+1)} = struct('nom', 'Greedy test 2-D stable: controllability ',...
		     'nbeq', 1,...
		     'nbc', 1,...
             'dim', '2d',...
             'coeff_diffusion', @(nu,x,y) 1+nu*(x.^2+y.^2),...
		     'mat_B', @(x,y) indicator_2D(x,y,0.2,0.4,0.2,0.5)+indicator_2D(x,y,0.4,0.7,0.2,0.8),...
             'y_d', @(x,y) sin(pi*x).*intervalle(y,0.0,1.0),...
             'potential', @(x,y) sin(2*pi*x).*sin(2*pi*y),...
             'y0', @(x,y) -1*indicator_2D(x,y,0.4,0.9,0.4,0.9),...
             'phi', '1000*h^4',...
             'T', 0.05, .... %just for the evolution part
             'beta', 1e4,...
             'eps', 5e-3,...     %% greedy control error
             'nu_min', 1,...    %% nu \in [nu_min,nu_max]
             'nu_max', 10,...
             'k', 100,...       %% number of discretization points of [nu_min,nu_max]
             'surrogate', 'regular',...  %% cheap or regular
             'maillage','uniforme',...
             'methode', 'diff_finite',...
             'atracer', false...
);

cas_test{(end+1)} = struct('nom', 'Greedy test 1-D stable: controllability to trajectories ',...
		     'nbeq', 1,...
		     'nbc', 1,...
             'dim', '1d',...
             'coeff_diffusion', @(nu,n) 1+0*nu.*(1-n).^2.*n.^2,...
		     'mat_B', @(n) intervalle(n,0.3,0.9),...
             'y_d', @(x) intervalle(x,0.2,0.6),...
             'potential', @(x) -12*intervalle(x,0,1),...
             'y0', @(x,y) 0*intervalle(x,0.4,0.9),...
             'phi', 'h^4',...
             'T', 3, .... %just for the evolution part
             'beta', 1e4,...
             'eps', 5e-3,...     %% greedy control error
             'nu_min', 1,...    %% nu \in [nu_min,nu_max]
             'nu_max', 10,...
             'k', 100,...       %% number of discretization points of [nu_min,nu_max]
             'surrogate', 'vectorial',...  %% cheap or regular
             'maillage','uniforme',...
             'methode', 'diff_finite',...
             'atracer', false...
);

cas_test{(end+1)} = struct('nom', 'Greedy test 1-D unstable: testing for finding a good control',...
		     'nbeq', 1,...
		     'nbc', 1,...
             'dim', '1d',...
             'coeff_diffusion', @(nu,n) 1+0*nu.*(1-n).^2.*n.^2,...
		     'mat_B', @(n) intervalle(n,0.3,0.9),...
             'y_d', @(x) intervalle(x,0.2,0.6),...
             'potential', @(x) -12*intervalle(x,0,1),...
             'y0', @(x,y) 0*intervalle(x,0.4,0.9),...
             'phi', 'h^4',...
             'XXT', 0.01, .... %just for the evolution part
             'beta', 1e4,...
             'eps', 5e-3,...     %% greedy control error
             'nu_min', 1,...    %% nu \in [nu_min,nu_max]
             'nu_max', 10,...
             'k', 100,...       %% number of discretization points of [nu_min,nu_max]
             'surrogate', 'vectorial',...  %% cheap or regular
             'maillage','uniforme',...
             'methode', 'diff_finite',...
             'atracer', false...
);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Test 2D or 3D manifold
%%%%%%  working 10th sept
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cas_test{(end+1)} = struct('nom', 'Greedy test 2-D: M-manifold ',...
		     'nbeq', 1,...
		     'nbc', 1,...
             'dim', '2d',...
             'coeff_diffusion', @(nu,x,y) 1+nu*(x.^2+y.^2),...
		     'mat_B', @(x,y) indicator_2D(x,y,0.4,0.9,0.4,0.9),...
             'y_d', @(x,y) sin(2*pi*x).*intervalle(y,0.0,1.0),...
             'potential', @(x,y) sin(pi*x).*sin(pi*y),...
             'beta', 1e4,...
             'eps', 5e-3,...     %% greedy control error
             'nu_min', 1,...    %% nu \in [nu_min,nu_max]
             'nu_max', 10,...
             'k', 30,...       %% number of discretization points of [nu_min,nu_max]
             'M_manifold', 2,... %% number of parameters
             'surrogate', 'vectorial',...  %% cheap or regular
             'maillage','uniforme',...
             'methode', 'diff_finite',...
             'atracer', false...
);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Test for paper
%%%%%% Greedy test#1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cas_test{(end+1)} = struct('nom', 'Greedy test #1: paper ',...
		     'nbeq', 1,...
		     'nbc', 1,...
             'dim', '2d',...
             'coeff_diffusion', @(nu,x,y) 1+nu*(x.^2+y.^2),...
		     'mat_B', @(x,y) 0*indicator_2D(x,y,0.2,0.4,0.1,0.4)...
                             +indicator_2D(x,y,0.5,0.9,0.1,0.9)...
                             +indicator_2D(x,y,0.2,0.5,0.5,0.9),...
             'y_d', @(x,y) sin(2*pi*x).*intervalle(y,0.0,1.0),...
             'potential', @(x,y) sin(pi*x).*sin(pi*y),...
             'beta', 1e4,...
             'eps', 5e-3,...     %% greedy control error
             'y0', @(x,y) -0*indicator_2D(x,y,0.4,0.9,0.4,0.9),...
             'T', 3, .... %just for the evolution part
             'nu_min', 1,...    %% nu \in [nu_min,nu_max]
             'nu_max', 10,...
             'k', 100,...       %% number of discretization points of [nu_min,nu_max]
             'surrogate', 'vectorial',...  %% cheap or regular
             'maillage','uniforme',...
             'methode', 'diff_finite',...
             'atracer', false...
);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Test for paper
%%%%%% Greedy test#2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cas_test{(end+1)} = struct('nom', 'Greedy test #2: paper ',...
		     'nbeq', 1,...
		     'nbc', 1,...
             'dim', '2d',...
             'coeff_diffusion', @(nu,x,y) 1+nu*(x.^2+y.^2),...
		     'mat_B', @(x,y) indicator_2D(x,y,0.2,0.7,0.2,0.3)...
                             +indicator_2D(x,y,0.2,0.7,0.7,0.8)...
                             +indicator_2D(x,y,0.2,0.3,0.3,0.7)...
                             +indicator_2D(x,y,0.6,0.7,0.3,0.7),...
             'y_d', @(x,y) sin(pi*x).*intervalle(y,0.0,1.0),...
             'potential', @(x,y) -37*indicator_2D(x,y,0.0,1.0,0.0,1.0),...
             'beta', 1e4,...
             'eps', 5e-3,...     %% greedy control error
             'y0', @(x,y) -0*indicator_2D(x,y,0.4,0.9,0.4,0.9),...
             'T', 3, .... %just for the evolution part
             'nu_min', 1,...    %% nu \in [nu_min,nu_max]
             'nu_max', 10,...
             'k', 100,...       %% number of discretization points of [nu_min,nu_max]
             'surrogate', 'vectorial',...  %% cheap or regular
             'maillage','uniforme',...
             'methode', 'diff_finite',...
             'atracer', false...
);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Rank experiment
%%%%%% To be tested with turnpile_finite_dimensional.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cas_test{(end+1)} = struct('nom', 'Finite dim turnpike',...
		     'nbeq', 1,...
		     'nbc', 1,...
             'dim', '1d',...
             'T', 1.0, .... %just for the evolution part
             'y0', @(x) 0*sin(pi.*x),...
             'coeff_diffusion', @(nu,n) 1+0*nu.*(1-n).^2.*n.^2,...
             'XXpotential', @(x) 10*intervalle(x,0.0,1.0),...
		     'mat_B', @(n) intervalle(n,0,1),...
             'nu', 5,...
             'y_d', @(n) intervalle(n,0,1),...
             'beta', 1e4,...
             'maillage','uniforme',...
             'methode', 'diff_finite',...
             'atracer', false...
);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Test for paper
%%%%%% New hypothesis experiment
%%%%%% Added to the submitted version of the paper
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cas_test{(end+1)} = struct('nom', 'Greedy test new hypothesis paper',...
		     'nbeq', 1,...
		     'nbc', 1,...
             'dim', '2d',...
             'coeff_diffusion', @(nu,x,y) 1+0*nu*(x.^2+y.^2),...
             'mat_B', @(x,y) indicator_2D(x,y,0.2,0.7,0.2,0.3)...
                 +indicator_2D(x,y,0.2,0.7,0.7,0.8)...
                 +indicator_2D(x,y,0.2,0.3,0.3,0.7)...
                 +indicator_2D(x,y,0.6,0.7,0.3,0.7),...
             'y_d', @(x,y) sin(pi*x).*intervalle(y,0.0,1.0),...
             'var_pot', 'oui',...
             'potential', @(nu,x,y) -nu*indicator_2D(x,y,0.0,1.0,0.0,1.0),...
             'beta', 1e4,...
             'eps', 5e-3,...     %% greedy control error
             'y0', @(x,y) -0*indicator_2D(x,y,0.4,0.9,0.4,0.9),...
             'T', 3, .... %just for the evolution part
             'nu_min', 20,...    %% nu \in [nu_min,nu_max]
             'nu_max', 45,...
             'k', 100,...       %% number of discretization points of [nu_min,nu_max]
             'surrogate', 'vectorial',...  %% cheap or regular
             'maillage','uniforme',...
             'methode', 'diff_finite',...
             'atracer', false...
);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Nonlinear test
%%%%%% Data for nonlinear test
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cas_test{(end+1)} = struct('nom', 'Nonlinear Greedy test: first try ',...
		     'nbeq', 1,...
		     'nbc', 1,...
             'dim', '2d',...
             'coeff_diffusion', @(nu,x,y) 1+nu*(x.^2+y.^2),...
		     'mat_B', @(x,y) indicator_2D(x,y,0.2,0.8,0.2,0.8),...
             'y_d', @(x,y) sin(2*pi*x).*intervalle(y,0.0,1.0),...
             'nonlinearite', @(y1) y1,...
             'nonlinearite_der',@(y1) 2*y1,...
             'relaxation', 0.7,...
             'beta', 1e4,...
             'eps', 5e-3,...     %% greedy control error
             'nu_min', 1,...    %% nu \in [nu_min,nu_max]
             'nu_max', 10,...
             'k', 100,...       %% number of discretization points of [nu_min,nu_max]
             'surrogate', 'vectorial',...  %% cheap or regular
             'maillage','uniforme',...
             'methode', 'nonlineaire',...
             'XXmethode', 'diff_finite',...
             'atracer', false...
);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Test for christmas card
%%%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cas_test{(end+1)} = struct('nom', 'Test Jose',...
		     'nbeq', 1,...
		     'nbc', 1,...
             'dim', '2d',...
             'coeff_diffusion', @(nu,x,y) 1+0*nu*(x.^2+y.^2),...
		     'mat_B', @(x,y) indicator_2D(x,y,0.0,1.0,0.0,1.0),...
             'y_d', @(x,y) sin(2*pi*x).*intervalle(y,0.0,1.0),...
             'XXpotential', @(x,y) sin(pi*x).*sin(pi*y),...
             'beta', 1e3,...
             'XXeps', 5e-3,...     %% greedy control error
             'y0', @(x,y) -0*indicator_2D(x,y,0.4,0.9,0.4,0.9),...
             'phi','h^4',...   
             'T', 2, .... %just for the evolution part
             'nu_min', 1,...    %% nu \in [nu_min,nu_max]
             'nu_max', 10,...
             'k', 100,...       %% number of discretization points of [nu_min,nu_max]
             'surrogate', 'vectorial',...  %% cheap or regular
             'maillage','uniforme',...
             'methode', 'diff_finite',...
             'atracer', false...
);



% indicator_2D(x,y,0.2,0.4,0.1,0.4)+indicator_2D(x,y,0.4,0.9,0.1,0.9)
%'coeff_diffusion', @(nu,n) 1+nu*(1-n.^2).*n.^2,...
%'coeff_diffusion', @(nu,n) nu+exp(-1./(n.*(1-n))),...
%'y_d', @(n) intervalle(n,1.7/3,3.5/4),...

% 'mat_B', @(x,y) indicator_2D(x,y,0.3,0.4,0.3,0.4)...
%                                  +indicator_2d(x,y,0.4,0.8,0.3,0.7),...
%              'potential', @(x,y) indicator_2D(x,y,0.3,0.8,0.0,1.0),...

fh=localfunctions;

function [y]=intervalle(x,a,b)
    y=(x>=a).*(x<=b);
end

% indicator function in 2D
function ind=indicator_2D(X,Y,a,b,c,d)
    
    ind = (X>=a).*(X<=b).*(Y>=c).*(Y<=d);

end
