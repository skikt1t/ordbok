PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE ord (
ord_id INTEGER PRIMARY KEY,
ord TEXT NOT NULL,
ordklasse TEXT,
definisjon TEXT,
kommentar TEXT
);
INSERT INTO ord VALUES(2,'example word 2','n','',NULL);
COMMIT;
