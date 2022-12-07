function [eigvals, eigvecs] = findEigenvalues(this, para)
% FINDEIGENVALUES       Finds the eigenvalues and eigenvectors for a
%                       linearised matrix.
%

    % Validate input parameters
    this.validateParameters(para);

    % Fetch the eigenvalue matrix
    M = this.fetchEigenvalueMatrix(para);

    % Use Matlab's `solve' function to fetch the eigenvalues
    symbolic_eigenvals = solve(det(M), this.eig);

    % Cast symbolic eigenvalues into numerical. 
    eigvals = double(symbolic_eigenvals);

    % Initialise eigenvectors
    eigvecs = zeros(this.rank, this.dimension);

    if(this.rank ~= length(eigvals))
        warning(['Unexpected number of eigenvalues, expected ', ...
            this.rank, ', received ', length(eigvals)])
    end



    % Substitute the eigenvalues into M
    for k = 1:this.rank
        D = double(subs(M, this.eig, symbolic_eigenvals(k)));
        eigvecs(k, :) = double(null(D));
    end
end
