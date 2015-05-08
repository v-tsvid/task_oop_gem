class Reader
  attr_accessor :name, :email, :city, :street, :house

  def initialize(*params)
  	@name   = params[0]
  	@email  = params[1]
  	@city   = params[2]
  	@street = params[3]
  	@house  = params[4]
  end

  def ==(other)
    @name == other.name && 
    @email == other.email &&
    @city == other.city &&
    @street == other.street &&
    @house == other.house
  end
end