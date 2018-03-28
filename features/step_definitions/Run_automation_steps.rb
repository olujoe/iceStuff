
#####################################################################################################################################################
##### This is the step definition that drives the automation posting results to testrail#####
##### Author: Brian Tsang
#####################################################################################################################################################

When (/^I create test run in TestRail$/) do
	newtime = Time.now.strftime("%d/%m/%Y %H:%M")
	projectId = $projectID
	suiteId = $suiteID
	versionId = $versionId
	description = $description
	name = "BigTed ICETEA #{versionId} - #{newtime}"
	desc = "#{description} - #{versionId}"
	caseids = $caseids
	createRun(projectId, suiteId, name, desc, caseids)
end

############### Code to support create testrun in testrail ########################


def createRun(projectId, suiteId, name, desc, caseids)
	#{}"http://testrailgw.jupiter.bbc.co.uk/?action=add_run&project_id=#{projectId}&suite_id=#{suiteId}&name=#{name}&desc={words+to+describe+the+run}&case_ids=1,2,32"
	if !(caseids == "")
		uri = "http://testrailgw.jupiter.bbc.co.uk/?action=add_run&project_id=#{projectId}&suite_id=#{suiteId}&name=#{name}&desc=#{desc}&case_ids=#{caseids}&sharedSecret=thI5iSourSHAREDsecret"
	else
		uri = "http://testrailgw.jupiter.bbc.co.uk/?action=add_run&project_id=#{projectId}&suite_id=#{suiteId}&name=#{name}&desc=#{desc}&sharedSecret=thI5iSourSHAREDsecret"
		#uri = "http://testrailgw.jupiter.bbc.co.uk/?action=add_run&project_id=154&suite_id=4176&name=BigTed Active X v2.5.2.7206 - 25/08/2015 16:27&desc=This is a test report for BigTed Active X v2.5.2.7206&sharedSecret=thI5iSourSHAREDsecret"
	end
	uri = uri.gsub(" ", "%20")

	xml_data = open(uri).read
	if(xml_data.include? '{"id":')
		run = xml_data.split('{"id":')[1]
		runId = run.split(',"suite_id"')[0]
		puts runId
	else
		puts xml_data
		fail "Cannot create RUN in Testrail, check Webservice"
	end

	files = "//zgbwcfs3005.jupiter.bbc.co.uk/QA/Jenkins/Jupiter/ICETEArunid.txt"
	f = File.open(files,'w')
	f.write(runId)
	f.close
end


############### Code to support posting results to testrail ########################

def posttestrail(runId, caseId, statusId, versionId, elapsedseconds)

    uri = "http://testrailgw.jupiter.bbc.co.uk/?action=add_result_for_case&run_id=#{runId}&case_id=#{caseId}&status_id=#{statusId}&version=#{versionId}&elapsed_seconds=#{elapsedseconds}&sharedSecret=thI5iSourSHAREDsecret"
    #uri = "http://testrailgw.jupiter.bbc.co.uk/?action=add_result_for_case&run_id=110324&case_id=665022&status_id=1&version=Test&elapsed_seconds=12&sharedSecret=thI5iSourSHAREDsecret"

  uri = uri.gsub(" ", "%20")
  xml_data = open(uri).read
  if(xml_data.include? '"test_id":')
    recorded = xml_data.split('"test_id":')[1]
    testID = recorded.split(',"status_id"')[0]
    puts "TestID:"+testID
  else
    puts xml_data
    fail "Cannot Post result to Testrail, check Webservice"
  end

  timeStamp = Time.now.strftime ("posted at %H:%M %d/%m/%Y")
  files = "//zgbwcfs3005.jupiter.bbc.co.uk/QA/Jenkins/Jupiter/ICETEAresultupdatelog.txt"
  f = File.open(files,'a')
  f.write "#{testID} #{timeStamp}"
  f.close
end
