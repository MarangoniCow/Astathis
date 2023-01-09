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
            
            plot(this.DOIval, real(this.eigenvectors(:, m, i)), 'LineStyle', '--', ...
                'Color', PlotDefaults.fetchColourByIdx(i, 9), 'LineWidth', PlotDefaults.std.LineWidth, ...
                'DisplayName', ['Re(', this.EigenObj.eigvecDisplayNames{i}, ')']);
            hold on
        end
        for i = 1:n
            plot(this.DOIval, imag(this.eigenvectors(:, m, i)), 'LineStyle', '-', ...
                'Color', PlotDefaults.fetchColourByIdx(i, 9), 'LineWidth', PlotDefaults.std.LineWidth, ...
                'DisplayName', ['Im(', this.EigenObj.eigvecDisplayNames{i}, ')']);
        end
        hold off
        
        PlotDefaults.setLatexDefault; 
        legend('NumColumns', 2);
        xlabel(['$', this.DOI, '$'], 'interpreter', 'latex');
        PlotDefaults.applySizes('std');

    end
end