# Filename: cne.sh
# License: LICENSES/LICENSE_APACHE
RES_DIR=logs
DATA_NAME=oan_outdoor # or cne
MODE=$1
if [ "$MODE" == "train" ]; then
echo "begin training"
./main.py --bn_opt=gn --use_fundamental=2 \
    --data_name=$DATA_NAME
else
echo "begin testing"
./main.py --bn_opt=gn --use_fundamental=2 \
    --data_name=$DATA_NAME --res_dir=$RES_DIR \
    --log_dir=main.py---bn_opt=gn---use_fundamental=2---data_name=$DATA_NAME \
    --save_test_dir=logs_num/$DATA_NAME/CNe --prefiltering=B --run_mode=test
fi
