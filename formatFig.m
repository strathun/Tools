function formatFig(figureH,style,label,grid)
%formatFig Reformats figure to paper specs.
%   Inputs : 
%       figureH : handle of figure to be formatted or gcf.
%       style : specify style.
%       label : 0 to remove all axis labels and tick marks; 1 to leave
%               alone.
%       grid : 1 = 1x1; 21 = 2 stacked on top; 12 = 2 sidebyside; 4 = 2x2 with correct
%               dimensions

if style == 0
    font_name = 'Arial';
    font_size = 16;
    
    ax = gca;
    ax.XLabel.FontSize = font_size;
    ax.XLabel.FontName = font_name;
    ax.YLabel.FontSize = font_size;
    ax.YLabel.FontName = font_name;
    
    if label == 0
        set(gca,'YTickLabel',[]);
        set(gca,'XTickLabel',[]);
        set(gca,'XLabel',[]);
        set(gca,'YLabel',[]);
        set(gca,'Title',[]);
    end
        
    %works better if it's repeated.
    
    if grid == 1
        for i = 1:2
            tightfig(gcf)
            set(gcf, 'Position', [105, 265, 684, 343])
        end
    elseif grid == 21
        for i = 1:2
            tightfig(gcf)
            set(gcf, 'Position', [105, 265, 684, 172])
        end
    elseif grid == 4
        for i = 1:2
            tightfig(gcf)
            set(gcf, 'Position', [105, 265, 342, 172])
        end
    elseif grid == 12
        for i = 1:2
            tightfig(gcf)
            set(gcf, 'Position', [105, 265, 342, 343])
        end
    end
    
end

