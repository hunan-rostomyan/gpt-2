import math

import torch
from pytorch_pretrained_bert import GPT2Tokenizer, GPT2Model, GPT2LMHeadModel

model = GPT2LMHeadModel.from_pretrained('venv/lib/python3.6/site-packages/pytorch_pretrained_bert/345M/')
model.eval()
tokenizer = GPT2Tokenizer.from_pretrained('gpt2')

model.to('cuda')

def score(sentence, model=model):
    tokenize_input = tokenizer.tokenize(sentence)
    tensor_input = torch.tensor([tokenizer.convert_tokens_to_ids(tokenize_input)])
    tensor_input = tensor_input.to('cuda')
    loss = model(tensor_input, lm_labels=tensor_input)
    return math.exp(loss)

print(score('This is a sentence.'))
