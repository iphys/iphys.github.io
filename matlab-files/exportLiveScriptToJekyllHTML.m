function exportLiveScriptToJekyllHTML(liveScriptFileName, nvpairs)
%% Exports Live Script to Jekyll HTML file.
% This function exports Live Script to HTML, then converts it to Jekyll HTML.
% You can optionally specify the title for YML front matter in Jekyll HTML file.
% If the Title option is not speicifed,
% the base file name of the Live Script is used.

arguments
  liveScriptFileName {mustBeFile}
  nvpairs.Title {mustBeTextScalar}
end

[~, baseFileName, ~] = fileparts(liveScriptFileName);

if isfield(nvpairs, 'Title')
  outputTitle = nvpairs.Title;
else
  outputTitle = baseFileName;
end

export(liveScriptFileName, Format="html")

convertToJekyllHTML( ...
  OutputTitle = outputTitle, ...
  SourceFileName = baseFileName+".html", ...
  OutputFilename = baseFileName+"_jekyll.html" )

end  % function
