CREATE TABLE IF NOT EXISTS Application
(
    id             INTEGER PRIMARY KEY AUTOINCREMENT,
    message_id     TEXT NOT NULL,
    applicant_id   TEXT NOT NULL,
    status         TEXT NOT NULL,
    answers        TEXT NOT NULL, -- Store JSON as text
    admin_id       TEXT,
    admin_response TEXT,
    interview_id   TEXT NULL REFERENCES Interview (application_id),
    created_at     TEXT,
    updated_at     TEXT
);

CREATE TRIGGER IF NOT EXISTS insert_Timestamp_Trigger_Application
    AFTER INSERT
    ON Application
BEGIN
    UPDATE Application SET created_at = STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW') WHERE id = NEW.id;
END;

CREATE TRIGGER IF NOT EXISTS update_Timestamp_Trigger_Application
    AFTER UPDATE
    ON Application
BEGIN
    UPDATE Application SET updated_at = STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW') WHERE id = NEW.id;
END;

CREATE TABLE IF NOT EXISTS Interview
(
    id             INTEGER PRIMARY KEY AUTOINCREMENT,
    application_id TEXT UNIQUE NOT NULL,
    status         TEXT NOT NULL,
    created_at     TEXT,
    updated_at     TEXT
);

CREATE TRIGGER IF NOT EXISTS insert_Timestamp_Trigger_Interview
    AFTER INSERT
    ON Interview
BEGIN
    UPDATE Interview SET created_at = STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW') WHERE id = NEW.id;
END;

CREATE TRIGGER IF NOT EXISTS update_Timestamp_Trigger_Interview
    AFTER UPDATE
    ON Interview
BEGIN
    UPDATE Interview SET updated_at = STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW') WHERE id = NEW.id;
END;

CREATE TABLE IF NOT EXISTS AuditLog
(
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    action     TEXT CHECK ( action IN
                            ('ACCEPT-APP', 'DENY-APP', 'ACCEPT-INT', 'DENY-INT', 'DELETE-APP', 'DELETE-INT', 'KICK',
                             'BAN') ) NOT NULL,
    executor   TEXT                   NOT NULL,
    data       TEXT                   NOT NULL,
    created_at TEXT
);

CREATE TRIGGER IF NOT EXISTS insert_Timestamp_Trigger_AuditLog
    AFTER INSERT
    ON AuditLog
BEGIN
    UPDATE AuditLog SET created_at = STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW') WHERE id = NEW.id;
END;

CREATE TABLE IF NOT EXISTS Member
(
    id               INTEGER PRIMARY KEY AUTOINCREMENT,
    mojang_id        TEXT     NOT NULL,
    discord_id       TEXT     NOT NULL,
    grace_period_end DATETIME NOT NULL,
    created_at       TEXT,
    updated_at       TEXT
);

CREATE TRIGGER IF NOT EXISTS insert_Timestamp_Trigger_Member
    AFTER INSERT
    ON Member
BEGIN
    UPDATE Member SET created_at = STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW') WHERE id = NEW.id;
END;

CREATE TRIGGER IF NOT EXISTS update_Timestamp_Trigger_Member
    AFTER UPDATE
    ON Member
BEGIN
    UPDATE Member SET updated_at = STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW') WHERE id = NEW.id;
END;

CREATE TABLE IF NOT EXISTS Server
(
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    name       TEXT,
    created_at TEXT,
    updated_at TEXT
);

CREATE TRIGGER IF NOT EXISTS insert_Timestamp_Trigger_Server
    AFTER INSERT
    ON Server
BEGIN
    UPDATE Server SET created_at = STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW') WHERE id = NEW.id;
END;

CREATE TRIGGER IF NOT EXISTS update_Timestamp_Trigger_Server
    AFTER UPDATE
    ON Server
BEGIN
    UPDATE Server SET updated_at = STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW') WHERE id = NEW.id;
END;

CREATE TABLE IF NOT EXISTS Session
(
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    mojang_id  TEXT REFERENCES Member (mojang_id),
    server_id  TEXT REFERENCES Server (id),
    start_time TEXT NOT NULL,
    end_time   TEXT,
    FOREIGN KEY (mojang_id) REFERENCES Member (mojang_id) ON DELETE CASCADE,
    FOREIGN KEY (server_id) REFERENCES Server (id) ON DELETE CASCADE
);

CREATE TRIGGER IF NOT EXISTS insert_Timestamp_Trigger_Session
    AFTER INSERT
    ON Session
BEGIN
    UPDATE Session SET start_time = STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW') WHERE id = NEW.id;
END;
