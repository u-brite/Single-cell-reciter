# SINGLE-CELL-RECITER
Single-cell topics modeling using deep learning and multi-omics enrichment analysis.

![SINGLE-CELL-RECITER](images/scRNA.gif)

[//]: <> (This is also a comment.)

## Table of Contents

- [SINGLE-CELL-RECITER](#single-cell-reciter)
  - [Table of Contents](#table-of-contents)
  - [Background](#background)
  - [Data](#data)
  - [Usage](#usage)
    - [:woman_technologist: Installation](#woman_technologist-installation)
      - [:octocat: Git](#octocat-git)
    - [Requirements](#requirements)
    - [Create and activate :snake: conda environment](#create-and-activate-snake-conda-environment)
    - [Steps to run](#steps-to-run)
      - [Step 1](#step-1)
      - [Step 2](#step-2)
  - [Results](#results)
  - [Team Members](#team-members)

## Background

In this project, we will apply the amortized Latent Dirichlet Allocation (LDA) model to scRNA. Initially developed in the natural language processing field, LDA is a method of modeling topics using a topic matrix. We can apply the method to single-cell biology by treating each cell as a document and each gene expression count as a word. After training the model, we will plot the topics over a UMAP of the reference set and inspect them for characteristic gene sets. Multiomics enrichment analysis will be performed further using ranked gene/word lists of each cell cluster/document.

## Data

[SRA Run Selector ](https://www.ncbi.nlm.nih.gov/Traces/study/?acc=PRJNA603103&o=acc_s%3Aa)

| Run         | BioProject  | BioSample    | LibraryLayout | Organism     | Sample Name | source_name | tissue      |
|-------------|-------------|--------------|---------------|--------------|-------------|-------------|-------------|
| SRR11832836 | PRJNA603103 | SAMN13919403 | PAIRED        | Homo sapiens | GSM4284223  | Skin        | cSCC        |
| SRR11832837 | PRJNA603103 | SAMN13919401 | PAIRED        | Homo sapiens | GSM4284224  | Skin        | Normal Skin |
| SRR11832838 | PRJNA603103 | SAMN13919399 | PAIRED        | Homo sapiens | GSM4284225  | Skin        | cSCC        |
| SRR11832839 | PRJNA603103 | SAMN13919396 | PAIRED        | Homo sapiens | GSM4284226  | Skin        | Normal Skin |
| SRR11832840 | PRJNA603103 | SAMN13919395 | PAIRED        | Homo sapiens | GSM4284227  | Skin        | cSCC        |
| SRR11832841 | PRJNA603103 | SAMN13919394 | PAIRED        | Homo sapiens | GSM4284228  | Skin        | Normal Skin |
| SRR11832842 | PRJNA603103 | SAMN13919393 | PAIRED        | Homo sapiens | GSM4284229  | Skin        | cSCC        |
| SRR11832843 | PRJNA603103 | SAMN13919392 | PAIRED        | Homo sapiens | GSM4284230  | Skin        | Normal Skin |
| SRR11832844 | PRJNA603103 | SAMN13919391 | PAIRED        | Homo sapiens | GSM4284231  | Skin        | cSCC        |
| SRR11832845 | PRJNA603103 | SAMN13919390 | PAIRED        | Homo sapiens | GSM4284232  | Skin        | cSCC        |
| SRR11832846 | PRJNA603103 | SAMN13919389 | PAIRED        | Homo sapiens | GSM4284233  | Skin        | Normal Skin |
| SRR11832847 | PRJNA603103 | SAMN13919388 | PAIRED        | Homo sapiens | GSM4284234  | Skin        | cSCC        |
| SRR11832848 | PRJNA603103 | SAMN13919387 | PAIRED        | Homo sapiens | GSM4284235  | Skin        | Normal Skin |
| SRR11832850 | PRJNA603103 | SAMN13919385 | PAIRED        | Homo sapiens | GSM4284237  | Skin        | Normal Skin |
| SRR11832851 | PRJNA603103 | SAMN13919384 | PAIRED        | Homo sapiens | GSM4284238  | Skin        | cSCC        |
| SRR11832852 | PRJNA603103 | SAMN13919383 | PAIRED        | Homo sapiens | GSM4284239  | Skin        | Normal Skin |
| SRR11832853 | PRJNA603103 | SAMN13919382 | PAIRED        | Homo sapiens | GSM4284240  | Skin        | cSCC        |
| SRR11832854 | PRJNA603103 | SAMN13919381 | PAIRED        | Homo sapiens | GSM4284241  | Skin        | Normal Skin |
| SRR11832855 | PRJNA603103 | SAMN13919380 | PAIRED        | Homo sapiens | GSM4284242  | Skin        | cSCC        |
| SRR11832856 | PRJNA603103 | SAMN13919379 | PAIRED        | Homo sapiens | GSM4284243  | Skin        | Normal Skin |
| SRR11832857 | PRJNA603103 | SAMN13919378 | PAIRED        | Homo sapiens | GSM4284244  | Skin        | cSCC        |
| SRR11832858 | PRJNA603103 | SAMN13919377 | PAIRED        | Homo sapiens | GSM4284245  | Skin        | Normal Skin |
| SRR11832859 | PRJNA603103 | SAMN13919434 | PAIRED        | Homo sapiens | GSM4284246  | Skin        | cSCC        |
| SRR11832860 | PRJNA603103 | SAMN13919433 | PAIRED        | Homo sapiens | GSM4284247  | Skin        | Normal Skin |
| SRR11832849 | PRJNA603103 | SAMN13919386 | PAIRED        | Homo sapiens | GSM4284236  | Skin        | cSCC        |



## Usage

### :woman_technologist: Installation

####  :octocat: Git

To fetch source code, change in to directory of your choice and run:

```sh
git clone -b main \
    git@github.com:u-brite/Single-cell-reciter.git
```

### Requirements

*OS:*

Tested on:

|||
|--|--|
|Description:    |:tophat: Red Hat Enterprise Linux Server release 7.9 (Maipo)|
|Release:        |7.9|
|Codename:       |Maipo|

*Tools:*

- Anaconda3
    - Tested with version: conda 4.11.0
- Cellranger 
  - cellranger-5.0.1
- bamtofastq v1.3.5

### Create and activate :snake: conda environment
:exclamation: _Optional: Depends on project._ :exclamation:

Change in to root directory and run the commands below:

```sh
# create conda environment. Needed only the first time.
conda env create -f Hackin_Omics.yml

# if you need to update existing environment
conda env update --file Hackin_Omics.yml

# activate conda environment
conda activate Hackin_Omics
```

### Steps to run

#### Step 1

```sh
python src/data_prep.py -i path/to/file.tsv -O path/to/output_directory
```

#### Step 2

```sh
python src/model.py -i path/to/parsed_file.tsv -O path/to/output_directory
```

Output from this step includes -

```directory
Results/
|-- Rank_by_topic.csv
|-- SCC.h5ad

```

**Note**: The is an example note with a [link](https://github.com/u-brite/team-repo-template).


## Results
:exclamation: _If your project yielded or intends to yield some novel analysis, please include them in your readme. It can be named something other than results as well._ :exclamation:

## Team Members

| Name      | Email | Role     |
| :---        |    :----:   |          :---: |
:wave: Nilesh Kumar | tmamidi@uab.edu | Team Leader  
:raised_back_of_hand: Virginie Grosboillot | virginie.grosboillot@alumni.ethz.ch | Team Member
:raised_hand: Hammad Ali Hassan | hammadali50@live.com | Team Member
:vulcan_salute: Jacky Siu Pui Chung | puichung.siu@gmail.com | Team Member