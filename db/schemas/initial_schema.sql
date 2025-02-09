-- Slett eksisterende tabeller

DROP TABLE IF EXISTS meanings;
DROP TABLE IF EXISTS partsofspeech;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS forms;
DROP TABLE IF EXISTS words;
-- DROP TABLE IF EXISTS meaning_word;
-- DROP VIEW IF EXISTS dictionary;

-- Opprett tabeller

PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;

-- Tabell for betydninger (meanings)
-- 2025-02-03: Utelater kategorier for nå, men se /drafts/concept_categories, ev. bruke enkel kategorisering som entity/event?

/*
    CREATE TABLE meanings (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        desc TEXT NOT NULL
    --  cat TEXT,
    --  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    );
*/

    CREATE TABLE meanings (
        id TEXT PRIMARY KEY,
        description TEXT,
        category TEXT
    );

-- Tabell for ordklasser (partsofspeech)

    CREATE TABLE partsofspeech (
        id TEXT PRIMARY KEY,
        description TEXT
    --  id INTEGER PRIMARY KEY AUTOINCREMENT,
    --  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    );

-- Tabell for språk (languages)
-- Inkluderer variabel desc, kan brukes som senere kategorisering til natlang, conlang

    CREATE TABLE projects (
        id TEXT PRIMARY KEY,
        description TEXT
    --  id INTEGER PRIMARY KEY AUTOINCREMENT,
    --  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
        );

-- Tabell for ord (words)
-- Inkluderer variabel class som seinere kan systematiseres mer (f.eks. brukes for kjønn)

/*
    CREATE TABLE words (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        lemma TEXT,
        gloss TEXT NOT NULL,
        class TEXT,
        partofspeech_id INT DEFAULT 0,
        language_id INT DEFAULT 0,
    --  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (partofspeech_id) REFERENCES partsofspeech(id),
        FOREIGN KEY (language_id) REFERENCES languages(id)
    );
*/

    CREATE TABLE forms (
        project TEXT,
        phonological TEXT NOT NULL,
        phonetic TEXT,
        orthographic TEXT,
        description TEXT,
        PRIMARY KEY (project, phonological),
        FOREIGN KEY (project) REFERENCES projects(id)
    );


    CREATE TABLE words (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        project TEXT,
        phonological_form TEXT,
        partofspeech TEXT,
        meaning TEXT,
        gloss TEXT NOT NULL,
        FOREIGN KEY (project) REFERENCES projects(id),
        FOREIGN KEY (phonological_form) REFERENCES forms(phonological)
        FOREIGN KEY (partofspeech) REFERENCES partsofspeech(id)
        FOREIGN KEY (meaning) REFERENCES meanings(id) 

    );

/*
-- Relasjonstabell mellom grunnkonsepter og ord (concept_word)

    CREATE TABLE meaning_word (
        meaning_id INTEGER NOT NULL,
        word_id INTEGER NOT NULL,
    --  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (meaning_id, word_id),
        FOREIGN KEY (meaning_id) REFERENCES meanings(id)
        FOREIGN KEY (word_id) REFERENCES words(id)

    );
*/

-- Oppdatertdato (seinere fiks)
/* 
CREATE TRIGGER update_timestamp
AFTER UPDATE ON tabellnavn
FOR EACH ROW
BEGIN
    UPDATE tabellnavn SET updated_at = CURRENT_TIMESTAMP WHERE rowid = NEW.rowid;
END;
*/

-- View for sammenstilling av informasjon fra ulike tabeller

/*
    CREATE VIEW dictionary AS
        SELECT 
            w.lemma,
            p.name AS partofspeech,
            w.class,
            w.gloss,
            m.desc AS definition,
            l.name AS language
        FROM words w
        LEFT JOIN languages l ON w.language_id = l.id
        LEFT JOIN partsofspeech p ON w.partofspeech_id = p.id
        LEFT JOIN meaning_word mw ON w.id = mw.word_id
        LEFT JOIN meanings m ON mw.meaning_id = m.id;
*/

COMMIT;

-- Data til meanings

.mode csv
.import /home/eirik/Språking/Ordbok/db/data/raw/concepts_edited.csv meanings


-- Legge til rader for grammatiske ord og nullverdier

INSERT INTO meanings (id, description) VALUES
    ('NS', 'not specified'),
    ('grammatical', 'grammatical');

--  Data til ordklasser (partsofspeech)

INSERT INTO partsofspeech (id, description) VALUES
    ('NS', 'not specified'),
    ('n', 'noun'),
    ('v', 'verb');


/*
INSERT INTO partsofspeech (id, name) VALUES
    (0, 'Not specified'),
    (1, 'Pronoun'),
    (2, 'Noun'),
    (3, 'Verb'),
    (4, 'Adjective'),
    (5, 'Adverb'),
    (6, 'Preposition'),
    (7, 'Postposition'),
    (8, 'Determiner'),
    (9, 'Conjunction'),
    (10, 'Interjection'),
    (11, 'Particle');
*/

--  Data til språk (languages)

/*
INSERT INTO languages (id, name, desc) VALUES 
    (0, 'Not specified', NULL),
    (1, 'English', 'Natlang'),
    (2, 'Norwegian', 'Natlang');
*/

-- Lettlest outputformat

.mode column

