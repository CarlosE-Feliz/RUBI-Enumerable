require_relative 'my_enumerable'
# MyList
class MyList
  include Enumerable
  def initialize(*list)
    @list = list
  end

  def my_each(*)
    arr = self if instance_of?(Array)
    arr = to_a if instance_of?(Range)
    i = 0
    while i < arr.length
      yield(arr[i])
      i += 1
    end
    self
  end

  def each
    @list.each { |i| yield(i) if block_given? }
  end
end

list = MyList.new(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

# all?
puts(list.all? { |e| e < 11 })
puts(list.all? { |e| e > 5 })

# any?
puts(list.any? { |e| e == 2 })
puts(list.any? { |e| e == 11 })

# filter
puts(list.filter(&:even?))
