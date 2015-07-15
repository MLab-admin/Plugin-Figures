function out = select(this, varargin)
%[Figures].select Select a figure by name.
%   [Figures].SELECT(FNAME) Selects the figure with name FNAME. If there is
%   no figure names FNAME, it is created.
%
%   OUT = [Figures].SELECT(FNAME1, FNAME2, ...) Returns a list of figure
%   handles corresponding to FNAME1, FNAME2, etc.
%
%   See alos: ML.Figures.

h = NaN(numel(varargin),1);

for i = 1:numel(varargin)
    
    tmp = findobj('Type', 'figure', 'name', varargin{i});
    if isempty(tmp)
        h(i) = figure('name', varargin{i});
        set(h(i), 'WindowStyle', 'docked');
    else
        h(i) = tmp;
        if i==1, figure(h(i)); end
    end
    
end

if nargout
    out = h;
end