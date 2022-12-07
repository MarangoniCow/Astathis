%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   ACTIVE MATTER PARAMETER CLASS
%
%   Value class containing a default set of values for an active matter
%   suspension.

classdef ActiveParameters < DataClass

    properties
        s;                  % Activity sign
        lambda1;            % Shear-alignment term
        lambda2;            % Chirality term
        xi;                 % Propagation rate
        eta;                % Activity-elasticity term
        A;                  % Dimensionless shear
        k;                  % Perturbation wavenumber
        q;                  % Perturbation angle q
        qd;                 % Perturbation angle q'
    end
    
    methods
        function obj = ActiveParameters(namedArgs)
            % ActiveParameters Constructor
            
            % Set defaults
            arguments
                namedArgs.s         = -1;
                namedArgs.lambda1   = 0.7;
                namedArgs.lambda2   = 0.1;
                namedArgs.xi        = 1.1;
                namedArgs.eta       = 0.8;
                namedArgs.k         = 1;
                namedArgs.q         = 0;
                namedArgs.qd        = 0
            end

            % Assign non-defaults
            obj.s           = namedArgs.s;
            obj.lambda1     = namedArgs.lambda1;
            obj.lambda2     = namedArgs.lambda2;
            obj.xi          = namedArgs.xi;
            obj.eta         = namedArgs.eta;

            obj.k   = namedArgs.k;
            obj.q   = namedArgs.q;
            obj.qd  = namedArgs.qd;
        end
    end
end