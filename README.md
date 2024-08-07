# EzSS
![Ejemplo de EzSS](https://i.imgur.com/Mj21Aff.png)
Versión actual: 1.1.1

Lenguajes: Batch y Powershell

Requesitos:
- Poder de administrador

NOTA: Si usas AnyDesk, el que está siendo escaneado debe presionar "Solicitar derechos ampliados". Cuando la herramienta te pida que permita a Windows Powershell ejecutarse como administrador simplemente presiona "Si", la herramienta NO puede ejecutarse sin administrador. Si el usuario no confía o se niega, depende del servidor deben banearlo o emplear los métodos tradicionales.

Para emplear la herramienta:
- Hacer doble clic izquierdo sobre el EzSS.bat
- Clic derecho sobre el EzSS.bat y "Abrir"

NOTA:
1. Si el usuario no confia en el ejecutable del EzSS.bat o en la herramienta en sí por el SmartScreen de Windows, deberan hacer WIN + R > Escribir powershell > CTRL + SHIFT (Mayusculas) + ENTER (Intro) > Ejecutar el siguiente comando:
- $originalPolicy = Get-ExecutionPolicy; Set-ExecutionPolicy Unrestricted -Scope Process -Force

2. Despues de acabar de usar la herramienta deberan hacer WIN + R > Escribir powershell > CTRL + SHIFT (Mayusculas) + ENTER (Intro) > Ejecutar el siguiente comando:
- $originalPolicy = Get-ExecutionPolicy; Set-ExecutionPolicy Restricted -Scope Process -Force
