@echo off

REM --- Arrange ---
set sql_schema=RpgAdventureGame.SQLite.ERDiagram.Schema.sql
set mermaid_script=RpgAdventureGame.SQLite.ERDiagram.Mermaid.mmd
set mermaid_diagram_css=RpgAdventureGame.SQLite.ERDiagram.Styles.css
set mermaid_diagram_img=RpgAdventureGame.SQLite.ERDiagram.svg

REM --- Act ---
powershell -Command "echo '> Generating database schema SQL script (%sql_schema%) ... '"
sqlite3.exe RpgAdventureGame.SQLite.db .schema > %sql_schema%

powershell -Command "echo '> Generating Mermaid script (%mermaid_script%) ... '"
SqlToMermaidErdScriptConverter.exe --Input %sql_schema% --Output %mermaid_script%"

powershell -Command "echo '> Generating database ERDiagram image (%mermaid_diagram_img%) ... '"
mmdc --input %mermaid_script% --cssFile %mermaid_diagram_css% --output %mermaid_diagram_img% --theme dark --backgroundColor black