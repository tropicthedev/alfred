package com.tropicoss.alfred;

import net.fabricmc.api.DedicatedServerModInitializer;

import net.fabricmc.loader.api.FabricLoader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Alfred implements DedicatedServerModInitializer {
	// This logger is used to write text to the console and the log file.
	// It is considered best practice to use your mod id as the logger's name.
	// That way, it's clear which mod wrote info, warnings, and errors.
    public static final Logger LOGGER = LoggerFactory.getLogger("alfred");

	public static FabricLoader fabricLoader = FabricLoader.getInstance();

	@Override
	public void onInitializeServer() {
		// This code runs as soon as Minecraft is in a mod-load-ready state.
		// However, some things (like resources) may still be uninitialized.
		// Proceed with mild caution.

		LOGGER.info("Hello Fabric world!");
	}

	public static void devLogger(String loggerInput) {
		// prevent usage if the Instance is not run in a development environment
		if (!fabricLoader.isDevelopmentEnvironment()) return;

		// customize that message however you want...
		Alfred.LOGGER.info("DEV - [" + loggerInput + "]");
	}
}