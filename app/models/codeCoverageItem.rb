class CodeCoverageItem 
  
  def initialize(className, codeCoverage)
  	@className = className
  	@codeCoverage = codeCoverage
  end	


  def className
  	@className	
  end
  
  def className=(className)
  	@className = className
  end
  
  def codeCoverage
  	@codeCoverage
  end
  
  def codeCoverage=(codeCoverage)
  	@codeCoverage = codeCoverage
  end

end