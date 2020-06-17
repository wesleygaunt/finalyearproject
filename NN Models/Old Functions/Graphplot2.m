function createfigure(X1, Y1, X2, Y2, X3, X4, Y3, Y4)
%CREATEFIGURE(X1, Y1, X2, Y2, X3, X4, Y3, Y4)
%  X1:  scatter x
%  Y1:  scatter y
%  X2:  scatter x
%  Y2:  scatter y
%  X3:  scatter x
%  X4:  scatter x
%  Y3:  scatter y
%  Y4:  scatter y

%  Auto-generated by MATLAB on 12-Dec-2018 12:29:58

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create scatter
scatter(X1,Y1,'DisplayName','SF Pos R_U = 6M','Marker','+');

% Create scatter
scatter(X1,X1,'DisplayName','Ideal Pos R_U = 6M');

% Create scatter
scatter(X2,Y2,'DisplayName','SF Neg R_U = 6M','Marker','+');

% Create scatter
scatter(X2,X2,'DisplayName','Ideal Neg R_U = 6M');

% Create scatter
scatter(X3,X3,'DisplayName','Ideal Pos R_U = 1.5M');

% Create scatter
scatter(X4,X4,'DisplayName','Ideal Neg R_U = 1.5M');

% Create scatter
scatter(X3,Y3,'DisplayName','SF Pos R_U = 1.5M','Marker','*');

% Create scatter
scatter(X4,Y4,'DisplayName','SF Neg R_U = 1.5M','Marker','*');

% Create xlabel
xlabel('Ideal MAC Voltage Result (V)');

% Create ylabel
ylabel('Actual MAC Voltage Result (V)');

% Set the remaining axes properties
set(axes1,'XGrid','on','XMinorGrid','on','YGrid','on','YMinorGrid','on');
% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.243841522421852 0.636070333610985 0.0848958333333333 0.260731707317073]);
