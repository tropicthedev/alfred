package com.tropicoss.alfred.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;
import com.tropicoss.alfred.Alfred;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;

public class ReadConfig {
    public AppConfig loadConfig() {
        try {
            // Specify the path to your YAML file
            String filePath = Alfred.fabricLoader.getConfigDir().resolve("alfred/alfred-config.yml").toString();

            // Create ObjectMapper with YAMLFactory
            ObjectMapper objectMapper = new ObjectMapper(new YAMLFactory());

            Alfred.devLogger("Reading config file: " + filePath);

            // Read YAML file into AppConfig
            return objectMapper.readValue(new File(filePath), AppConfig.class);

        } catch (IOException e) {
            Alfred.devLogger("Error reading config file: " + Arrays.toString(e.getStackTrace()));
            Alfred.LOGGER.error("Error reading config file: " + e.getMessage());
        }
        return null;
    }
}
