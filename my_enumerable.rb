# MY ENUMERABLE
# rubocop:disable all
module Enumerable
  def get_all(enum = nil)
    my_each do |element|
      if block_given?
        return false unless yield element
      elsif enum.is_a?(Regexp)
        return false unless enum.match(element)
      elsif enum.is_a?(Class)
        return false unless element.is_a?(enum)
      elsif enum.nil?
        return false unless element
      else
        return false unless enum == element
      end
    end
  end

  def get_any(any = nil)
    my_each do |element|
      if block_given?
        return true if yield element
      elsif any.is_a?(Regexp)
        return true if any.match(element)
      elsif any.is_a?(Class)
        return true if element.is_a?(any)
      elsif any.nil?
        return true if element
      elsif element == any
        return true
      end
    end
    false
  end

  def filter(_filter = nil)
    result = []
    each do |x|
      result.push(x) if yield(x)
    end
    result
  end
end
