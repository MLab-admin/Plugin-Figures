function h = clear(this, varargin)
%[Figures].clear Clear figures by name.
%   [Figures].CLEAR(FNAME1, FNAME2, ...) Clears the figure with name
%   FNAME1, FNAME2, etc. If there is no figure correponding to a name, it 
%   is created.
%
%   See alos: ML.Figures.

h = this.select(varargin{:});
for i = 1:numel(h)
    
    figure(h(i));
    
    % Protect figure toolbar
    set(h(i),'toolbar','figure');
    
    C = get(h(i), 'Children');
    for j = 1:numel(C)
        delete(C(j));
    end
    
end
