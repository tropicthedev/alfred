package com.tropicoss.alfred.config;

import com.fasterxml.jackson.annotation.JsonProperty;

public class AppConfig {

    @JsonProperty("app")
    private AppInfo appInfo;

    @JsonProperty("bot")
    private BotConfig botConfig;

    public BotConfig getBotConfig() {
        return botConfig;
    }

    public void setBotConfig(BotConfig botConfig) {
        this.botConfig = botConfig;
    }

    public AppInfo getAppInfo() {
        return appInfo;
    }

    public void setAppInfo(AppInfo appInfo) {
        this.appInfo = appInfo;
    }
}

