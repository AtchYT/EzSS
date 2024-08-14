# EzSS
![Ejemplo de EzSS](https://i.imgur.com/l9JcIK9.png)
Versión actual: 1.1.2

Lenguajes: Batch y Powershell

Requesitos:
- Poder de administrador

NOTA: Si usas AnyDesk, el que está siendo escaneado debe presionar "Solicitar derechos ampliados". Cuando la herramienta solicite a Windows Powershell ejecutarse como administrador simplemente presiona "Si", la herramienta NO puede ejecutarse sin administrador. Si el usuario no confía o se niega, depende del servidor deben banearlo o emplear los métodos tradicionales (Antes de banearlo, leer aviso y confianza)

Detección completa de Sword AS (Sword Anti ScreenShare) | https://github.com/AtchYT/SwordAS

Para emplear la herramienta:
- Hacer doble clic izquierdo sobre el EzSS.bat
- Clic derecho sobre el EzSS.bat y "Abrir"

AVISO: Debido a que la herramienta de momento no está firmada digitalmente saltará una advertencia del Microsoft Windows Defender SmartScreen como el siguiente ejemplo:

Solo deben presionar: Mas información

![Ejemplo SmartScreen](https://i.imgur.com/1xB96VW.png)

A continuación: presionar Ejecutar de todas formas

![Ejemplo Ejecutar SmartScreen](https://i.imgur.com/HEesBfs.png)



CONFIANZA:
1. Si el usuario no confia en el ejecutable del EzSS.bat o en la herramienta en sí por el SmartScreen de Windows, deberan hacer WIN + R > Escribir powershell > CTRL + SHIFT (Mayusculas) + ENTER (Intro) > Ejecutar el siguiente comando:
- Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted
A continuación, solo deben de hacer clic derecho y presionar "Ejecutar con Powershell"

![Ejemplo de Activacion de la ejecucion de scripts de powershell](https://i.imgur.com/sz3KAlN.png)

2. Despues de acabar de usar la herramienta deberan hacer WIN + R > Escribir powershell > CTRL + SHIFT (Mayusculas) + ENTER (Intro) > Ejecutar el siguiente comando:
- Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Undefined

![Ejemplo de Desactivacion de la ejecucion de scripts de powershell](https://i.imgur.com/acRqEf5.png)
