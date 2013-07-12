
class IdentificationsController < ApplicationController
  require 'CodeCoverageItem'
   # GET /identifications/new
  # GET /identifications/new.json
  def new
    @identification = Identification.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @identification }
    end
  end

   def create
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

  def select
    render 'listClasses'
  end

 
 
end
