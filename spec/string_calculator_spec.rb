### spec/string_calculator_spec.rb
require 'rspec'
require_relative '../lib/add_string_calculator'

RSpec.describe 'StringCalculator' do
    #{ To create an object
    before(:each) do
        @string_calculator = AddStringCalculator.new
    end
    # Reusability purpose used
    shared_examples 'add' do |input, expected|
        it "When the add input is #{input} Then result is #{expected} value" do
          expect(@string_calculator.add(input)).to eq(expected)
        end
    end
    # Reusability purpose used for Error indentifier
    shared_examples 'add_errors' do |input, expected|
        it "When the add input is #{input} Then result is #{expected} value" do
          expect { @string_calculator.add(input) }.to raise_error(RuntimeError, expected)
        end
    end
    # 1. Create a simple String calculator with a method signature
    context "1. Create a simple String calculator with a method signature" do
        include_examples 'add', "", 0
        include_examples 'add', "1", 1
        include_examples 'add', "1,5", 6
    end
    # 2. Allow the Add method to handle an unknown amount of numbers
    context "2. Allow the Add method to handle an unknown amount of numbers" do
        include_examples 'add', "1,2,3", 6
        include_examples 'add', "1,2,3,4,5", 15
    end
    # 3. Allow the Add method to handle new lines between numbers instead of commas.
    context "3. Allow the Add method to handle new lines between numbers instead of commas." do
        include_examples 'add', "1\n2,3", 6
        include_examples 'add', "1\n2\n3", 6
    end
    # 4. Support different delimiters
    context "4. Support different delimiters" do
        include_examples 'add', "//;\n1;2", 3
    end
    # 5.Calling add with a negative number will throw an exception: negative numbers not allowed negative_number"
    context "5.Calling add with a negative number will throw an exception: negative numbers not allowed negative_number" do
        include_examples 'add_errors', "1,-2,3", "negative numbers not allowed -2"
        include_examples 'add_errors', "-1,-2,3", "negative numbers not allowed -1,-2"
    end
    # 6. Numbers bigger than 1000 should be ignored, so adding 2 + 1001 = 2
    context "6.Numbers bigger than 1000 should be ignored, so adding 2 + 1001 = 2" do
        include_examples 'add', "1,1001", 1
        include_examples 'add', "2,1002 ", 2
    end
    # 7. Delimiters can be of any length with the following format: “//[delimiter]\n” for example: “//[***]\n1***2***3” should return 6
    context "7. Delimiters can be of any length with the following format: “//[delimiter]\n” for example: “//[***]\n1***2***3” should return 6" do
        include_examples 'add', "//;\n1;2;3", 6
        include_examples 'add', "//[***]\n1***2***3", 6
    end
    # 8. Allow multiple delimiters like this: “//[delim1][delim2]\n” for example “//[*][%]\n1*2%3” should return 6.
    context "8. Delimiters can be of any length with the following format: “//[delimiter]\n” for example: “//[***]\n1***2***3” should return 6" do
        include_examples 'add', "//[*][%]\n1*2%3", 6
        include_examples 'add', "//[***][%%]\n1***2%%3", 6
    end

    # 9. make sure you can also handle multiple delimiters with length longer than one char
    context "9. make sure you can also handle multiple delimiters with length longer than one char" do
        include_examples 'add', "//[***][%%]\n1***1001%%2***3", 6
        include_examples 'add', "//[***][%%][##]\n1***2%%3##4", 10
    end
end
