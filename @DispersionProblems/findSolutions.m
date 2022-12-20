function findSolutions(this, para)
            % FINDSOLUTIONS(THIS,PARA)  Main method: Iterates over the
            % DOIval (Sweep Variable Of Interest) 

            % Fetch the sweep length
            n = length(this.DOIval);

            % Initialise eigenvalues and eigenvector arrays
            this.eigenvalues = zeros(n, this.EigenObj.rank);
            this.eigenvectors = zeros(n, this.EigenObj.rank, this.EigenObj.dimension);

            % MAIN METHOD
            %   1) Iterate over range of the DOI
            %   2) Fetch the eigenvalues from EigenObj
            %   3) Sort by largest imaginary part

            for i = 1:length(this.DOIval)
                para.(this.DOI) = this.DOIval(i);
                [vals, vecs] = this.EigenObj.findEigenvalues(para);
                [this.eigenvalues(i, :), idx] = sortComplexVec(vals);
                this.eigenvectors(i, :, :) = vecs(idx, :);
            end
end