class Person
  def initialize
    @name = "Jacob"
  end
  def talk
    puts "Hello, my name is #{@name}"
  end
end

instance = {
  player: Person.new,
  marker: "X"
}

instance[:player].talk
puts instance[:marker]

instance2 = instance

instance2[:player].talk
puts instance2[:marker]