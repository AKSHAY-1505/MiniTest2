module Services
    module MovieHelper
        class Updator 

            attr_reader :errors

            def initialize(params,id)
                @params = params
                @id = id
            end
            
            def call
                @movie = Movie.find(@id)
                @errors = @movie.errors.full_messages unless @movie.update(@params)
                self
            end 
        end
    end
end