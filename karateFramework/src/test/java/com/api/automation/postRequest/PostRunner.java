package com.api.automation.postRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class PostRunner
{
	
	@Test
	public Karate postRunnerTest()
	{
		return Karate.run("PayPalAPI").relativeTo(getClass());
	}
	
	
	
}