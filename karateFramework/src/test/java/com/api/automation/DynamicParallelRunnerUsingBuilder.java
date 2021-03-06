package com.api.automation;

import java.util.Arrays;
import java.util.List;


import org.junit.jupiter.api.Test;


import com.intuit.karate.Runner.Builder;

public class DynamicParallelRunnerUsingBuilder {
	private static final String Classpath="classpath:";
	@Test
	public void RunnerUsingBuilder()
	{
		Builder builder=new Builder();
		builder.path(classpathFromSystem());
		//Using tags running the particular features alone
		//sharing tags from system variables
		builder.tags(tagsFromSystem());
		builder.outputCucumberJson(true);
		builder.parallel(5);
	}
	//From the Run configuration we are passing the tags and location
	private List<String> tagsFromSystem()
	{
		List<String> tagsList=Arrays.asList(System.getProperty("tags","getRequest"));
		return tagsList;
	}
	private List<String> classpathFromSystem()
	{
		List<String> classPathList=Arrays.asList(Classpath+System.getProperty("location","com/api"));
		return classPathList;
	}

}
