. $HOME/esp/esp-idf/export.sh

idf.py -p /dev/ttyUSB0 monitor | grep device | tee ../CSI_AP.csv