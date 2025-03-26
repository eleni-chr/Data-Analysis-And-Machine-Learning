function database = voters(database,varargin)

% Function written by Eleni Christoforidou in MATLAB R2022b.

% This function takes an unspecified number of inputs, but the first input
% is the current database. The rest of the arguments must come in the 
% order of name (a string or char array) and ID (an integer or 
% integer-valued double). If there is at least one occurrence of no ID number
% after a name, or the data types are not what is required, the function 
% returns the original database. The function returns a struct array 
% containing Name (a string) and ID (a double) fields as shown in the
% example below.

%Example:
% >> database = voters([], 'Brandon', 12356)
% database = 
%   struct with fields:
%     Name: "Brandon"
%       ID: 12356
% 
% >> database = voters(database, "Mike", 9876, 'Akos', 112233)
% database = 
%   1x3 struct array with fields:
%     Name
%     ID
% 
% >> database(end)
% ans = 
%   struct with fields:
%     Name: "Akos"
%       ID: 112233

% However, if there is an illegal call, the database does not change:
% >> database
% database = 
%   1x3 struct array with fields:
%     Name
%     ID
% 
% >> database = voters(database, 'Student', 99999, "No ID")
% database = 
%   1x3 struct array with fields:
%     Name
%     ID

%Testing:
% database = voters([], 'Adam', 11111)
% database = voters(database, 'Eve', 22222)
% database(1)
% database(2)

output = struct('Name',{},'ID',{});
c=cellfun(@ischar, varargin);
s=cellfun(@isstring,varargin);
idx=c+s;
oddIndices=idx(1:2:end);
evenIndices=idx(2:2:end);
if sum(oddIndices)~=length(oddIndices) || numel(evenIndices)~=length(oddIndices)
    database=database;
else
    for i = 1:2:length(varargin)
        if ischar(varargin{i})  || isstring(varargin{i})
            if isnumeric(varargin{i+1}) && (mod(varargin{i+1},1) == 0)
                output(end+1).Name=string(varargin{i});
                output(end).ID=varargin{i+1};
            else
                database=database;
            end
        else
            database=database;
        end
    end
    if size(output,2)==length(varargin)/2
        database=[database,output];
    else
        database=database;
    end
end
end