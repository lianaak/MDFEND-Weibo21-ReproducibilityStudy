#!/bin/bash

echo "____MDFEND training____"
for i in {1..10}; do
    python main.py --model_name mdfend --batchsize 33 --lr 0.0007 --train './data/weibo21/train$i.pkl' --val './data/weibo21/val$i.pkl' --test './data/weibo21/test$i.pkl'> "mdfend_split$i.txt"  
    if [ $? -eq 0 ]; then
        echo "Training completed successfully"
    else
        echo "Training failed" 
        exit 1
    fi
done


echo "____BERT_all training____"
for i in {1..10}; do
    python main.py --model_name bert_all --batchsize 33 --lr 0.0007 --train './data/weibo21/train$i.pkl' --val './data/weibo21/val$i.pkl' --test './data/weibo21/test$i.pkl'> "bert_all_split$i.txt"  
    if [ $? -eq 0 ]; then
        echo "Training completed successfully"
    else
        echo "Training failed" 
        exit 1
    fi
done


echo "____BERT_single training____"
for i in {1..10}; do
    for c in {0..8}; do
        python main.py --model_name bert_single --category $c --batchsize 33 --lr 0.0007 --train './data/weibo21/train$i.pkl' --val './data/weibo21/val$i.pkl' --test './data/weibo21/test$i.pkl'> "bert_single_split$i_cat$c.txt"  
        if [ $? -eq 0 ]; then
            echo "Training completed successfully"
        else
            echo "Training failed" 
            exit 1
        fi
    done
done


echo "____TextCNN_all training____"
for i in {1..10}; do
    python main.py --model_name textcnn_all --emb_type w2v --batchsize 33 --lr 0.0007 --train './data/weibo21/train$i.pkl' --val './data/weibo21/val$i.pkl' --test './data/weibo21/test$i.pkl'> "textcnn_all_split$i.txt"  
    if [ $? -eq 0 ]; then
        echo "Training completed successfully"
    else
        echo "Training failed" 
        exit 1
    fi
done


echo "____TextCNN_single training____"
for i in {1..10}; do
    for c in {0..8}; do
        python main.py --model_name textcnn_single --emb_type w2v --category $c --batchsize 33 --lr 0.0007 --train './data/weibo21/train$i.pkl' --val './data/weibo21/val$i.pkl' --test './data/weibo21/test$i.pkl'> "textcnn_single_split$i_cat$c.txt"  
        if [ $? -eq 0 ]; then
            echo "Training completed successfully"
        else
            echo "Training failed" 
            exit 1
        fi
    done
done