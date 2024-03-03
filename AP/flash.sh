. $HOME/esp/esp-idf/export.sh
idf.py fullclean
idf.py build

idf.py -p /dev/ttyUSB0 flash 
#monitor | grep device | tee ../csi_data/ap/`date "+%Y-%m-%d-%H-%M-%S"`.csv


