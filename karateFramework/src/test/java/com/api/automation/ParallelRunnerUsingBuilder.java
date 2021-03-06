package com.api.automation;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

import org.apache.commons.io.FileUtils;

public class ParallelRunnerUsingBuilder {
	
	@Test
	public void RunnerUsingBuilder()
	{
		Builder builder=new Builder();
		builder.path("classpath:com/api/automation");
		//Using tags running the particular features alone
		builder.tags("patchRequest");
		//has to be set to true for to generate the json files
		builder.outputCucumberJson(true);
		//Results class used to get the value of passed,failed for features and scenarios
		Results results=builder.parallel(5);
		System.out.println("Number of features---------->"+results.getFeaturesTotal());
		System.out.println("Number of scenarios---------->"+results.getScenariosTotal());
		System.out.println("Number of scenarios---------->"+results.getScenariosPassed());
		CucumberReportGeneration(results.getReportDir());
		//Assertion is from junit
		Assertions.assertEquals(0, results.getScenariosFailed());
	}
	
	//Generating cucumber Report
	private void CucumberReportGeneration(String reportDir)
	{
		File reportDirectory= new File(reportDir);
		Collection<File> jsonCollection =FileUtils.listFiles(reportDirectory, new String[] {"json"}, true);
		List<String> fileList=new ArrayList<String>();
		jsonCollection.forEach(file ->fileList.add(file.getAbsolutePath()));
		Configuration config=new Configuration(reportDirectory,"Karate Sample");
		ReportBuilder reportBuild=new ReportBuilder(fileList,config);
		reportBuild.generateReports();
		
	}

}
