@echo off
title "EzSS · v1.1.1 | Launcher"

powershell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""EzSS.ps1""' -Verb RunAs}"
