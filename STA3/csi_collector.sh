. $HOME/esp/esp-idf/export.sh

idf.py -p /dev/ttyUSB1 monitor | grep device | tee ../CSI_STA3.csv
