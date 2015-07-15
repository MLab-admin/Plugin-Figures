function linlog(ax, varargin)
%ML.Figures.linlog Toggle axis scale
%   ML.FIGURES.LINLOG(AXIS) changes the AXIS scale mode. AXIS can be either
%   'x', 'y' or 'z'.
%
%   See also: ML.Figures.figbar.

% === Input variables =====================================================

in = inputParser;
in.addRequired('axis', @ischar);

in.parse(ax, varargin{:});
in = in.Results;

% =========================================================================

AX = upper(in.axis);

switch get(gca, [AX 'Scale'])
    case 'linear', set(gca, [AX 'Scale'], 'log');
    case 'log', set(gca, [AX 'Scale'], 'linear');
end
