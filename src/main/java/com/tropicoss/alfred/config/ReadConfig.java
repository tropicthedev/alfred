package com.tropicoss.alfred.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;

import java.io.File;
import java.io.IOException;

public class ReadConfig {
    public AppConfig loadConfig() {
        try {
            // Specify the path to your YAML file
            String filePath = "C:/Users/jorda/configs/alfred.yml";

            // Create ObjectMapper with YAMLFactory
            ObjectMapper objectMapper = new ObjectMapper(new YAMLFactory());

            // Read YAML file into AppConfig
            AppConfig appConfig = objectMapper.readValue(new File(filePath), AppConfig.class);

            // Access configuration values
            System.out.println("Bot Token: " + appConfig.getBotConfig().getToken());
            System.out.println("App Name: " + appConfig.getAppInfo().getName());

            return appConfig;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
