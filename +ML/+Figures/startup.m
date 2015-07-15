function startup()
%ML.Figures.startup [Figures plugin] startup
%   ML.FIGURES.STARTUP() executes the startup commands relative to the
%   'Figures' plugin.
%
%   See also: ML.Figures.config.

% --- Default config
config = ML.Config.get;
if ~isfield(config.plugins, 'Figures')
    config.plugins.Figures = struct();
    config.plugins.Figures.figbar = true;
    config.plugins.Figures.figbar_fig2data = true;
    config.plugins.Figures.figbar_linlog = true;
    
    % --- Save configuration structure
    save([prefdir filesep 'MLab.mat'], 'config');
    
end

if config.plugins.Figures.figbar
    set(0, 'DefaultFigureCreateFcn', {@ML.Figures.figbar});
end