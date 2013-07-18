class TestClassItem 


  def initialize(className, isSelected)
  	@className = className
    @isSelected = isSelected
  end	

  def className=(className)
  	@className = className
  end

  def className
  	@className
  end

  def isSelected
  	@isSelected
  end

  def isSelected=(isSelected)
  	@isSelected = isSelected
  end
end