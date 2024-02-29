package com.tropicoss.alfred.server.bot;

import com.tropicoss.alfred.config.AppConfig;
import com.tropicoss.alfred.config.ReadConfig;
import net.dv8tion.jda.api.JDABuilder;
import net.dv8tion.jda.api.entities.Activity;
import net.dv8tion.jda.api.utils.cache.CacheFlag;

public class DiscordBot {
    public static void main(String[] args) {
        AppConfig appConfig = new ReadConfig().loadConfig();

        JDABuilder builder = JDABuilder.createDefault(appConfig.getBotConfig().getToken());

        // Disable parts of the cache
        builder.disableCache(CacheFlag.MEMBER_OVERRIDES, CacheFlag.VOICE_STATE);
        // Enable the bulk delete event
        builder.setBulkDeleteSplittingEnabled(false);
        // Set activity (like "playing Something")
        builder.setActivity(Activity.watching("TV"));

        builder.build();
    }
}
