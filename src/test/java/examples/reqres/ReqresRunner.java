package examples.reqres;

import com.intuit.karate.junit5.Karate;

class ReqresRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("users").relativeTo(getClass());
    }    

}
