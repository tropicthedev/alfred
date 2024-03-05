CREATE TABLE IF NOT EXISTS application_questions
(
    id             INTEGER PRIMARY KEY AUTOINCREMENT,
    question_number  INTEGER,
    question_text     TEXT NOT NULL,
    enabled        TEXT,
    updated_at     TEXT
);



CREATE TABLE IF NOT EXISTS application_answers
(
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    application_id   INTEGER,
    question_number  INTEGER,
    answer_text     TEXT NOT NULL,
    updated_at     TEXT
);


CREATE TABLE IF NOT EXISTS Application
(
    id             INTEGER PRIMARY KEY AUTOINCREMENT,
    disc_message_id     TEXT NOT NULL,
    disc_applicant_uid   TEXT NOT NULL,
    app_status         TEXT NOT NULL,
    admin_id       TEXT,
    admin_response TEXT,
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

CREATE TABLE IF NOT EXISTS minecraft_server_list
(
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    name       TEXT,
    server_ip  TEXT,
    auth_key   TEXT,
    created_at TEXT,
    updated_at TEXT
);

CREATE TRIGGER IF NOT EXISTS insert_Timestamp_Trigger_Server
    AFTER INSERT
    ON minecraft_server_list
BEGIN
    UPDATE minecraft_server_list SET created_at = STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW') WHERE id = NEW.id;
END;

CREATE TRIGGER IF NOT EXISTS update_Timestamp_Trigger_Server
    AFTER UPDATE
    ON minecraft_server_list
BEGIN
    UPDATE minecraft_server_list SET updated_at = STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW') WHERE id = NEW.id;
END;
--
--CREATE TABLE IF NOT EXISTS player_session
--(
--    id         INTEGER PRIMARY KEY AUTOINCREMENT,
--    mojang_id  TEXT REFERENCES Member (mojang_id),
--    server_id  TEXT REFERENCES Server (id),
--    start_time TEXT NOT NULL,
--    end_time   TEXT,
--    FOREIGN KEY (mojang_id) REFERENCES Member (mojang_id) ON DELETE CASCADE,
--    FOREIGN KEY (server_id) REFERENCES Server (id) ON DELETE CASCADE
--);
--
--CREATE TRIGGER IF NOT EXISTS insert_Timestamp_Trigger_Session
--    AFTER INSERT
--    ON player_session
--BEGIN
--    UPDATE Session SET start_time = STRFTIME('%Y-%m-%d %H:%M:%f', 'NOW') WHERE id = NEW.id;
--END;
