% Load saved figures
k=hgload('E10.fig');
c=hgload('E12.fig');

% Prepare subplots
figure
h(1)=subplot(2,1,1);
h(2)=subplot(2,1,2);

% Paste figures on the subplots
copyobj(allchild(get(c,'CurrentAxes')),h(1));
copyobj(allchild(get(k,'CurrentAxes')),h(2));
