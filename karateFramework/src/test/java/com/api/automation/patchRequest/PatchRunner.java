package com.api.automation.patchRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class PatchRunner {
	
	@Test
	public Karate patchRunnerPaypal()
	{
		return Karate.run("patchRequest.feature").relativeTo(getClass());
	}

}
