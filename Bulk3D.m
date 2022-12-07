



classdef Bulk3D < EigenvalueProblemClass

    properties (Constant)
        parameterNames  = {'s', 'lambda1', 'lambda2', 'xi', 'eta', 'k', 'q', 'qd'};
        eig             = sym('omega');
        dimension       = 6;
        rank            = 4;
    end

    methods 
        function M = fetchEigenvalueMatrix(this, para)

            this.validateParameterNames(para);


            % LOCAL VARIABLES:
            %   Activity parameters
            s       = para.s;
            lambda1 = para.lambda1;
            lambda2 = para.lambda2;
            xi      = para.xi;
            invEta  = 1./para.eta;

            %   Perturbation parameters 
            k       = para.k;
            q       = para.q;
            qd      = para.qd;

            %   Eigenvalue
            om      = this.eig;

            %   Helper variables
            kx = k*cos(q);
            ky = k*sin(q)*cos(qd);
            kz = k*sin(q)*sin(qd);
        
            kappa1 = 1i*om*xi - k^2;
            kappa2 =  om + 1i*invEta*k^2;
            lp = 0.5*(lambda1 + 1);
            ln = 0.5*(lambda1 - 1);
        
            % Description of the linear system.
            M(1, :) = [kappa1, 0, 0, -1i*kx, 1i*s*ky, 1i*s*kz];
            M(2, :) = [0, kappa1, 0, -1i*ky, 1i*s*kx, 0];
            M(3, :) = [0, 0, kappa1, -1i*kz, 0, 1i*s*kx];
            M(4, :) = [ln*ky + lambda2*kz/2, lp*kx, lambda2*kx/2, 0, kappa2, 0];
            M(5, :) = [ln*kz - lambda2*ky/2, -lambda2*kx/2, lp*kx, 0, 0, kappa2];
            M(6, :) = [kx, ky, kz, 0, 0, 0];
        end




    end


end