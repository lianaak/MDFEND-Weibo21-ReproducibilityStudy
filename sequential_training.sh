#!/bin/bash

for i in {1..10}; do
    echo "./data/weibo21/test$i.pkl" > test.txt
    python main.py --model_name mdfend --batchsize 33 --lr 0.0007 --train './data/weibo21/train$i.pkl' --val './data/weibo21/val$i.pkl' --test './data/weibo21/test$i.pkl'> "mdfend_split$i.txt"  
    if [ $? -eq 0 ]; then
        echo "Script completed successfully"
    else
        echo "Script failed" >> "bert_all_split${i}.txt"
        exit 1
    fi
done