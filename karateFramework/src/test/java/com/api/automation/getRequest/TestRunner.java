package com.api.automation.getRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestRunner {
	
	@Test
	public Karate testRun()
	{
		return Karate.run("stripeAPI").relativeTo(getClass());
		
	}
	//@Test
//	public Karate testRunUsingClasspath()
//	{
//		return Karate.run("classpath:com\\api\\automation\\getRequest\\getRequest1.feature");
//		
//	}
	
	

}
