%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   EIGENVALUE PROBLEM CLASS    Encapsulates the necessary data and
%   metadata for an eigenvalue problem. Meta data includes information
%   necessary for graphing eigenvalues and is heavily used by the
%   accompanying class `DispersionProblems'.



classdef (Abstract) EigenvalueProblems < handle

    % Main properties: Encapsulating necessary data for an eigenvalue
    % problem.
    properties (Abstract, Constant)
        dataClassName;
        eigvecLatinNames;
        eigvecDisplayNames;
        eig;
        eigDisplayName;
        rank;
    end

    % Dimension is set by the size of the provided matrix and options must
    % be set with a setter method to validate inputs.
    properties (SetAccess = protected, GetAccess = public)
        dimension;
        options;
    end


    % Externally-implemented methods
    methods (Abstract)
        M = fetchEigenvalueMatrix(this, varargin);
    end
  
    methods
        [eigvals, eigvecs] = findEigenvalues(this, para);
        setOptions(this, namedArgs);
    end

   

    methods (Access = protected)
        function this = EigenvalueProblems
            % EigenvalueProblems constructor: Verifies all fields of an
            % EigenvalueProblem subclass.

            % Check for valid data class name
            if exist(this.dataClassName, 'class') ~= 8
                error(['Invalid dataClassName: ', this.dataClassName, ' is not a known class']);
            end
            if length(this.eigvecLatinNames) ~= length(this.eigvecDisplayNames)
                error('Length of latin names and display names inconsistent');
            end

            % Check that eigenvalue is a dimension
            if ~isa(this.eig, 'sym')
                error('Property eig must be a symbolic variable, i.e. eig = sym(''eigname'')')
            end

            % Set dimension length
            this.dimension = length(this.eigvecLatinNames);
            
            % Set options
            this.options = struct('normalise', false, 'normalisationidx', 1);
        end
    end

    methods 
        function validateParameters(this, para)
            % validateParameters(this, para)
            % Throws an error if the dataClassName and a provided DataClass
            % are incompatible. 
            if ~isa(para, this.dataClassName)
                error(['expected input to be of class type ', this.dataClassName, ...
                        ', but instead is of class type', class(para)]);
            end
        end
    end



end