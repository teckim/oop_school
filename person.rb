class Person
  attr_accessor :name, :age
  attr_reader :id

  private :is_of_age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    slef.is_of_age? || @parent_permission
  end
end