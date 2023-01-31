# Investigation of Reproducibility 
## on 'MDFEND: Multi-domain Fake News Detection'
This is a reproducibility study of the paper [**MDFEND: Multi-domain Fake News Detection**](https://dl.acm.org/doi/abs/10.1145/3459637.3482139) by Nan Q, Cao J, Zhu Y, et al.

The goal of this reproducibility study is to assess the validity of the results presented in the original paper by
independently replicating the experiments using the same dataset and experimental settings. Additionally, the study
aims to evaluate the robustness and statistical significance of the findings reported in the original paper.

This repository extends the original one by 4 models that were mentioned in the paper but not provided as code. Furthermore, DataGeneration.ipynb provides code for Bootstrap Sampling which we performed in order to obtain 10 different train-validation-test splits for a significance test and finally, SignificanceTesting.ipynb presents the significance test. 

## Data
`data/weibo21` contains 10 train-validation-test splits created from the splitted dataset provided in the original repository.

## Code

Please refer to the original [repository](https://github.com/kennqiang/MDFEND-Weibo21) for the prerequisites (installing requirements, moving necessary files to the right spot, etc.). 

### Run
You can run our experiment via following command:

```
./sequential_training.sh
```

This script produces results for 5 different models for 10 different splits. The outputs are stored in `data/outputs`.
Following command is for a single model for a single split:

```python
python main.py --model_name mdfend --batchsize 33 --lr 0.0007 --train './data/weibo21/train1.pkl' --val './data/weibo21/val1.pkl' --test './data/weibo21/test1.pkl'
```
