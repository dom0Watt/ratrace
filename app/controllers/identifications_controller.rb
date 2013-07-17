class IdentificationsController < ApplicationController
  require 'test_class_item'
   
  def new
    @identification = Identification.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @identification }
    end
  end

   def create
    
    if params[:identification][:selectClass]
      @testClasses = selectTestClasses params
      render 'listClasses'
    else
       @identification = Identification.new(params[:identification])
      result = Salesforcewebservices.getResults params[:identification][:userName], params[:identification][:password], params[:identification][:token]
      @successes =  result[:run_tests_response][:result][:successes]
      if result[:run_tests_response][:result][:failures].nil?
        @failures = Hash.new 
      else
        @failures = result[:run_tests_response][:result][:failures]
      end


      @numberTests = result[:run_tests_response][:result][:num_tests_run]
      @overAllCodeCoverage = processOverAllCodeCoverage result[:run_tests_response][:result][:code_coverage]
      @numberFailures = result[:run_tests_response][:result][:num_failures]
      @totalTime = minutes=(result[:run_tests_response][:result][:total_time].to_i/(1000*60))%60
      render 'show'
      
    end  
  end


  def processOverAllCodeCoverage codeCoverages
    overAllAmount = 0;
    overAllLines = 0;
    @codeCoverage = Hash.new
    coverage = 0;
    counter = 0;
    codeCoverages.each do |code|
      if code[:num_locations_not_covered].to_i > 0
        coverage =  ((code[:num_locations].to_i - code[:num_locations_not_covered].to_i)*100)/code[:num_locations].to_i
        overAllAmount += coverage
      else
        coverage = 100
        overAllAmount += 100
      end 
      overAllLines += code[:num_locations].to_i
      @codeCoverage[code[:name]] = coverage
      counter += 1
    end
    overAllAmount / counter
  end  

  def selectTestClasses params
   
    result = Salesforcewebservices.getAllTestClasses params[:identification][:userName], params[:identification][:password], params[:identification][:token]
    testClasses = Array.new 
    testClassesHash =  result[:query_response][:result][:records]
    testClassesHash.each do |testClass|
      if isTestClass testClass
        testClasses.push TestClassItem.new(testClass[:name].to_s, false)
      end
    end  
    testClasses
  end


  def isTestClass testClass
    body = testClass[:body].to_s
    name = testClass[:name].to_s
    if (body.include? "@isTest") || (name.include? "Test")
      true
    end
  end  
 
 
end
