require 'test_helper'

describe 'Predicates: Empty' do
  describe 'with key' do
    before do
      @validator = Class.new do
        include Hanami::Validations

        key(:foo) { empty? }
      end
    end

    describe 'with valid input (array)' do
      let(:input) { { foo: [] } }

      it 'is successful' do
        result = @validator.new(input).validate
        result.must_be :success?
      end

      it 'has not error messages' do
        result = @validator.new(input).validate
        result.messages[:foo].must_be_nil
      end
    end

    describe 'with valid input (hash)' do
      let(:input) { { foo: {} } }

      it 'is successful' do
        result = @validator.new(input).validate
        result.must_be :success?
      end

      it 'has not error messages' do
        result = @validator.new(input).validate
        result.messages[:foo].must_be_nil
      end
    end

    describe 'with missing input' do
      let(:input) { {} }

      it 'is not successful' do
        result = @validator.new(input).validate
        result.wont_be :success?
      end

      it 'returns error message' do
        result = @validator.new(input).validate
        result.messages.fetch(:foo).must_equal ['is missing', 'must be empty']
      end
    end

    describe 'with nil input' do
      let(:input) { { foo: nil } }

      it 'is successful' do
        result = @validator.new(input).validate
        result.must_be :success?
      end

      it 'has not error messages' do
        result = @validator.new(input).validate
        result.messages[:foo].must_be_nil
      end
    end

    describe 'with blank input' do
      let(:input) { { foo: '' } }

      it 'is successful' do
        result = @validator.new(input).validate
        result.must_be :success?
      end

      it 'returns error message' do
        result = @validator.new(input).validate
        result.messages[:foo].must_be_nil
      end
    end

    describe 'with invalid input' do
      let(:input) { { foo: [23] } }

      it 'is not successful' do
        result = @validator.new(input).validate
        result.wont_be :success?
      end

      it 'returns error message' do
        result = @validator.new(input).validate
        result.messages.fetch(:foo).must_equal ['must be empty']
      end
    end
  end

  describe 'with optional' do
    before do
      @validator = Class.new do
        include Hanami::Validations

        optional(:foo) { empty? }
      end
    end

    describe 'with valid input (array)' do
      let(:input) { { foo: [] } }

      it 'is successful' do
        result = @validator.new(input).validate
        result.must_be :success?
      end

      it 'has not error messages' do
        result = @validator.new(input).validate
        result.messages[:foo].must_be_nil
      end
    end

    describe 'with valid input (hash)' do
      let(:input) { { foo: {} } }

      it 'is successful' do
        result = @validator.new(input).validate
        result.must_be :success?
      end

      it 'has not error messages' do
        result = @validator.new(input).validate
        result.messages[:foo].must_be_nil
      end
    end

    describe 'with missing input' do
      let(:input) { {} }

      it 'is successful' do
        result = @validator.new(input).validate
        result.must_be :success?
      end

      it 'has not error message' do
        result = @validator.new(input).validate
        result.messages[:foo].must_be_nil
      end
    end

    describe 'with nil input' do
      let(:input) { { foo: nil } }

      it 'is successful' do
        result = @validator.new(input).validate
        result.must_be :success?
      end

      it 'has not error messages' do
        result = @validator.new(input).validate
        result.messages[:foo].must_be_nil
      end
    end

    describe 'with blank input' do
      let(:input) { { foo: '' } }

      it 'is successful' do
        result = @validator.new(input).validate
        result.must_be :success?
      end

      it 'returns error message' do
        result = @validator.new(input).validate
        result.messages[:foo].must_be_nil
      end
    end

    describe 'with invalid input' do
      let(:input) { { foo: [23] } }

      it 'is not successful' do
        result = @validator.new(input).validate
        result.wont_be :success?
      end

      it 'returns error message' do
        result = @validator.new(input).validate
        result.messages.fetch(:foo).must_equal ['must be empty']
      end
    end
  end

  describe 'with attr' do
    before do
      @validator = Class.new do
        include Hanami::Validations

        attr(:foo) { empty? }
      end
    end

    describe 'with valid input (array)' do
      let(:input) { Input.new([]) }

      it 'is successful' do
        result = @validator.new(input).validate
        result.must_be :success?
      end

      it 'has not error messages' do
        result = @validator.new(input).validate
        result.messages[:foo].must_be_nil
      end
    end

    describe 'with valid input (hash)' do
      let(:input) { Input.new({}) }

      it 'is successful' do
        result = @validator.new(input).validate
        result.must_be :success?
      end

      it 'has not error messages' do
        result = @validator.new(input).validate
        result.messages[:foo].must_be_nil
      end
    end

    describe 'with unknown method' do
      let(:input) { Object.new }

      it 'is not successful' do
        result = @validator.new(input).validate
        result.wont_be :success?
      end

      it 'returns error message' do
        result = @validator.new(input).validate
        result.messages.fetch(:foo).must_equal ['is missing', 'must be empty']
      end
    end

    describe 'with nil input' do
      let(:input) { Input.new(nil) }

      it 'is successful' do
        result = @validator.new(input).validate
        result.must_be :success?
      end

      it 'has not error messages' do
        result = @validator.new(input).validate
        result.messages[:foo].must_be_nil
      end
    end

    describe 'with blank input' do
      let(:input) { Input.new('') }

      it 'is successful' do
        result = @validator.new(input).validate
        result.must_be :success?
      end

      it 'returns error message' do
        result = @validator.new(input).validate
        result.messages[:foo].must_be_nil
      end
    end

    describe 'with invalid input' do
      let(:input) { Input.new([23]) }

      it 'is not successful' do
        result = @validator.new(input).validate
        result.wont_be :success?
      end

      it 'returns error message' do
        result = @validator.new(input).validate
        result.messages.fetch(:foo).must_equal ['must be empty']
      end
    end
  end

  describe 'as macro' do
    describe 'with key' do
      describe 'with maybe' do
        before do
          @validator = Class.new do
            include Hanami::Validations

            key(:foo).maybe(:empty?)
          end
        end

        describe 'with valid input (array)' do
          let(:input) { { foo: [] } }

          it 'is successful' do
            result = @validator.new(input).validate
            result.must_be :success?
          end

          it 'has not error messages' do
            result = @validator.new(input).validate
            result.messages[:foo].must_be_nil
          end
        end

        describe 'with valid input (hash)' do
          let(:input) { { foo: {} } }

          it 'is successful' do
            result = @validator.new(input).validate
            result.must_be :success?
          end

          it 'has not error messages' do
            result = @validator.new(input).validate
            result.messages[:foo].must_be_nil
          end
        end

        describe 'with missing input' do
          let(:input) { {} }

          it 'is not successful' do
            result = @validator.new(input).validate
            result.wont_be :success?
          end

          it 'returns error message' do
            result = @validator.new(input).validate
            result.messages.fetch(:foo).must_equal ['is missing', 'must be empty']
          end
        end

        describe 'with nil input' do
          let(:input) { { foo: nil } }

          it 'is successful' do
            result = @validator.new(input).validate
            result.must_be :success?
          end

          it 'has not error messages' do
            result = @validator.new(input).validate
            result.messages[:foo].must_be_nil
          end
        end

        describe 'with blank input' do
          let(:input) { { foo: '' } }

          it 'is successful' do
            result = @validator.new(input).validate
            result.must_be :success?
          end

          it 'returns error message' do
            result = @validator.new(input).validate
            result.messages[:foo].must_be_nil
          end
        end

        describe 'with invalid input' do
          let(:input) { { foo: [23] } }

          it 'is not successful' do
            result = @validator.new(input).validate
            result.wont_be :success?
          end

          it 'returns error message' do
            result = @validator.new(input).validate
            result.messages.fetch(:foo).must_equal ['must be empty']
          end
        end
      end
    end

    describe 'with optional' do
      describe 'with maybe' do
        before do
          @validator = Class.new do
            include Hanami::Validations

            optional(:foo).maybe(:empty?)
          end
        end

        describe 'with valid input (array)' do
          let(:input) { { foo: [] } }

          it 'is successful' do
            result = @validator.new(input).validate
            result.must_be :success?
          end

          it 'has not error messages' do
            result = @validator.new(input).validate
            result.messages[:foo].must_be_nil
          end
        end

        describe 'with valid input (hash)' do
          let(:input) { { foo: {} } }

          it 'is successful' do
            result = @validator.new(input).validate
            result.must_be :success?
          end

          it 'has not error messages' do
            result = @validator.new(input).validate
            result.messages[:foo].must_be_nil
          end
        end

        describe 'with missing input' do
          let(:input) { {} }

          it 'is successful' do
            result = @validator.new(input).validate
            result.must_be :success?
          end

          it 'returns error message' do
            result = @validator.new(input).validate
            result.messages[:foo].must_be_nil
          end
        end

        describe 'with nil input' do
          let(:input) { { foo: nil } }

          it 'is successful' do
            result = @validator.new(input).validate
            result.must_be :success?
          end

          it 'has not error messages' do
            result = @validator.new(input).validate
            result.messages[:foo].must_be_nil
          end
        end

        describe 'with blank input' do
          let(:input) { { foo: '' } }

          it 'is successful' do
            result = @validator.new(input).validate
            result.must_be :success?
          end

          it 'returns error message' do
            result = @validator.new(input).validate
            result.messages[:foo].must_be_nil
          end
        end

        describe 'with invalid input' do
          let(:input) { { foo: [23] } }

          it 'is not successful' do
            result = @validator.new(input).validate
            result.wont_be :success?
          end

          it 'returns error message' do
            result = @validator.new(input).validate
            result.messages.fetch(:foo).must_equal ['must be empty']
          end
        end
      end
    end
  end
end