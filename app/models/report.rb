class Report

	def initialize(organizationName)
		@organizationName = organizationName
		@testClasses = Array.new
	end

  	def testClasses
  		@testClasses
  	end

	def testClasses=(testClasses)
	  	@testClasses = testClasses
	end

	def organizationName
  		@organizationName
  	end

	def organizationName=(organizationName)
	  	@organizationName = organizationName
	end

end