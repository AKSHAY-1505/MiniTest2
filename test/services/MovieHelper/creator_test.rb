# require 'test/unit'
require 'test_helper'
require 'minitest/autorun'
require 'services/movies/creator'


class CreatorTest < Minitest::Test
 # Your test methods will go here

    describe "Creating Movies" do
        def setup
            @creator = Services::Movies::Creator
        end
        
        it "Creates the movie successfully" do
            subject = @creator.new({name:"Movie Name"})
            subject.stub(:movie_class, book_class_success_mock) do
                subject.call
                assert_nil subject.errors
            end
        end
        
        it "Error Creating the movie" do
            subject = @creator.new({name:"Movie Name"})
            subject.stub(:movie_class, book_class_failure_mock) do
                subject.call
                assert_equal subject.errors, ['Unique failure']
            end
        end

        # it 'return the model mock' do
        #     subject = @creator.new({name:"Movie Name"})
        #     data = subject.send(:movie_class, model_name: movie_mock)
        #     assert_equal data, movie_mock
        # end

        def book_class_success_mock
            mock = Minitest::Mock.new
            mock.expect(:new, mock, [{name:"Movie Name"}])
            mock.expect(:save, true)
            mock
        end

        def book_class_failure_mock
            mock = Minitest::Mock.new
            mock.expect(:new, mock, [{name:"Movie Name"}])
            mock.expect(:save, false)
            mock.expect(:errors, mock)
            mock.expect(:full_messages, ['Unique failure'])
            mock
        end

        def movie_mock
            mock = Minitest::Mock.new
            mock.expect(:==, true)
            mock
        end
    end
end
