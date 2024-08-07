@echo off
title EzSS - v1.1.0

powershell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0EzSS.ps1""' -Verb RunAs}"
