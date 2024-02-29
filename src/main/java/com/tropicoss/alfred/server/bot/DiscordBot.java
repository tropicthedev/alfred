package com.tropicoss.alfred.server.bot;

import com.tropicoss.alfred.config.AppConfig;
import com.tropicoss.alfred.config.ReadConfig;
import net.dv8tion.jda.api.JDABuilder;
import net.dv8tion.jda.api.entities.Activity;
import net.dv8tion.jda.api.requests.GatewayIntent;
import net.dv8tion.jda.api.utils.ChunkingFilter;
import net.dv8tion.jda.api.utils.MemberCachePolicy;
import net.dv8tion.jda.api.utils.cache.CacheFlag;

public class DiscordBot {
    public static void main(String[] args) {
        AppConfig appConfig = new ReadConfig().loadConfig();

        JDABuilder builder = JDABuilder.createDefault(appConfig.getBotConfig().getToken());

        builder.disableCache(CacheFlag.ACTIVITY,CacheFlag.MEMBER_OVERRIDES, CacheFlag.VOICE_STATE);

        builder.setMemberCachePolicy(MemberCachePolicy.ALL);

        builder.setChunkingFilter(ChunkingFilter.ALL);

        // Disable presence updates and typing events
        builder.disableIntents(GatewayIntent.GUILD_PRESENCES, GatewayIntent.GUILD_MESSAGE_TYPING);

        // Consider guilds with more than 50 members as "large".
        // Large guilds will only provide online members in their setup and thus reduce bandwidth if chunking is disabled.
        builder.setLargeThreshold(50);

        // Enable the bulk delete event
        builder.setBulkDeleteSplittingEnabled(false);

        // Set activity (like "playing Something")
        builder.setActivity(Activity.watching("TV"));

        builder.build();
    }
}
