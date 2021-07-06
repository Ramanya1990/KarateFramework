package com.api.automation.postRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class SwaggerRunner {
	@Test
	public Karate swaggerRun()
	{
		//return Karate.run("SwaggerAPI").relativeTo(getClass());
		return Karate.run("InventorySwaggerAPI").relativeTo(getClass());
	}

}
