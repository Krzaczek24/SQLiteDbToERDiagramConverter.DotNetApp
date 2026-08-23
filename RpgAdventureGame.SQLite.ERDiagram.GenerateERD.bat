@echo off

REM --- Arrange ---
set workspace=
set sql_schema=%workspace%RpgAdventureGame.SQLite.ERDiagram.Schema.sql
set mermaid_script=%workspace%RpgAdventureGame.SQLite.ERDiagram.Mermaid.mmd
set mermaid_diagram_css=%workspace%RpgAdventureGame.SQLite.ERDiagram.Styles.css
set mermaid_diagram_img=RpgAdventureGame.SQLite.ERDiagram.svg

REM --- Act ---
powershell -Command "echo '> Generating database schema SQL script (%sql_schema%) ... '"
%workspace%sqlite3.exe RpgAdventureGame.SQLite.db .schema > %sql_schema%

powershell -Command "echo '> Generating Mermaid script (%mermaid_script%) ... '"
%workspace%SqlToMermaidErdScriptConverter.exe --Input %sql_schema% --Output %mermaid_script%"

powershell -Command "echo '> Generating database ERDiagram image (%mermaid_diagram_img%) ... '"
mmdc --input %mermaid_script% --cssFile %mermaid_diagram_css% --output %mermaid_diagram_img% --theme dark --backgroundColor black