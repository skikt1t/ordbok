# Ordbokprosjekt

En database for konstruerte språk. På sikt også applikasjon for aksessering og editering.

[wiki](https://github.com/soleiriken/conlanging/wiki)

## Struktur

- **Ord**: Lagret i `words`-tabellen....


## Bruk et Bash-skript hvis du vil automatisere innlasting av flere SQL-filer. < TIL SEINERE!!

Hvis du vil ha dynamisk innlasting av SQL-filer En mer fleksibel løsning er å lage et Bash-skript (reset.sh):

#!/bin/bash
sqlite3 my_database.db <<EOF
DELETE FROM words;
DELETE FROM sentences;
.read schemas/seed_data/words_data.sql
.read schemas/seed_data/sentences_data.sql
EOF

Kjør det med:
`bash reset.sh`


## Praktiske tips for nybegynnere:

Start enkelt:
Begynn med én tabell (f.eks. words) i schemas/initial_schema.sql.

Bruk SQLite:
Perfekt for nybegynnere – trenger ikke server, lagrer alt i én .db-fil.

Test direkte i SQL:
Bruk verktøy som DB Browser for SQLite til å kjøre SQL-kommandoer manuelt.

Unngå duplisering:
Hvis du ser at du skriver samme spørring mange ganger, legg den i queries/.

Versjonskontroll:
Ikke legg selve databasefilen (f.eks. dictionary.db) i git. Bruk kun SQL-skriptene.


## Hvordan balansere schema-filer og migreringer i startfasen?

1. Utviklingsfasen (du eksperimenterer og prøver deg fram)

- Rediger schemas/schema.sql direkte.
- Hvis du vil teste en ny databaseversjon, slett databasen og last inn schema.sql på nytt.
- Bruk git til å versjonskontrollere endringene, men du trenger ikke migrations ennå.

2. Når du har en grunnstruktur som fungerer
- Da kan du begynne å bruke migreringer (migrations/-mappen).
- Nye endringer gjøres som migreringer i stedet for direkte i schema.sql.
- schema.sql kan genereres på nytt av databasen (for eksempel ved å dumpe skjemaet fra en PostgreSQL-database med pg_dump --schema-only).

3. Produksjonsklar fase
- schema.sql representerer en "ren installasjon".
- migrations/ inneholder historikken over endringer.

## Hvordan strukturere schemas/-mappen

1. Enkel struktur (for små prosjekter)
Hvis databasen din er liten og enkel, kan du ha én fil for skjemaet og én for innholdet.

Eksempel:
bash
Copy
schemas/
├── initial_schema.sql   # Tabellstruktur
└── seed_data.sql        # Grunnleggende testdata

Forklaring:
- initial_schema.sql: Definerer tabellene (f.eks. CREATE TABLE).
- seed_data.sql: Fyller tabellene med eksempeldata (f.eks. INSERT INTO).

2. Modulær struktur (for større prosjekter)
Hvis databasen din er større, kan du dele opp skjemaet i flere filer basert på funksjonalitet.

Eksempel:
bash
Copy
schemas/
├── tables/              # Tabellstruktur
│   ├── words.sql        # Ord-tabell
│   ├── sentences.sql    # Setningstabell
│   └── users.sql        # Brukertabell (hvis nødvendig)
├── seed_data/           # Testdata
│   ├── words_data.sql   # Eksempelord
│   └── sentences_data.sql # Eksempelsetninger
└── constraints.sql      # Relasjoner og begrensninger (f.eks. FOREIGN KEY)

Forklaring:
- tables/: Hver fil definerer én tabell.
- seed_data/: Hver fil fyller én tabell med data.
- constraints.sql: Legger til relasjoner mellom tabeller (f.eks. FOREIGN KEY).


# Hovedoverskrift
## Underoverskrift
### Mindre underoverskrift

**Fet tekst**
*Kursiv tekst*
~~Gjennomstreking~~
`kode snippet`

- Punktliste
- Med bindestreker

1. Nummerert liste
2. Andre punkt

[Visittkort til GitHub](https//github.com/skikt1t)

| Språk   | Ord      |
|---------|----------|
| Norsk   | "Hund"   |
| Conlang | "Zoltan" |

