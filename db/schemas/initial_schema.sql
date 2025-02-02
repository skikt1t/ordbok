-- Slett eksisterende tabeller

DROP TABLE IF EXISTS concepts;
DROP TABLE IF EXISTS partsofspeech;
DROP TABLE IF EXISTS languages;
DROP TABLE IF EXISTS words;
DROP TABLE IF EXISTS concept_word;


-- Opprett tabeller

PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;

-- Lager globale tabeller
-- Vurdere å bruke kortformene som primary key i stedet?



-- Semantikk og morfologi


-- Grunnkonsepter

    CREATE TABLE concepts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        desc TEXT,
        cat TEXT,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    );


-- Fonetikk og fonologi
-- Foner
-- Fonemer
-- Stavelser

-- Ordklasser

    CREATE TABLE partsofspeech (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    );


/*
-- Glosser

    CREATE TABLE words (
        id INTEGER PRIMARY KEY AUTOINCREMENT
        gloss
        partsofspeech_abbr TEXT,
        gloss TEXT NOT NULL UNIQUE, 
        desc TEXT
    );
*/

-- Språk

    CREATE TABLE languages (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP
        );

-- Ord

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



-- Relasjonstabell mellom grunnkonsepter og glosser

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


/*

CREATE VIEW testpråkView AS
    SELECT 
    FROM testspråk t

TestspråkView
    ordform
    ordklasse
    gloss
    kommentar
*/


COMMIT;




    INSERT INTO partsofspeech (id, name) VALUES
        (0, 'not specified'), 
        (1, 'noun'),
        (2, 'verb');

    INSERT INTO languages (id, name) VALUES 
        (0, 'ikke angitt');

-- Legg til constraints (hvis ikke inkludert i tabellopprettelsen)
-- I SQLite må FOREIGN KEY-konstraintene defineres i CREATE TABLE-setningen. Det er ikke mulig å legge til FOREIGN KEY-restriksjoner etterpå med ALTER TABLE, slik man kan i for eksempel PostgreSQL eller MySQL.

-- Sett inn eksempeldata (dette gjøres av egne script)