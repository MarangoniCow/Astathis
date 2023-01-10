

function f = eigenvectorQuiver(DispersionObj, target)


    % Checks on eigenvalues
    if isempty(DispersionObj.eigenvectors)
        warning('No eigenvectors found. Have you run findSolutions?')
    end

    % Director components:
    %   theta = 5
    %   phi = 6;

    % Velocity componets
    %   u = 1;
    %   v = 2;
    %   w = 3;

    f = figure;

    k = DispersionObj.DOIval;
    idx = closestelement(k, target);
    K = k(idx);

    m = 30;
    x = linspace(0, 2*pi/K, m);
    y = zeros(1, m);
    z = zeros(1, m);

    [X, Y, Z] = meshgrid(x, y, z);
    
    uk = DispersionObj.eigenvectors(idx, 1, 1);
    vk = DispersionObj.eigenvectors(idx, 1, 2);
    wk = DispersionObj.eigenvectors(idx, 1, 3);

    thk = DispersionObj.eigenvectors(idx, 1, 5);
    phk = DispersionObj.eigenvectors(idx, 1, 6);

    


    e = 0.2;

    u = real(uk.*exp(1i*K.*X));
    v = real(vk.*exp(1i*K.*X));
    w = real(wk.*exp(1i*K.*X));
    

    theta   = real(thk.*exp(1i*K.*X));
    phi     = real(phk.*exp(1i*K.*X));

    px = cos(theta).*cos(phi);
    py = sin(theta).*cos(phi);
    pz = sin(phi);

    % Director quiver
    quiver3(Y, Z, X, v, w, u, 'LineWidth', 0.8*PlotDefaults.std.LineWidth, 'AutoScaleFactor', 0.7);
    hold on;
    quiver3(Y, Z, X, py, pz, px, 'LineWidth', 0.8*PlotDefaults.std.LineWidth, 'AutoScaleFactor', 0.7);
    hold off
    
    PlotDefaults.applyEqualAxes;
    PlotDefaults.applyDefaultLabels;
    PlotDefaults.applySizes('big');

    xlabel('$y$')
    ylabel('$z$')
    zlabel('$x$')

    ax = gca;
    ax.XTickLabel = [];
    ax.YTickLabel = [];
    ax.ZTickLabel = [];

    ax.View =   [-47.9521   19.2000];
    





end