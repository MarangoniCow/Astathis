


classdef DispersionProblems < handle

    properties
        SOI
        SOIval
        EigenObj
        E
        V

    end

    
    methods (Access = public)
        function this = DispersionProblems(EigenObj, SOI, SOIval)
            
            this.EigenObj   = EigenObj;
            this.SOI        = SOI;
            this.SOIval     = SOIval;

        end
    end
    

    methods
        fig = graphEigenvectors(this);
        fig = graphDispersion(this);
    end

    methods

        
        function FindSolutions(this, para)
                
            n = length(this.SOIval);

            this.E = zeros(n, this.EigenObj.rank);
            this.V = zeros(n, this.EigenObj.rank, this.EigenObj.dimension);

            for i = 1:length(this.SOIval)
                para.(this.SOI) = this.SOIval(i);
                [this.E(i, :), this.V(i, :, :)] = this.EigenObj.findEigenvalues(para);
            end

        end
    end
end