package api.runners;

import com.intuit.karate.junit5.Karate;

public class SmokeRunner {
<<<<<<< HEAD
@Karate.Test
	
	public Karate runTests() {
		return Karate.run("classpath:Features")
				.tags("Smoke");
=======
		@Karate.Test
	
	public Karate runTests() {
		return Karate.run("classpath:Features")
				.tags("@Smoke");
>>>>>>> c57b2dcc7008019125454e0238b6de1627809d85
	}
}
