classdef convertToJekyllHTML_UnitTest < matlab.unittest.TestCase

methods (Test)

function test_pi(~)
  exportLiveScriptToJekyllHTML("sample_pi.mlx")
end

function test_2(~)
  exportLiveScriptToJekyllHTML("sample_2.mlx", Title="Test 2")
end

end  % methods (Test)
end  % classdef
