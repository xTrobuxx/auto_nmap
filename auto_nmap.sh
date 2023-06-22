#!/bin/bash

credits() {
echo "  █████╗ ██╗   ██╗████████╗ ██████╗     ███╗   ██╗███╗   ███╗ █████╗ ██████╗ "
echo " ██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗    ████╗  ██║████╗ ████║██╔══██╗██╔══██╗"
echo " ███████║██║   ██║   ██║   ██║   ██║    ██╔██╗ ██║██╔████╔██║███████║██████╔╝"
echo " ██╔══██║██║   ██║   ██║   ██║   ██║    ██║╚██╗██║██║╚██╔╝██║██╔══██║██╔═══╝ "
echo " ██║  ██║╚██████╔╝   ██║   ╚██████╔╝    ██║ ╚████║██║ ╚═╝ ██║██║  ██║██║     "
echo " ╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝     ╚═╝  ╚═══╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     "
echo -e "\n                            Code By !Trobuxx                                 \n"

}


# See Proyect >> https://github.com/xTrobuxx/Auto_Nmap
# License >> By Trobuxx ©

#Colores
blanco='\033[0m'
rojo='\033[0;31m'
cyan='\033[0;36m'

#Comprobación root
if [ $(id -u) -ne 0 ]; then # (-ne) diferente
        echo -e "${rojo}[-] Debes ser root para ejecutar este script${blanco}"
exit

fi

#----------S C R I P T----------#

#Animacion Salir
bye() {
    local delay=0.2

    while true; do
        printf "\r%s   " "$1"
        sleep "$delay"
        printf "\r%s.  " "$1"
        sleep "$delay"
        printf "\r%s.. " "$1"
        sleep "$delay"
        printf "\r%s..." "$1"
        sleep "$delay"
        exit
    done
}

#----------S C R I P T----------#
test -f /usr/bin/nmap

if [ "$(echo $?)" == "0" ]; then
        clear
        credits
  read -p "[+] Introduce la IP: " ip

    while true; do
        echo -e "\n[1] Escaneo normal"
        echo "[2] Escaneo rapido pero ruidoso"
        echo "[3] Escaneo silencioso"
        echo "[4] Escaneo de servicios y versiones"
        echo -e "[5] Salir\n"
        read -p "Seleccione una opción > " opcion
        case $opcion in

            1)
                clear
                echo "[+] Escaneando..."
                nmap -p- --open $ip -oG scan_normal
                echo -e "${cyan}Reporte guardado en el fichero scan_normnal${blanco}"
                ;;

            2)
                clear
                echo "[+] Escaneando..."
                nmap -p- --open --min-rate 5000 -T5 -n -sS -Pn $ip -oG scan_rapido
                echo -e "${cyan}Reporte guardado en el fichero scan_rapido${blanco}"
                ;;

            3)
                clear
                echo "[+] Escaneando..."
                nmap -p- -T2 -sS -Pn -f $ip -oG scan_silencioso
                echo -e "${cyan}Reporte guardado en el fichero scan_silencioso${blanco}"
                ;;
            4)
                clear
                echo "[+] Escaneando..."
                nmap -p- -sCV $ip -oG scan_servicios
                echo -e "${cyan}Reporte guardado en el fichero scan_servicios${blanco}"
                ;;

            5)
                echo -e "${rojo}"
                bye Saliendo
                echo -e "${blanco}"
                ;;
            *)
                $rojo
                bye "Saliendo"
                ;;
            esac
        done
fi
