module Services
    module MovieHelper
        class Destroyer
            attr_reader :errors
            def initialize(id)
                @id = id
            end

            def call
                @movie = movie_class.find(@id)
                @errors = @movie.errors.full_messages unless @movie.destroy
                self
            end

            def movie_class(model_name: Movie)
                model_name
            end
        end
    end
end
