package com.api.automation.putRequest;

import com.intuit.karate.junit5.Karate.Test;
import com.intuit.karate.junit5.Karate;
public class putRunner1 {

	
		@Test
		public Karate putRequestRunner()
		{
			return Karate.run("UserSwaggerAPI").relativeTo(getClass());
			
		}

}