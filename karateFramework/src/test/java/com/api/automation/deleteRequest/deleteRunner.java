package com.api.automation.deleteRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class deleteRunner {
	
	@Test
	public Karate deleteRunnerForPets()
	{
		return Karate.run("deleteRequest","deleteRequestStripe").tags("~@ignore").relativeTo(getClass());
	}

}
