package com.api.automation;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Runner;
import com.intuit.karate.Runner.Builder;

public class ParrallelRunnerUsingRunner {
	
	@Test
	public void ParallelRunUsingRunner()
	{
		Runner.parallel(getClass(), 5);
//		Builder builder=new Builder();
//		builder.path("classpath:com/api/automation");
//		builder.parallel(5);
		//Runner.parallel(builder);
	}

}
