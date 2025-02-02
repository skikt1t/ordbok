-- Slett eksisterende tabeller

DROP TABLE IF EXISTS concepts;
DROP TABLE IF EXISTS partsofspeech;
DROP TABLE IF EXISTS languages;
DROP TABLE IF EXISTS words;
DROP TABLE IF EXISTS concept_word;


-- Opprett tabeller

PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;

-- Tabell for grunnkonsepter (concepts)

    CREATE TABLE concepts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        desc TEXT,
        cat TEXT,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    );

-- Tabell for ordklasser (partsofspeech)

    CREATE TABLE partsofspeech (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    );

-- Tabell for språk (languages)

    CREATE TABLE languages (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP
        );

-- Tabell for ord (words)

    CREATE TABLE words (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        lemma TEXT,
        gloss TEXT NOT NULL UNIQUE,
        desc TEXT,
        partofspeech_id INT DEFAULT 0,
        language_id INT DEFAULT 0,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (partofspeech_id) REFERENCES partsofspeech(id),
        FOREIGN KEY (language_id) REFERENCES languages(id)
    );

-- Relasjonstabell mellom grunnkonsepter og ord (concept_word)

    CREATE TABLE concept_word (
        concept_id INTEGER NOT NULL,
        word_id INTEGER NOT NULL,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (concept_id, word_id),
        FOREIGN KEY (word_id) REFERENCES words(id)
        FOREIGN KEY (concept_id) REFERENCES concepts(id)
    );


-- Oppdatertdato (seinere fiks)
/* 
CREATE TRIGGER update_timestamp
AFTER UPDATE ON tabellnavn
FOR EACH ROW
BEGIN
    UPDATE tabellnavn SET updated_at = CURRENT_TIMESTAMP WHERE rowid = NEW.rowid;
END;
*/


    CREATE VIEW word_details AS
        SELECT 
            w.lemma,
            w.gloss,
            w.desc AS word_desc,
            l.name AS language,
            p.name AS part_of_speech,
            c.desc AS concept_desc
        FROM words w
        LEFT JOIN languages l ON w.language_id = l.id
        LEFT JOIN partsofspeech p ON w.partofspeech_id = p.id
        LEFT JOIN concept_word cw ON w.id = cw.word_id
        LEFT JOIN concepts c ON cw.concept_id = c.id;


COMMIT;


--  Data til ordklasser (partsofspeech)

    INSERT INTO partsofspeech (id, name) VALUES
        (0, 'not specified'), 
        (1, 'noun'),
        (2, 'verb');

--  Data til språk (languages)

    INSERT INTO languages (id, name) VALUES 
        (0, 'not specified');