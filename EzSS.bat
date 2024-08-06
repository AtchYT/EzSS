@echo off
title EzSS
color 0A

powershell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0EzSS.ps1""' -Verb RunAs}"