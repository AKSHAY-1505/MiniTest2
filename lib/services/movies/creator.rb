module Services
    module Movies
        class Creator 

            attr_reader :errors

            def initialize(params)
                @params = params
            end
            
            def call
                movie = movie_class.new(@params)
                @errors = movie.errors.full_messages unless movie.save
                self
            end

            def movie_class(model_name: Movie)
                model_name
            end
        end
    end
end