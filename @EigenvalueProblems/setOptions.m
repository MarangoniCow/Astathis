function setOptions(this, namedArgs)
% setOptions(this, namedArgs)   Sets additional options for an eigenvalue
% problem. 

    arguments
        this
        namedArgs.normalise                 = false;
        namedArgs.normalisationidx          = 1;
    end


    this.options.normalise = namedArgs.normalise;
    this.options.normalisationidx = namedArgs.normalisationidx;
end