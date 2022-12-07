%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   DATA CLASS
%
%   Value superclass for data eigenvalue problems. 




classdef (Abstract) DataClass
    methods 
        function S = names(this)
            S = fields(this);
        end
    end
end