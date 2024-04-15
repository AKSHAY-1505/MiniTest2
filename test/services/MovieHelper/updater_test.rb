require 'test_helper'
require 'minitest/autorun'
require 'services/movies/updator'


class UpdatorTest < Minitest::Test
    describe "Updating Movies" do
        def setup
            @updator = Services::Movies::Updator
        end

        it "Updates Successfully" do
            subject = @updator.new({}, 1)
            subject.stub(:movie_class, update_successfull_mock) do
                subject.call
                assert_nil subject.errors
            end
        end

        it "Update Failure" do
            subject = @updator.new({}, 1)
            subject.stub(:movie_class, update_error_mock) do
                subject.call
                assert_equal subject.errors, "Failed to Update"
            end
        end

        def update_successfull_mock
            mock = Minitest::Mock.new
            mock.expect(:find, mock, [1])
            mock.expect(:update, true, [{}])
            mock
        end

        def update_error_mock
            mock = Minitest::Mock.new
            mock.expect(:find, mock, [1])
            mock.expect(:update, false, [{}])
            mock.expect(:errors, mock)
            mock.expect(:full_messages, "Failed to Update")
            mock
        end
    end
end