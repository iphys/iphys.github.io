function convertToJekyllHTML(nvpairs)
%% Converts MATLAB generated HTML for Jekyll
% Use this function to convert MATLAB generated HTML file
% so that it can be processed by Jekyll.
% This removes the <body> tag from the given HTML,
% adds YML front matter, and modifies the CSS for <div class=rtcContent>.
%
% This is tested in MATLAB R2022a.

arguments
  nvpairs.OutputTitle {mustBeTextScalar}
  nvpairs.SourceFileName (1,1) {mustBeFile}
  nvpairs.OutputFileName {mustBeTextScalar}
end

outputTitle = nvpairs.OutputTitle;
sourceFile = nvpairs.SourceFileName;
outputFile = nvpairs.OutputFileName;

sourceText = string(fileread(sourceFile));

% Extract the content of <style type=""text/css""> for rtcContent.
textCssStr = extractBetween(sourceText, ...
  "<style type=""text/css"">.rtcContent { padding: 30px; }", ...
  "</head><body>");
assert(strlength(textCssStr) > 1)

% Extract the main part of the HTML.
bodyStr = extractBetween(sourceText, "</head><body>", "</body></html>");
assert(strlength(bodyStr) > 1)

% This comes first in the output.
% Note that the attribute of rtcContent is customized.
firstText = join([
  "---"
  "layout: default"
  "title: " + outputTitle
  "---"
  "<style type=""text/css"" media=""screen"">"
  "  .container {"
  "    margin: 10px auto;"
  "    max-width: 1200px;"
  "  }"
  "  h1 {"
  "    margin: 30px 0;"
  "    font-size: 4em;"
  "    line-height: 1;"
  "    letter-spacing: -1px;"
  "  }"
  "</style>"
  "<style type=""text/css"">"
  ".rtcContent { padding: 30px;"
  "  background: white;"
  "  border-left: 3px solid rgb(191, 191, 191);"
  "  border-right: 3px solid rgb(191, 191, 191);"
  "  border-top: 3px solid rgb(191, 191, 191);"
  "  border-bottom: 3px solid rgb(191, 191, 191);"
  "  border-radius: 10px;"
  "}"
  ], newline);

% Join all the strings.
% Note that </div> is necessary at the end.
fullText = join([
  firstText
  textCssStr
  newline
  bodyStr
  "</div>"], newline);

fd = fopen(outputFile, "w");
fprintf(fd, "%s", fullText);
fclose(fd);

end  % function
