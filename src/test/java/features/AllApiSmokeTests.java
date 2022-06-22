package features;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Test;

import static org.junit.Assert.assertTrue;
import static utils.Helper.generateReport;

public class AllApiSmokeTests {

    @Test
    public void runAlServiceTests() {
        Results results = Runner.path("classpath:features")
                .tags("~@ignore")
                .outputCucumberJson(true)
                .karateEnv("test")
                .parallel(1);
        generateReport(results.getReportDir());

        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
    }
}
