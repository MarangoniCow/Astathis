%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   DISPERSIONPROBLEMS      The class DispersionProblems acts on an
%   EigenvalueProblems object to produce 
%


classdef DispersionProblems < handle

    % TO DO: Value checking

    properties
        DOI;                    % Dispersion variable of interest (typically k)
        DOIval;                 % DIspersion variable's value of interest  (Should be a range)
        EigenObj;               % Eigen problem to solve
        eigenvalues;            % Resultant eigenvalues
        eigenvectors;           % Resultant eigenvectors
    end


    % TO DO: Set default options
    properties (SetAccess = protected, GetAccess = public)
        options
    end

    
    methods (Access = public)
        function this = DispersionProblems(EigenObj, SOI, SOIval)
            % DispersionProblems(EigenObj, SOI, SOIval) construcor: Sets
            % the EigenvalueProblems object, the sweep variable of interest
            % and the sweep variable's value of interest

            % TO FIX: No value checking.
            
            this.EigenObj   = EigenObj;
            this.DOI        = SOI;
            this.DOIval     = SOIval;

        end
    end

    % Externally-defined methods
    methods
        fig = graphEigenvectors(this);
        fig = graphDispersion(this);
        findSolutions(this, para);

        % TO DO: Set default options
        setOptions(varargin);        
    end
end