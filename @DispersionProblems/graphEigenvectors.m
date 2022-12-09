function fig = graphEigenvectors(this)
% graphEigenvectors(this)   Graph eigenvector data.


     % Checks on eigenvalues
    if isempty(this.eigenvectors)
        warning('No eigenvectors found. Have you run findSolutions?')
    end


    n = this.EigenObj.dimension;
    for m = 1:this.EigenObj.rank

        fig = figure;
        PlotDefaults.setLatexDefault;
    
        for i = 1:n
            
            plot(this.SOIval, real(this.eigenvectors(:, m, i)), 'LineStyle', '--', ...
                'Color', PlotDefaults.fetchColourByIdx(i), 'LineWidth', PlotDefaults.std.LineWidth, ...
                'DisplayName', this.EigenObj.eigvecDisplayNames{i});
            hold on
            plot(this.SOIval, imag(this.eigenvectors(:, m, i)), 'LineStyle', '-', ...
                'Color', PlotDefaults.fetchColourByIdx(i), 'LineWidth', PlotDefaults.std.LineWidth, ...
                'DisplayName', this.EigenObj.eigvecDisplayNames{i});
        end
        hold off
        
        legend;
        xlabel(['$', this.SOI, '$'], 'interpreter', 'latex');
        PlotDefaults.applySizes('std');

    end
end