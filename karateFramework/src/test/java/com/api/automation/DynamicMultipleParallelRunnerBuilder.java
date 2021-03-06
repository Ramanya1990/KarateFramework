package com.api.automation;

import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;


import org.junit.jupiter.api.Test;


import com.intuit.karate.Runner.Builder;

public class DynamicMultipleParallelRunnerBuilder {
	private static final String Classpath="classpath:";
	private static final String DEMILITATOR=",";
	
	@Test
	public void RunnerUsingBuilder()
	{
		Builder builder=new Builder();
		builder.path(classpathFromSystem());
		//Using tags running the particular features alone
		//sharing tags from system variables
		builder.tags(tagsFromSystem());
		builder.parallel(5);
	}
	//From the Run configuration we are passing the multiple tags and location
	private List<String> tagsFromSystem()
	{
		//If we have the , in the string then we where splitting using the ,
		
		String tagsString = System.getProperty("tags","getRequest");
		List<String> tagsList = Collections.emptyList();
		if(tagsString.contains(DEMILITATOR))
		{
			String tagsArray[]=tagsString.split(DEMILITATOR);
			tagsList=Arrays.asList(tagsArray);
			return tagsList;
		}
		tagsList=Arrays.asList(tagsString);
		return tagsList;
	}
	private List<String> classpathFromSystem()
	{
		//If we have the , in the string then we where splitting using the ,
		String classPath = System.getProperty("location","com/api");
		List<String> classPathList = Collections.emptyList();
		if(classPath.contains(DEMILITATOR))
		{
			String[] classPathArray=classPath.split(DEMILITATOR);
			classPathList=Arrays.asList(classPathArray);
			//lambda expression 
			classPathList.replaceAll((classPathEntry ->{
					return Classpath+classPathEntry;
			}));
			return classPathList;
			
		}
		classPathList=Arrays.asList(Classpath+classPath);
		return classPathList;
						
	}

}
