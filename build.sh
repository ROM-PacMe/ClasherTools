#!/bin/bash
# Compilador ClasherKernel
# https://github.com/ROM-PacMe/ClasherTools

#----------------------------------------------------------#
#                  Variables y funciones                   #
#----------------------------------------------------------#

date=`date +%Y-%m-%d` # Fecha de la compilacion de la ROM. Esta no se puede editar.
PS3="Please enter the option here: " # Pregunta que opcion quieres (?)
options="Compile Help Clean Exit" # Opciones
procesador="arm aarch64 mips"
eabi="arm-eabi-4.4.3 arm-eabi-4.6 arm-eabi-4.7 arm-eabi-5.0 arm-eabi-6.0"
LOCAL_DIR=`pwd`
PATH=$PATH:$LOCAL_DIR/prebuilts/gcc/linux-x86/$proc/$arm_eabi/bin

case $(head -n1 /etc/issue | cut -f 1 -d ' ') in # Detectamos Sistema Operativo (Nada importante)
    Debian)     OS="Debian" ;; # Detecta que es Debian
    Ubuntu)     OS="Ubuntu / Linux Subsystem for Windows" ;; # Detecta que es Ubuntu
    rhel)     OS="Red Hat Enterprice Linux" ;; # Detecta que es RHel (CentOS normalmente)
    elementary)   OS="ElementaryOS";; # Detecta que es ElementaryOS
    *)          OS="Undefined";; #Detecta que el sistema operativo es indefinido
esac

#----------------------------------------------------------#
#                       Compilador                         #
#----------------------------------------------------------#

clear
echo "--------------------------------------"
echo "--------------------------------------"
echo "             Welcome To               "
echo "       ClasherKernel Compiler         "
echo " Operative System: "$OS"              "
echo "           Date: "$date"              "
echo "--------------------------------------"
echo "--------------------------------------"
echo "   Te recomendamos ir a help para     "
echo "revisar como debes usar el compilador "
echo "--------------------------------------"
echo "--------------------------------------"
echo
echo
echo
echo

select opt in $options; do
    if [[ "$opt" = "Compile" ]]; then
      clear
      echo "-------------------------------------------------------------"
      echo "-------------------------------------------------------------"
      echo "        ClasherKernel será compilado para su device          "
      echo "-------------------------------------------------------------"
      echo "-------------------------------------------------------------"
      select opt in $procesador; do
        if [[ "$opt" = "arm" ]]; then
        export proc=arm
          select opt in $eabi; do
            if [[ "$opt" = "arm-eabi-4.4.3" ]]; then
            export arm_eabi=arm-eabi-4.4.3
            make ARCH=arm CROSS_COMPILE=arm-eabi- $defconf
            make ARCH=arm CROSS_COMPILE=arm-eabi- -j16
            elif [[ "$opt" = "arm-eabi-4.6" ]]; then
            export arm_eabi=arm-eabi-4.6
            make ARCH=arm CROSS_COMPILE=arm-eabi- $defconf
            make ARCH=arm CROSS_COMPILE=arm-eabi- -j16
            elif [[ "$opt" = "arm-eabi-4.7" ]]; then
            export arm_eabi=arm-eabi-4.7
            make ARCH=arm CROSS_COMPILE=arm-eabi- $defconf
            make ARCH=arm CROSS_COMPILE=arm-eabi- -j16
            elif [[ "$opt" = "arm-eabi-5.0" ]]; then
            export arm_eabi=arm-eabi-5.0
            make ARCH=arm CROSS_COMPILE=arm-eabi- $defconf
            make ARCH=arm CROSS_COMPILE=arm-eabi- -j16
            elif [[ "$opt" = "arm-eabi-4.9" ]]; then
            export arm_eabi=arm-eabi-4.9
            make ARCH=arm CROSS_COMPILE=arm-eabi- $defconf
            make ARCH=arm CROSS_COMPILE=arm-eabi- -j16
            elif [[ "$opt" = "arm-eabi-6.0" ]]; then
            export arm_eabi=arm-eabi-6.0
            make ARCH=arm CROSS_COMPILE=arm-eabi- $defconf
            make ARCH=arm CROSS_COMPILE=arm-eabi- -j16
              fi
            done
        fi
      done
    elif [[ "$opt" = "Help" ]]; then
    clear
    echo "|--------------------------------------------------------|"
    echo "|--------------------------------------------------------|"
    echo "|Documentacion de como usar el compilador.               |"
    echo "|Hay dos opciones disponibles tales como:                |"
    echo "|-Compile:                                               |"
    echo "| Esto sirve para compilar el Kernel de ClasherKernel    |"
    echo "|--------------------------------------------------------|"
    echo "|-Clean:                                                 |"
    echo "| Esto sirve para hacer clean al Kernel completo para    |"
    echo "| compilar nuevamente desde cero.                        |"
    echo "|--------------------------------------------------------|"
    echo "|--------------------------------------------------------|"
    elif [[ "$opt" = "Clean" ]]; then
    clear
      echo "---------------------------------------------------"
      echo "---------------------------------------------------"
      echo "          Se hará clean a ClasherKernel            "
      echo "---------------------------------------------------"
      echo "---------------------------------------------------"
      make clean
    elif [[ "$opt" = "Exit" ]]; then
      clear
      echo "--------------------------------------"
      echo "--------------------------------------"
      echo "             Bye Bye!! :D             "
      echo "        Program END: "$date"          "
      echo "--------------------------------------"
      echo "--------------------------------------"
      break
    fi
done