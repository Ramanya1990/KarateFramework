package com.api.automation.configuration;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestConfigurationRunner {
	
	@Test
	public Karate configurationTest()
	{
		return Karate.run("TestConfiguration").relativeTo(getClass());
	}

}
