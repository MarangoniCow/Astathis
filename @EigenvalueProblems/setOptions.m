


function setOptions(this, namedArgs)

            arguments
                this
                namedArgs.normalise                 = false;
                namedArgs.normalisationidx         = 1;
            end


            this.options.normalise = namedArgs.normalise;
            this.options.normalisationidx = namedArgs.normalisationidx;
end