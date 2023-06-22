# Auto_Nmap

---
Auto_Nmap es un script programado en Bash para automatizar **NMAP**.
---

### Instalación

Simplemente le damos permisos de ejecución al script:
```bash
chmod +x Auto_Nmap
```

### Ejecución

Para ejecutarlo deberemos poner lo siguiente:
```bash
./Auto_Nmap
```
Una vez ejecutado el script le se ingresa la IP de la maquina que desee escanear.

### Opciones

Este script cuenta con 5 opciones:

[1] Escaneo normal (nmap -p- --open)
[2] Escaneo rapido pero ruidoso (nmap -p- --open --min-rate 5000 -T5 -n -sS -Pn)
[3] Escaneo silencioso (nmap -p- -T2 -sS -Pn -f)
[4] Escaneo de servicios y versiones (nmap -p- -sCV)
[5] Exit
