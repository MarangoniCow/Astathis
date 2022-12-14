%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   BULK3D      Eigenvalue problem for unbounded 3D regime
%
%   Corresponding parameter class is `ActiveParameters'.




classdef Sheared3D < EigenvalueProblems

    % Can be set
    properties (Constant) 
        dataClassName       = 'ActiveParameters';
        eigvecLatinNames    = {'uk', 'vk', 'wk', 'Pk', 'thk', 'phk'};
        eigvecDisplayNames  = {'$u_k$', '$v_k$', '$w_k$', '$P_k$', '$\theta_k$', '$\phi_k$'};
        eig                 = sym('omega');
        eigDisplayName      = '$\omega$';
        rank                = 4;
    end

    methods

        function this = Sheared3D
            % Set default options for all Sheared3D objects
            this.setOptions('normalise', true, 'normalisationidx', 3);

        end
        
        function M = fetchEigenvalueMatrix(this, para)

            this.validateParameters(para);


            % LOCAL VARIABLES:
            %   Activity parameters
            s       = para.s;
            lambda1 = para.lambda1;
            lambda2 = para.lambda2;
            xi      = para.xi;
            invEta  = 1./para.eta;
            A       = para.A;

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
            M(4, :) = [ln*ky + lambda2*kz/2, lp*kx, lambda2*kx/2, 0, kappa2 - 1i*A*lambda2/2, -1i*A*ln];
            M(5, :) = [ln*kz - lambda2*ky/2, -lambda2*kx/2, lp*kx, 0, -1i*A*lp, kappa2 + 1i*A*lambda2/2];
            M(6, :) = [kx, ky, kz, 0, 0, 0];
        end




    end


end