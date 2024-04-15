module Services
    module Movies
        class Updator 

            attr_reader :errors

            def initialize(params,id)
                @params = params
                @id = id
            end
            
            def call
                @movie = movie_class.find(@id)
                @errors = @movie.errors.full_messages unless @movie.update(@params)
                self
            end
            
            def movie_class(model_name: Movie)
                model_name
            end
        end
    end
end