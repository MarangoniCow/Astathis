function fig = graphDispersion(this)
% graphDispersion(this)     Graph dispersion relation data.


    % Checks on eigenvalues
    if isempty(this.eigenvalues)
        warning('No eigenvalues found. Have you run findSolutions?')
    end
    
    eigDisplayName = this.EigenObj.eigDisplayName(2:end-1);

    % TO DO: Add options to plot only one eigenvalue
    % TO DO: Add options to set the eigenvalue to a default colour.
    fig = figure;
    for i = 1:this.EigenObj.rank
        
        plot(this.DOIval, real(this.eigenvalues(:, i)), 'LineStyle', '--', ...
                'Color', PlotDefaults.fetchColourByIdx(i), 'LineWidth', PlotDefaults.std.LineWidth, ...
                'DisplayName', ['$\mathrm{Re}(', eigDisplayName, '_', num2str(i), ')$']);
        hold on

    end

    for i = 1:this.EigenObj.rank
        
        plot(this.DOIval, imag(this.eigenvalues(:, i)), 'LineStyle', '-', ...
                'Color', PlotDefaults.fetchColourByIdx(i), 'LineWidth', PlotDefaults.std.LineWidth, ...
                'DisplayName', ['$\mathrm{Im}(', eigDisplayName, '_', num2str(i), ')$']);


    end
    hold off

    PlotDefaults.setLatexDefault;
    legend('NumColumns', 2)
    xlabel(['$', this.DOI, '$'], 'Interpreter', 'latex')
    PlotDefaults.applySizes('std');
    
end