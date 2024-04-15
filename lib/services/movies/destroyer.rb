module Services
    module MovieHelper
        class Destroyer
            attr_reader :errors
            def initialize(id)
                @id = id
            end

            def call
                @movie = Movie.find(@id)
                @errors = @movie.errors.full_messages unless @movie.destroy
                self
            end
        end
    end
end
