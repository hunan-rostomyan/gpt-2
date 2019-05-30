python3.6 -m venv venv
source venv/bin/activate
pip install wheel
pip install -r requirements.txt

python -m spacy download en

# chegg-aws-wtai-nonprod
aws s3 sync s3://hunan-gpt2-artifacts/ s3

cp -r s3/models/345M venv/lib/python3.6/site-packages/pytorch_pretrained_bert/
cp s3/config.json venv/lib/python3.6/site-packages/pytorch_pretrained_bert/345M
cp s3/pytorch_model.bin venv/lib/python3.6/site-packages/pytorch_pretrained_bert/345M

# patch for v0.6.2: https://github.com/huggingface/pytorch-pretrained-BERT/issues/537
# the next release should include the fix
cp s3/tokenization_gpt2.py venv/lib/python3.6/site-packages/pytorch_pretrained_bert/
