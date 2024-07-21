<div align="center">   
<img title="logo" alt="" src="logo.png"  width="600" height="300" align="center">      

<br/><br/>
[![DOI:10.1101/2024.03.28.587204](http://img.shields.io/badge/DOI-10.1101/2024.03.28.587204-F28C28.svg)](https://www.biorxiv.org/content/10.1101/2024.03.28.587204v1)

</div>

<h1 style="text-align: center;">
    Advancing protein thermostability prediction <br> with Deep Learning and attention mechanisms
</h1>

#### Introduction

In the dynamic field of biotechnology, understanding and predicting **protein thermostability** is essential for a multitude of applications, including pharmaceuticals, food production, and biofuel manufacturing. Protein thermostability refers to a protein's ability to remain **stable** and **functional at elevated temperatures**. Traditional experimental methods for determining this property are not only **time-consuming** and **expensive** but also often limited in scalability. However, recent advancements in Deep Learning, particularly those inspired by **Natural Language Processing** (NLP), have shown great promise in addressing these challenges. In this article, we explore **TemBERTure**, an innovative **Deep Learning framework** designed **to predict protein thermostability**.

#### The Importance of Protein Thermostability

Proteins capable of withstanding high temperatures are invaluable in industrial processes as they can **accelerate and enhance chemical reactions**, leading to reduced production costs and improved efficiency. However, elevated temperatures can cause proteins to denature, losing their structure and biological activity. Understanding the factors that contribute to protein thermostability is thus critical for **optimizing industrial applications**. Traditional methods, such as differential scanning calorimetry and thermogravimetric analysis, provide detailed insights but are labor-intensive and costly, limiting their practicality for large-scale studies.

#### The Deep Learning Approach

Deep Learning models have revolutionized many fields by enabling the automatic extraction of complex patterns from large datasets. In the context of protein thermostability, these models treat **protein sequences as strings of amino acids**, similar to how NLP models process sentences. By leveraging **transformer-based models** (i.e.BERT), which have demonstrated remarkable success in NLP, researchers can now predict protein properties more efficiently and accurately.

#### TemBERTure: A Novel Framework

TemBERTure is a comprehensive Deep Learning framework specifically designed for protein thermostability prediction. It consists of three key components:

1. **TemBERTureDB**: A meticulously curated database of thermophilic and non-thermophilic protein sequences, serving as the primary training resource.
2. **TemBERTureCLS**: A classifier that determines whether a protein is thermophilic (able to withstand high temperatures) or non-thermophilic.
3. **TemBERTureTm**: A regression model that predicts the melting temperature of a protein based on its primary sequence.

The foundation of TemBERTure lies in the protBERT-BFD model, a transformer-based language model pre-trained on a vast dataset of protein sequences. By fine-tuning this model through an adapter-based approach, TemBERTure achieves superior performance in distinguishing protein classes and predicting melting temperatures.

#### Database Creation and Data Diversity

A critical aspect of TemBERTure's success is its **robust database**, TemBERTureDB. This database was created by integrating data from multiple sources, including the **Meltome Atlas**, **ProThermDB**, **UniProtKB**, and **BacDive**. The integration of these diverse datasets ensures a comprehensive representation of both thermophilic and non-thermophilic sequences. To address class imbalance, the thermophilic dataset was enriched with additional sequences from the BacDive database, while the non-thermophilic dataset was augmented with challenging examples that exhibited high sequence similarity to thermophilic sequences.
![F1_Pipeline_350](https://github.com/user-attachments/assets/dd3fa013-1c5a-4d6e-99b5-03c890f66e5c)

**Data diversity** plays a pivotal role in training robust models. TemBERTure's performance highlights the importance of a comprehensive data curation strategy. Models trained on a diverse set of protein sequences from various organisms consistently outperformed those trained on limited datasets. This diversity enables the model to capture the intrinsic features of thermostability rather than merely recognizing evolutionary lineages.

#### Leveraging Attention Mechanisms 

Attention scores are a crucial component in deep learning architectures like transformers, which are used for predicting protein stability. By leveraging attention mechanisms, the model can selectively focus on critical regions of the sequence, enhancing the accuracy of its predictions. Attention mechanisms allow **TemBERTure** to focus on specific parts of the protein sequence that are most relevant to predicting thermostability. 

![S1_AA_enrichment_vs_HAS_clstestset](https://github.com/user-attachments/assets/2e55d6e5-41e0-4ec1-8a7c-455e8ce4d657)


#### Can Sequence Alone Reveal Structural Insights?

https://github.com/user-attachments/assets/e0803097-20bc-4ac1-a36c-b5da43b07866


By analyzing these attention scores alongside the 3D structure of proteins, we can gain deeper insights into the interactions between amino acids and their surrounding environment. We asked ourselves if TemBERTureCLS uses structural information beyond only sequence information. To do so, we mapped the attention scores directly onto protein structures. The analysis showed that higher attention scores were consistently localized across homologous proteins, regardless of sequence entropy. Notably, these higher attention scores were often found in helical regions and the protein core, suggesting that the model prioritizes structurally important elements when predicting thermostability.


#### Results and Findings

TemBERTure has demonstrated remarkable **capabilities in predicting protein thermostability**. The classifier (TemBERTureCLS) effectively distinguishes between thermophilic and non-thermophilic proteins, while the regression model (TemBERTureTm) predicts melting temperatures. These models offer significant improvements over traditional methods and previous machine learning approaches, underscoring the potential of Deep Learning in this field. The TemBERTureCLS model achieved an overall accuracy of 0.89, an F1-score of 0.9, and a Matthews Correlation Coefficient (MCC) of 0.78, demonstrating balanced predictive performance across both non-thermophilic and thermophilic sequences, with F1-scores of 0.88 and 0.90 respectively. The low standard deviation across multiple trained models indicates robust training, leading us to retain the initially trained model as the final version of TemBERTureCLS. When comparing TemBERTureCLS to other state-of-the-art models, it was observed that many of these models tend to overpredict the non-thermophilic class. Although these models achieved a competitive average precision of 0.79 for thermophilic sequences, their recall was below 0.7, resulting in numerous misclassifications of non-thermophilic proteins.
![F2_SOTA_350](https://github.com/user-attachments/assets/1c0a2475-230b-4cee-86d8-eb297845980b)

#### Future Directions

While TemBERTure represents a significant advancement, there are still opportunities for further improvement. **Expanding the database** with more diverse and comprehensive datasets will enhance model accuracy and generalizability. Additionally, **integrating experimental data** on protein stability under different environmental conditions could provide a more holistic understanding of thermostability.

#### Conclusion

TemBERTure marks a pivotal step forward in the prediction of protein thermostability. By combining the strengths of Deep Learning and data diversity, this framework offers a more accurate and informative approach than traditional methods. As the field continues to evolve, TemBERTure and similar models will play an increasingly important role in understanding and harnessing the power of proteins.

For those interested in exploring TemBERTure further, the model and its data are available on [GitHub](https://github.com/ibmm-unibe-ch/TemBERTure).
![1_Tftwr0C_9-Roo0jrB1nb4Q-removebg-preview](https://github.com/user-attachments/assets/c167d731-7afa-4b97-8f42-836086793d68)
