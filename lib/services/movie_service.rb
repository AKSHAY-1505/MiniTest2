module Services
    class MovieService

        def initialize(params = nil)
            @params = params
        end

        def create
            Services::MovieHelper::Creator.new(@params).call
        end

        def update(id)
            Services::MovieHelper::Updator.new(@params,id).call
        end

        def destroy(id)
            Services::MovieHelper::Destroyer.new(id).call
        end


    end
end