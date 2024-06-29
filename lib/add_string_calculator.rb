### lib/string_calculator.rb

class AddStringCalculator

  def add(string_numbers)
    arguments_list = arguments_splits(string_numbers)
    check_negative_own_exception(arguments_list)
    arguments_list.map(&:to_i).reduce(:+)
  end

  private
  # To splits arguments from string
  def arguments_splits(numbers)
    if(numbers.empty?)
        return [0]
    elsif(is_delimiter_exists(numbers))
        check_delimiters_custom_args(numbers)
    end
    check_comma_newline_args(numbers)
  end
  # Extract delimiter from input string
  def is_delimiter_exists(numbers)
    numbers.start_with?("//")
  end
  #To Check delimiter custom arguments
  def check_delimiters_custom_args(numbers)
    matched_str = numbers.match(/\/\/(.)\n(.*)/)
    delimiter = matched_str[1]
    new_num = matched_str[2]
    new_num.split(delimiter)
  end

  #{check comma or newline arguments
  def check_comma_newline_args(numbers)
    numbers.split(/[,,\n]/)
  end

  # negative numbers not allowed
  def check_negative_own_exception(arguments_list)
    negative_number = arguments_list.any?{ |num| num.to_i < 0 }
    if negative_number
        nums = arguments_list.select{ |num| num.to_i < 0 }
        raise RuntimeError, "negative numbers not allowed #{nums.join(",")}"
    end
  end



end
