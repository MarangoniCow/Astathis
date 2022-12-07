%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   EIGENVALUE PROBLEM CLASS    Encapsulates methods acting on an
%   eigenvalue problem.
%



classdef (Abstract) EigenvalueProblemClass < handle

    properties (Abstract, Constant)
        parameterNames;         % Names of the parameters
        eig;
        dimension;
        rank;
    end

    methods 
        function validateParameterNames(this, varargin)

            % Validate arguments
            if nargin == 1
                error('Cannot call method without at least one argument')
            end

            for k = 1:nargin - 1
                if ~isa(varargin{k}, 'DataClass')
                    error('Input is required to be a derived instance of DataClass');
                end
            end
            
            for i = 1:length(this.parameterNames)
                
                
                % BUG: Could have duplicated variables, which could be an
                % issue later on
                bool = true;
                
                for k = 1:nargin - 1
                    bool = bool & ~any(strcmp(this.parameterNames{i}, varargin{k}.names));
                end

                if bool
                    error(['Parameter not present: ', this.parameterNames{i}])
                end
            end
        end
    end


    methods (Abstract)
        M = fetchEigenvalueMatrix(this, varargin);
    end

    methods
        function [eigvals, eigvecs] = findEigenvalues(this, para)
            
            A = this.fetchEigenvalueMatrix(para);
            eigVals = solve(det(A), this.eig);
            numEigVals = double(eigVals);
        
            % Find the eigenvector with the largest imaginary part. Initialise with
            % the first eigenvector.
            j = 1;
            % Need to be careful of the case where the real parts are identical.
            for i = 2:length(eigVals)
                if imag(numEigVals(i)) > imag(numEigVals(j))
                    j = i;
                end
            end
            
            % Assign largest eigenvalue to numEigVals.
            eigvals = numEigVals(j);
        
            
            % Substitute the largest eigenvalue into A
            D = double(subs(A, this.eig, eigVals(j)));
            eigVecs = null(D);
            numEigVecs = double(eigVecs);
            numEigVecs = numEigVecs/abs(numEigVecs(5));
            
            uk = numEigVecs(1);
            vk = numEigVecs(2);
            wk = numEigVecs(3);
            Pk = numEigVecs(4);
            thk = numEigVecs(5);
            phik = numEigVecs(6);





        end

    end


end