require 'minitest/autorun'
require 'test_helper'
require 'services/movies/destroyer'

class DestroyerTest < Minitest::Test
    describe "Destroy Test" do
        def setup
            @destroyer = Services::Movies::Destroyer
        end

        it "Destroy Successfully" do
            subject = @destroyer.new(1)
            subject.stub(:movie_class , destroyer_mock_success) do
                subject.call
                assert_nil subject.errors
            end
        end

        it "Destroy Failure" do
            subject = @destroyer.new(1)
            subject.stub(:movie_class , destroyer_mock_failure) do
                subject.call
                assert_equal subject.errors , ["Error Message"]
            end
        end

        def destroyer_mock_success
            mock = Minitest::Mock.new
            mock.expect(:find , mock , [1])
            mock.expect(:destroy , true)
            mock
        end

        def destroyer_mock_failure
            mock = Minitest::Mock.new
            mock.expect(:find , mock , [1])
            mock.expect(:destroy , false)
            mock.expect(:errors , mock)
            mock.expect(:full_messages , ["Error Message"])
            mock
        end
    end
end