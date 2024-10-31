package com.my.blog.website.utils;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringBootConfiguration;

@SpringBootConfiguration
public class AutoStartProjectInDefaultBrowser implements CommandLineRunner {
    @Override
    public void run(String... strings) throws Exception {
        try {
            Runtime.getRuntime().exec("cmd /c start http://localhost:8081");
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }
}
