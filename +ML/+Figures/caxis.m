function caxis(ax, varargin)
%ML.Figures.caxis Define colormap range
%   ML.FIGURES.CAXIS()
%
%   See also: ML.Figures.figbar.

% --- Get default values
def = {};
for i = get(gca, 'CLim')
    def{end+1} = num2str(i);
end

% --- Input dialog
res = inputdlg({'Minimum value:','Maximal value:'}, 'Colormap range', 1, def);

% --- Apply new range
if ~isempty(res)
    set(gca, 'CLim', [str2double(res{1}) str2double(res{2})]);
end
