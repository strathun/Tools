function saveOpen(fileType)
%   saveOpen will simply save all open figures as their current figure
%   #.whatever is specified by fileType.
%
%   Inputs:
%       fileType : set this to select which file type you want to save your
%           figures as:
%               0 : .fig
%               1 : .png

figHandles = findobj( 'type', 'figure' );
figHandles = get( figHandles, 'Number' );

if isa( figHandles, 'cell' )
    figHandles = cell2mat( figHandles );
end

n = length( figHandles );

for f = 1:n

      figName = figHandles( f );
      
      % Output the figure
      if fileType == 0
         filename = sprintf( '%02d.fig', figName );
      end
      if fileType == 1
         filename = sprintf( '%02d.png', figName );
      end
      
      saveas( figure( figName ), filename );

end
end

