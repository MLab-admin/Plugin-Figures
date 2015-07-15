function noleg(h)
%ML.Visu.noleg Remove elements from the legend
%   ML.VISU.NOLEG(H) prevents the element identified by handle H to appear
%   in the legend. H can be either a single numeric value or an array of 
%   handles.
%
%*  See also: legend.

% --- Check
if ~exist('h', 'var'), return; end

for i = 1:numel(h)
    set(get(get(h(i),'Annotation'),'LegendInformation'), 'IconDisplayStyle', 'off');
end