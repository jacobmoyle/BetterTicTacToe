class Human
  attr_reader :name, :marker

  def initialize(params)
    @name = params[:name]
    @marker = params[:marker]
  end

end