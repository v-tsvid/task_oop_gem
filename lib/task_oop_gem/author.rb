class Author
  attr_accessor :name, :biography

  def initialize (*params)
  	@name      = params[0]
  	@biography = params[1]
  end

  def ==(other)
    @name == other.name && @biography == other.biography
  end
end