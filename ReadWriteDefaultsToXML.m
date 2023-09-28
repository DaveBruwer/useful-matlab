% Basic starting script
% Author: Dave Bruwer      Date: Sep 2023

clear; % Clear all existing variables from the memory.
clc; % Clear the Command Window (output window).

appdata_path = getenv('APPDATA'); % Getting the %AppData% directory to read and write defaults to.
currentScriptName = split(mfilename("fullpath"), "\"); % Get the full name of the current script and split by \
currentScriptName = currentScriptName(end); % Get only the filename of the current script.
defaultsFile = strcat(appdata_path, "\", currentScriptName, ".xml"); % Instantiate the defaults file location based on the current script name.


try
    defaults = readstruct(defaultsFile); % Try to read previously saved defaults from file if it exists already.
catch % If the defaults file doesn't exist already...
    defaults = struct; % Create defaults struct object.
    
    % Add the actual defaults values as properties of the defaults struct
    defaults.firstDefault = "Arrow";
    defaults.secondDefault = 10;
    defaults.thirdDefault = true;
end


% Put the code for determining & manipulating the default values here.
% (Just put the entire rest of the script here if appropriate)


try
    writestruct(defaults, defaultsFile); % Write the defaults struct to file for future use.
catch
    disp("Error writing default values to file.")
end