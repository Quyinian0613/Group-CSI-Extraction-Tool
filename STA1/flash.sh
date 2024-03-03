. $HOME/esp/esp-idf/export.sh
idf.py fullclean
idf.py build

idf.py -p /dev/ttyUSB1 flash 

#monitor | grep device | tee ../csi_data/sta1/`date "+%Y-%m-%d-%H-%M-%S"`.csv
