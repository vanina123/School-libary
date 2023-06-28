class Person
  attr_reader :id

  def initiaalize(id, name: 'Unknown', age: 'nil', parent_permission: true)
    @id = id
    @name = name
    @age = age || 0
    @parent_permission = parent_permission
  end

  def getid; end

  def getname; end

  def getage; end

  def setname(name)
    @name = name
  end

  def setage(age)
    @age = age
  end


  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || parent_permission
  end
end
