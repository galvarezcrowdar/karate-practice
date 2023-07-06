package examples.shorten;

import com.intuit.karate.junit5.Karate;

class ShortenRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("shorten").relativeTo(getClass());
    }    

}
