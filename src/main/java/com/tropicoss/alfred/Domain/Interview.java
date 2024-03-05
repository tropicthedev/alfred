package com.tropicoss.alfred.Domain;

public class Interview {

    private int ID;
    private static final String TABLE_NAME = "Interview";

    // Reference ApplicationID
    private String applicationID;
    private String status;
    private String createdDTTM;

    private String lastUDPTDTTM;

    public Interview() {
    }
}
