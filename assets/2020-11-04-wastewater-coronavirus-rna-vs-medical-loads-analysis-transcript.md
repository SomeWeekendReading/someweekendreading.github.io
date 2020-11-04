---
layout: post
title: Transcript for &quot;Wastewater coronavirus RNA vs medical loads&quot;
tags: COVID MathInTheNews R
date: 2020-11-04
comments: false
---

Here's the transcript of running the analysis:  
```
* MWRA COVID Analysis on Wed Nov 04 14:21:50 2020
  - input data directory: ./data
  - results directory:    ./results
  - transcript to:        ./results/mwra-covid-transcript.txt

Archival:
---------

* Archived analysis script(s) to ./results:
  - ./mwra-covid.r

Loading datasets and constructing joint dataset:
------------------------------------------------

* Reading MWRA wastewater RNA data from ./data/MWRAData20201027-NSdata.tsv
  - Structure:
    o 162 rows
    o 3 columns: Date, South.7, North.7
* Reading Mass COVID data from ./data/massachusetts-history.csv
  - Structure:
    o 286 rows
    o 3 columns: Date, deadIncr.7, hospIncr.7
* Constructing inner join on dates
  - Complete cases only, to drop the initial 6 rows w/o 7 day trailing means
  - Saved to ./results/mwra-covid-joint-data.tsv
  - Structure:
    o 156 rows
    o 6 columns: Date, North.7, South.7, RNA.7, hospIncr.7, deadIncr.7

Exploratory plots:
------------------

* Plot of north vs south RNA to ./results/plot-north-south.png
* Plot of medical loads vs RNA to ./results/plot-med-loads-vs-RNA.png
* Correlations, using all data:
           North.7 South.7 RNA.7 hospIncr.7 deadIncr.7
North.7       1.00    0.91  0.98       0.66       0.62
South.7       0.91    1.00  0.97       0.60       0.54
RNA.7         0.98    0.97  1.00       0.65       0.59
hospIncr.7    0.66    0.60  0.65       1.00       0.87
deadIncr.7    0.62    0.54  0.59       0.87       1.00

* Correlations, first wave data:
           North.7 South.7 RNA.7 hospIncr.7 deadIncr.7
North.7       1.00    0.95  0.99       0.74       0.67
South.7       0.95    1.00  0.98       0.78       0.68
RNA.7         0.99    0.98  1.00       0.77       0.68
hospIncr.7    0.74    0.78  0.77       1.00       0.81
deadIncr.7    0.67    0.68  0.68       0.81       1.00

* Correlations, second wave data:
           North.7 South.7 RNA.7 hospIncr.7 deadIncr.7
North.7       1.00    0.92  0.97      -0.04       0.06
South.7       0.92    1.00  0.99       0.19       0.18
RNA.7         0.97    0.99  1.00       0.10       0.14
hospIncr.7   -0.04    0.19  0.10       1.00       0.71
deadIncr.7    0.06    0.18  0.14       0.71       1.00


* MWRA COVID Analysis completed Wed Nov 04 14:21:50 2020 (0.4 sec elapsed).
```
