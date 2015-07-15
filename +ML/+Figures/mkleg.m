function out = mkleg(val, varargin)
%ML.Visu.mkleg Make legend from an array of values.
%   ML.VISU.MKLEG(VAL) display a legend based on the values of VAL. VAL 
%   can be either an array or a cell.
%
%   ML.VISU.MKLEG(..., 'pref', PREF) uses the string PREF as a prefix for all
%   elements of the legend.
%
%   ML.VISU.MKLEG(..., 'suff', SUFF) uses the string SUFF as a suffix for all
%   elements of the legend.
%
%   ML.VISU.MKLEG(..., 'property', PROPERTY) specifies the input properties
%   for the LEGEND function (e.g. 'Location').
%
%   Examples:
%
%   >> leg = Visu.mkleg(1:4, 'pref', 'a = ');
%   >> leg
%   leg = 
%       'a = 1'    'a = 2'    'a = 3'    'a = 4'
%
%*  L = ML.VISU.LEG(...) do not display the legend but return the cell L 
%   that can be used with LEGEND.
%
%*  See also: legend, ML.Visu.noleg.

% === Input variables =====================================================

in = inputParser;
in.KeepUnmatched = true;
in.addRequired('val', @(x) isnumeric(x) || iscell(x));
in.addParamValue('pref', '', @ischar);
in.addParamValue('suff', '', @ischar);

in.parse(val, varargin{:});
varargin = struct2cell(in.Unmatched);
in = in.Results;

% =========================================================================

% --- Preparation
if isnumeric(in.val)
    in.val = num2cell(in.val);
end
N = numel(in.val);

% --- Legend creation
L = cell(N, 1);
for i = 1:N
    if isnumeric(in.val{i}), in.val{i} = num2str(in.val{i}); end
    L{i} = [in.pref in.val{i} in.suff];
end

% --- Output
if nargout
    out = L;
else
    warning off
    legend(L, varargin{:});
    warning on
end
