function close(this, varargin)
%[Figures].close Closes figures by name.
%   [Figures].CLOSE(FNAME1, FNAME2) closes the figures with name FNAME1,
%   FNAME2, etc.
%
%   See alos: ML.Figures.

delete(this.select(varargin{:}));
