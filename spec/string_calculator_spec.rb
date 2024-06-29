### spec/string_calculator_spec.rb
require 'rspec'
require_relative '../lib/add_string_calculator'

RSpec.describe 'StringCalculator' do
    #{ To create an object
    before(:each) do
        @string_calculator = AddStringCalculator.new
    end

    shared_examples 'add' do |input, expected|
        it "When the add input is #{input} Then result is #{expected} value" do
          expect(@string_calculator.add(input)).to eq(expected)
        end
    end
    shared_examples 'add_errors' do |input, expected|
        it "When the add input is #{input} Then result is #{expected} value" do
          expect { @string_calculator.add(input) }.to raise_error(RuntimeError, expected)
        end
    end
    context "1. Create a simple String calculator with a method signature" do
        include_examples 'add', "", 0
        include_examples 'add', "1", 1
        include_examples 'add', "1,5", 6
    end
    context "2. Allow the Add method to handle an unknown amount of numbers" do
        include_examples 'add', "1,2,3", 6
        include_examples 'add', "1,2,3,4,5", 15
    end
    context "3. Allow the Add method to handle new lines between numbers instead of commas." do
        include_examples 'add', "1\n2,3", 6
        include_examples 'add', "1\n2\n3", 6
    end
    context "4. Support different delimiters" do
        include_examples 'add', "//;\n1;2", 3
    end
    context "5.Calling add with a negative number will throw an exception: negative numbers not allowed negative_number" do
        include_examples 'add_errors', "1,-2,3", "negative numbers not allowed -2"
        include_examples 'add_errors', "-1,-2,3", "negative numbers not allowed -1,-2"
    end
end
