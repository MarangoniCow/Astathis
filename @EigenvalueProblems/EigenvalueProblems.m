%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   EIGENVALUE PROBLEM CLASS    Encapsulates methods acting on an
%   eigenvalue problem.
%



classdef (Abstract) EigenvalueProblems < handle

    properties (Abstract, Constant)
        dataClassName;
        eigvecLatinNames;
        eigvecDisplayNames;
        eig;
        rank;
    end

    properties
        dimension;
    end


    methods 
        function validateParameters(this, para)
            if ~isa(para, this.dataClassName)
                error(['expected input to be of class type ', this.dataClassName, ...
                        ', but instead is of class type', class(para)]);
            end
        end
    end


    methods (Abstract)
        M = fetchEigenvalueMatrix(this, varargin);
    end

    methods
        [eigvals, eigvecs] = findEigenvalues(this, para);
    end

    methods (Access = protected)
        function this = EigenvalueProblems

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
        end
    end


end