-- Slett eksisterende tabeller

DROP TABLE IF EXISTS glosses;
DROP TABLE IF EXISTS languages;
DROP TABLE IF EXISTS partsofspeech;
DROP TABLE IF EXISTS words;


-- Opprett tabeller

PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;

-- Lager globale tabeller
-- Vurdere å bruke kortformene som primary key i stedet?

-- Semantikk og morfologi

/*
-- Grunnkonsepter

    CREATE TABLE concepts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        desc TEXT
    );
*/

-- Fonetikk og fonologi
-- Foner
-- Fonemer
-- Stavelser


-- Glosser

    CREATE TABLE glosses (
    --  id INTEGER PRIMARY KEY AUTOINCREMENT
    --  gloss TEXT UNIQUE NOT NULL
        gloss TEXT PRIMARY KEY,
        desc TEXT
    );


/*
-- Relasjonstabell mellom grunnkonsepter og glosser

    CREATE TABLE concept_gloss (
        concept_id
        gloss_id INTEGER NOT NULL,
        meaning_id
        
    );
*/

-- Språk

    CREATE TABLE languages (
        abbr TEXT PRIMARY KEY, 
        name TEXT
        );

-- Ordklasser

    CREATE TABLE partsofspeech (
        abbr TEXT PRIMARY KEY,
        name TEXT
    );

-- Ord

    CREATE TABLE words (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        word TEXT,
        pos TEXT,
        gloss TEXT NOT NULL UNIQUE,
        lang TEXT,
        FOREIGN KEY (pos) REFERENCES partsofspeech(abbr),
        FOREIGN KEY (gloss) REFERENCES glosses(gloss),
        FOREIGN KEY (lang) REFERENCES languages(abbr)
    );


COMMIT;

-- Legg til constraints (hvis ikke inkludert i tabellopprettelsen)
-- I SQLite må FOREIGN KEY-konstraintene defineres i CREATE TABLE-setningen. Det er ikke mulig å legge til FOREIGN KEY-restriksjoner etterpå med ALTER TABLE, slik man kan i for eksempel PostgreSQL eller MySQL.

-- Sett inn eksempeldata (dette gjøres av egne script)