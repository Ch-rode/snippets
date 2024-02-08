# library:  https://github.com/adapter-hub/adapters
import torch.nn as nn
from adapters import  BertAdapterModel

model_name = 'Rostlab/prot_bert_bfd'

### HOW TO TRAIN A BERT MODEL USING ADAPTERS WITH (I.E.) CLASSIFICATION HEAD:
def AdapterBERT(model_name,dropout_p=0.1,n_head_layers=2,head_act_function='tanh'):
    model = BertAdapterModel.from_pretrained(model_name) #1. load the pretrained model 
    model.add_adapter("AdapterBERT_adapter",set_active=True) #2. add adapters inside each bert layer (you can also play with the adapter type) 
    config = dict(layers=n_head_layers,dropout_prob=dropout_p,head_type='classification', num_labels=1, activation_function=head_act_function,) # 3. create a classification head
    model.add_prediction_head_from_config('AdapterBERT_head_adapter', config, overwrite_ok=True) #4. add the created head on top of the model 
    model.delete_head('default')  #the new adapters release added this by default --> removing
    model.bert.prompt_tuning = nn.Identity()  #the new adapters release added this by default --> removing
    model.active_head == 'AdapterBERT_head_adapter' # 5. set the head to active
    model.train_adapter(["AdapterBERT_adapter"]) # 6. set the adapters layers to trainable (freeze the pretrained model weights)
    model.set_active_adapters(["AdapterBERT_adapter"]) # 7. set the adapters layers as activate 
    print(model)
    return model 
    
#HOW TO USE THE BERT TRAINED WITH ADAPTERS AND ACTIVATE THE TRAINED ADAPTERS: 
def TrainedAdapterBERT(model_name,adapter_path):
    model = BertAdapterModel.from_pretrained(model_name)   #1. load the pretrained model 
    model.load_adapter(adapter_path+'AdapterBERT_adapter',with_head=True) # 2. load the prev. trained adapters layers
    model.load_head(adapter_path + 'AdapterBERT_head_adapter') #3. load the prev. trained head
    model.active_head == 'AdapterBERT_head_adapter' #4. set adapters to activate
    model.train_adapter(["AdapterBERT_adapter"])
    model.delete_head('default')  #the new adapters release added this by default --> removing
    model.bert.prompt_tuning = nn.Identity() #the new adapters release added this by default --> removing
    print(model)
    return model 

