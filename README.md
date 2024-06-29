# String_Calculator_TDD_Kata

Incubyte TDD Assessment: To Test for String Calculator TDD Kata

# 1. Set Up Your Project Directory

## Create a new directory for your project:

mkdir String_Calculator_TDD_Kata

cd String_Calculator_TDD_Kata

## 2. Initialize a new Git repository (optional but recommended):

git init

# 2. Initialize the Project with Bundler

## 1. Create a Gemfile:

bundle init

## 2. Edit the Gemfile to include RSpec: (or) Use bundle add rspec

### Gemfile

source "https://rubygems.org"

gem "rspec"

## 3. Install the RSpec gem:

bundle install

# 3. Set Up RSpec

## 1.Initialize RSpec in your project:

bundle exec rspec --init

.
├── .rspec
└── spec
└── spec_helper.rb

# 4. Write Your First Test

## 1.Create a new directory for your code (e.g., lib):

mkdir lib

## 2.Create your first test file:

touch spec/string_calculator_spec.rb

## 3.Write a simple test in spec/example_spec.rb:

### spec/string_calculator_spec.rb

require 'rspec'

require_relative '../lib/string_calculator'

RSpec.describe 'Example' do

    it 'does something' do

        expect(true).to eq(true)

    end

end

## 4.Create the corresponding code file:

touch lib/string_calculator.rb

## 5.Write the implementation in lib/string_calculator.rb:

### lib/string_calculator.rb

class StringCalculator

    def self.do_something

        true

    end

end
`

## 6.Update the test to use the implementation:

### spec/string_calculator_spec.rb

require 'rspec'

require_relative '../lib/string_calculator'

RSpec.describe 'StringCalculator' do

    it 'does something' do

        expect(StringCalculator.do_something).to eq(true)

    end

end

# 5. Run Your Tests

## 1.Run your RSpec tests:

bundle exec rspec

OR

rspec --format documentation
