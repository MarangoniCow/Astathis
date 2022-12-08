



function fig = graphEigenvectors(this)


    

    n = this.EigenObj.dimension;
    m = 1;

    fig = figure;
    for i = 1:n
        
        plot(this.SOIval, real(this.V(:, m, i)), 'LineStyle', '--', ...
            'Color', PlotDefaults.fetchColourByIdx(i), 'LineWidth', PlotDefaults.std.LineWidth, ...
            'DisplayName', this.EigenObj.eigvecDisplayNames{i});
        hold on
        plot(this.SOIval, imag(this.V(:, m, i)), 'LineStyle', '-', ...
            'Color', PlotDefaults.fetchColourByIdx(i), 'LineWidth', PlotDefaults.std.LineWidth, ...
            'DisplayName', this.EigenObj.eigvecDisplayNames{i});
    end
    hold off
    
    legend;
    xlabel(['$', this.SOI, '$'], 'interpreter', 'latex');
    PlotDefaults.applySizes('std');






end