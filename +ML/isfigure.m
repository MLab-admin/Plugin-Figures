function out = isfigure(fig)
%ML.Figures.isfigure Check if the input is a figure

out = (verLessThan('matlab', '8.4.0.150421') && isnumeric(fig)) || isa(fig, 'matlab.ui.Figure');
    
