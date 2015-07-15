function figbar(varargin)
%ML.Figures.figbar Add the MLab toolbar to figures
%   ML.FIGURES.FIGBAR() add the figbar to the current figure.
%
%   ML.FIGURES.FIGBAR(FIG) adds the figbar to the figure FIG.
%
%   See also: ML.Figures.unfigbar, ML.Figures.config.

% === Input variables =====================================================

in = inputParser;
in.addOptional('fig', gcf, @ML.isfigure);
in.addOptional('close', false, @(x) islogical(x) || isnumeric(x));

in.parse(varargin{:});
in = in.Results;

% =========================================================================

% --- Close figbars
hs = findall(in.fig, 'Tag', 'figbar');
for i = 1:numel(hs), delete(hs(i)); end
if in.close, return; end

% --- Check
config = ML.Config.get;
if ~config.plugins.Figures.figbar, return; end

% --- Icons path
config = ML.Config.get;
ipath = [config.path 'Plugins' filesep 'Figures' filesep 'Icons' filesep];

% --- Create figbar
h = uitoolbar(in.fig, 'Tag', 'figbar', 'HandleVisibility', 'Callback');

% --- Close figbars
uipushtool(h, 'CData', icon([ipath 'close.gif']), ...
    'ClickedCallback', ['ML.Figures.figbar(gcf, true)'], ...
    'TooltipString', 'Close figbar');

% --- Figure to data
if config.plugins.Figures.figbar_fig2data
    uipushtool(h, 'CData', icon([ipath 'fig2data.gif']), ...
        'ClickedCallback', ['FD = ML.Figures.fig2data(gcf); disp(''The data have been stored in the "FD" variable.'');'], ...
        'TooltipString', 'Export to workspace', 'Separator','on');
end

% --- Lin-log tools
if config.plugins.Figures.figbar_linlog
    uitoggletool(h, 'CData', icon([ipath 'Xlinlog.gif']), ...
        'ClickedCallback', 'ML.Figures.linlog(''x'')', ...
        'TooltipString', 'X lin-log', ...
        'Separator','on');
    
    uitoggletool(h, 'CData', icon([ipath 'Ylinlog.gif']), ...
        'ClickedCallback', 'ML.Figures.linlog(''y'')', ...
        'TooltipString', 'Y lin-log');
    
    uitoggletool(h, 'CData', icon([ipath 'Zlinlog.gif']), ...
        'ClickedCallback', 'ML.Figures.linlog(''z'')', ...
        'TooltipString', 'Z lin-log');
end

% --- Caxis
uipushtool(h, 'CData', icon([ipath 'caxis.gif']), ...
    'ClickedCallback', ['ML.Figures.caxis()'], ...
    'TooltipString', 'Colormap range', 'Separator','on');


% -------------------------------------------------------------------------
function out = icon(fname)
% Icon loading that supports transparency

[cdata,map] = imread(fname);
map(sum(map,2)==3) = NaN;
out = ind2rgb(cdata,map);
