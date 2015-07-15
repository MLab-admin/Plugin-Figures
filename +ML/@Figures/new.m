function out = new(this, varargin)
%[Figures].new Creates figures.
%   OUT = [Figures].NEW(NAME1, NAME2, ...) Creates figures with names NAME1,
%   NAME2, etc. OUT is an array of figures handles.
%
%   See alos: ML.Figures.

% TO DO check that there are not many figures with the same name.

h = NaN(numel(varargin),1);

for i = 1:numel(varargin)
    tmp = findobj('Type', 'figure', 'name', varargin{i});
    if isempty(tmp)
        h(i) = figure('name', varargin{i});
        set(h(i), 'WindowStyle', 'docked');
    else
        h(i) = tmp;
    end
end

% --- Output
if nargout
    out = h;
end