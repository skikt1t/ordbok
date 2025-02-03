Kommando	Hva den gjør
# Versjonskontrollering med Git

## Versjonshåndtering

`git checkout -b ny-database-struktur`
Dette oppretter en ny branch som heter ny-database-struktur og bytter deg til den.

La oss si at du legger til en ny tabell i schema.sql og lagrer filen.

`git add schema.sql`
`git commit -m "La til en ny tabell i schema.sql"`
Nå er denne endringen lagret i ny-database-struktur, men main er fortsatt uendret.

`git checkout main`
Filen schema.sql går tilbake til slik den var før du opprettet ny-database-struktur.
Endringene du gjorde i ny-database-struktur vil ikke lenger være synlige i arbeidsmappen din. Filene er ikke slettet, de ligger trygt i ny-database-struktur.

`git checkout main`
`git merge ny-database-struktur`
Nå vil endringene fra ny-database-struktur være en del av main.

## Holde oversikt

`git branch`
Viser lokale branches

`git branch -a`	
Viser både lokale og eksterne branches

`git status`	
Viser hvilken branch du er på

`git branch -v`	
Viser siste commit på hver branch

`git log --oneline --graph --decorate --all`	
Viser en visuell oversikt over commit-historikken

`git branch --merged main`
Viser hvilke branches som er flettet inn i main

`git branch --no-merged main`	
Viser hvilke branches som ikke er flettet inn i main

`git remote show origin`	
Viser eksterne branches og status på tracking

- Commit alltid hvis du vil beholde endringene i en branch før du bytter.