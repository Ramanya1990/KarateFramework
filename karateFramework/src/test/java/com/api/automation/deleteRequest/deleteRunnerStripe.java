package com.api.automation.deleteRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class deleteRunnerStripe {
	
	@Test
	public Karate deleteRunnerForCustomers()
	{
		return Karate.run("deleteRequestStripe").relativeTo(getClass());
	}

}
