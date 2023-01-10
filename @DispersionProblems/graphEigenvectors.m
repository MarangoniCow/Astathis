function fig = graphEigenvectors(this)
% graphEigenvectors(this)   Graph eigenvector data.


     % Checks on eigenvalues
    if isempty(this.eigenvectors)
        warning('No eigenvectors found. Have you run findSolutions?')
    end

    % SHEARED_CHIRAL_MATTER_SPECIFICS
    

    eigDisplayName = this.EigenObj.eigDisplayName(2:end-1);

    for m = 1:this.EigenObj.rank

        fig = figure;
        PlotDefaults.setLatexDefault;
    
        for i = [1, 2, 3, 5, 6]
            
            if i > 3
                j = i - 1;
            else
                j = i;
            end

            plot(this.DOIval, real(this.eigenvectors(:, m, i)), 'LineStyle', '--', ...
                'Color', PlotDefaults.fetchColourByIdx(j, 9), 'LineWidth', PlotDefaults.std.LineWidth, ...
                'DisplayName', ['Re(', this.EigenObj.eigvecDisplayNames{i}, ')']);
            hold on
        end
        for i = [1, 2, 3, 5, 6]

            if i > 3
                j = i - 1;
            else
                j = i;
            end

            plot(this.DOIval, imag(this.eigenvectors(:, m, i)), 'LineStyle', '-', ...
                'Color', PlotDefaults.fetchColourByIdx(j, 9), 'LineWidth', PlotDefaults.std.LineWidth, ...
                'DisplayName', ['Im(', this.EigenObj.eigvecDisplayNames{i}, ')']);
        end
        hold off
        
        PlotDefaults.setLatexDefault; 
        legend('NumColumns', 2);
        xlabel(['$', this.DOI, '$'], 'interpreter', 'latex');
        PlotDefaults.applySizes('std');

        
        title(['Eigenmodes for $', eigDisplayName, '_', num2str(m), '$'], 'Interpreter', 'latex');

    end
end