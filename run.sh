#!/bin/bash

#### data preparation
data_prepare()
{
python  local/seg.py  data/text2text/nmt.text.cn data/text2text/TED.cn
cp data/text2text/nmt.text.en data/text2text/TED.en

head -49000 data/text2text/TED.cn > data/text2text/TED.train.cn 
head -49000 data/text2text/TED.en > data/text2text/TED.train.en

tail -6800 data/text2text/TED.cn > data/text2text/TED.dev.cn
tail -6800 data/text2text/TED.en > data/text2text/TED.dev.en
}
#data_prepare

#### train and decode 
nmt_train(){
python -m translate.translate \
	--num_layers 2 \
	--size 256 \
	--en_vocab_size=20000 --cn_vocab_size=10000 \
        --steps_per_checkpoint 50 \
        --learning_rate 0.5 \
        --learning_rate_decay_factor 0.9 \
        --train_dir ./cache \
        --data_dir data/text2text/  \
     #   --decode 1 # turn on for prediction

}
#nmt_train

 nmt_decode(){
 python -m translate.translate \
         --num_layers 2 \
         --size 256 \
         --en_vocab_size=20000 --cn_vocab_size=10000 \
         --train_dir ./cache \
         --data_dir data/text2text/  \
         --decode 1 # turn on for prediction 
 }
 nmt_decode


