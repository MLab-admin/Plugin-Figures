function out = fig2data(h)
%ML.Figures.fig2data extract data from a figure
%   OUT = ML.FIGURES.FIG2DATA() extracts data from the current axis.
%
%   OUT = VISU.FIG2DATA(H) uses the figure handle H.
%
%   Example:
%   >> h = ezplot('x^2');
%   >> d = fig2data(h);
%
%   OUT = VISU.FIG2DATA(F) loads the .fig file F, extracts the data and
%   close the figure.
%
%   The output OUT is a N-by-1 structure, each element being a curve (or
%   surface for 3D plots). Each element contain the fields:
%   - X: the x-data
%   - Y: the y-data
%   - Z: the z-data
%   - param: all the elements' other parameters
%
%   Example:
%   >> d = fig2data();
%   >> numel(d)         % Number of curves in the figure
%   >> d(1).X           % The x-data of the 1st curve
%   >> d(2).Y           % The y-data of the 2nd curve
%
%*  See also: ML.Figures.figbar.

% --- Defaut value --------------------------------------------------------

if ~exist('h', 'var'), h = gca; end

% --- The 'file' case -----------------------------------------------------
if ischar(h)
    
    if exist(h, 'file')
        h = open(h);
        S = Visu.fig2data(h);
        close(h);
    else
        warning('File not found. Aborting.');
        out = NaN;
        return;
    end
    
% --- The general case ----------------------------------------------------
else
    
    % --- Get the current axes
    try
        Ax = get(h, 'CurrentAxes');
    catch ME
        Ax = h;
    end
    
    % --- Get the data
    
    % Get axis children
    C = get(Ax, 'Children');
    
    % Prepare output
    S = struct('X', {}, 'Y', {}, 'Z', {}, 'param', {});
    selected = [];
    
    for i = 1:numel(C)
        
        if isfield(get(C(i)),'XData')
            
            j = numel(S)+1;
            
            S(j).X = get(C(i), 'XData');
            S(j).Y = get(C(i), 'YData');
            try
                S(j).Z = get(C(i), 'ZData');
            catch
            end
            
            f = fields(get(C(i)));
            for j = 1:numel(f)
                S(i).param.(f{j}) = get(C(i), f{j});
            end
            
            % Stored selection status
            if strcmp(get(C(i), 'Selected'), 'on')
                selected(end+1) = i;
            end
            
        end
        
    end
   
    % Filter selection
    if ~isempty(selected), S = S(selected); end
        
end

% --- Output
if nargout, out = S; end
    