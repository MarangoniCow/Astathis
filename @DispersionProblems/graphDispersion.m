function fig = graphDispersion(this)
% graphDispersion(this)     Graph dispersion relation data.


    % Checks on eigenvalues
    if isempty(this.eigenvalues)
        warning('No eigenvalues found. Have you run findSolutions?')
    end


    % TO DO: Add options to plot only one eigenvalue
    % TO DO: Add options to set the eigenvalue to a default colour.
    fig = figure;
    for i = 1:this.EigenObj.rank
        
        plot(this.DOIval, real(this.eigenvalues(:, i)), 'LineStyle', '--', ...
                'Color', PlotDefaults.fetchColourByIdx(i), 'LineWidth', PlotDefaults.std.LineWidth, ...
                'DisplayName', ['Re(', this.EigenObj.eigDisplayName, ')']);
        hold on
        plot(this.DOIval, imag(this.eigenvalues(:, i)), 'LineStyle', '-', ...
                'Color', PlotDefaults.fetchColourByIdx(i), 'LineWidth', PlotDefaults.std.LineWidth, ...
                'DisplayName', ['Im(', this.EigenObj.eigDisplayName, ')']);


    end
    hold off

    PlotDefaults.setLatexDefault;
    legend;
    xlabel(['$', this.DOI, '$'], 'Interpreter', 'latex')
    PlotDefaults.applySizes('std');
    
end