package examples.clockify;

import com.intuit.karate.junit5.Karate;

class ClockifyRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("clockify","workspace","project","timeEntries").relativeTo(getClass());
    }    

}
