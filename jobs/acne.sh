# Filename: acne.sh
# License: LICENSES/LICENSE_APACHE
RES_DIR=logs
DATA_NAME=oan_outdoor # or oan_indoor
MODE=$1
if [ "$MODE" == "train" ]; then
echo "begin training"
./main.py --gcn_opt=reweight_vanilla_sigmoid_softmax --bn_opt=gn \
    --weight_opt=sigmoid_softmax --loss_multi_logit=1 --use_fundamental=2 \
    --data_name=$DATA_NAME
else
echo "begin testing"
./main.py --gcn_opt=reweight_vanilla_sigmoid_softmax --bn_opt=gn \
    --weight_opt=sigmoid_softmax --loss_multi_logit=1 --use_fundamental=2 \
    --data_name=$DATA_NAME --res_dir=$RES_DIR \
    --log_dir=main.py---gcn_opt=reweight_vanilla_sigmoid_softmax---bn_opt=gn---weight_opt=sigmoid_softmax---loss_multi_logit=1---use_fundamental=2---data_name=$DATA_NAME \
    --save_test_dir=logs_num/$DATA_NAME/ACNe --prefiltering=B --run_mode=test
fi
