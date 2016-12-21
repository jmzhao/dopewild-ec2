bin/svm --splits 64 --stepinitial 0.1 --step_decay 0.9 --mu 1 --binary 1 data/RCV1.train.bin data/RCV1.test.tsv 

bin/cfsvm --splits 64 --stepinitial 6.4 --step_decay 0.998 --mu 1 --binary 1 data/RCV1.train.bin data/RCV1.test.tsv 

bin/svm --splits 256 --stepinitial 0.1 --step_decay 0.9 --mu 1 --binary 1 data/RCV1.train.bin data/RCV1.test.tsv 

bin/cfsvm --splits 256 --stepinitial 6.4 --step_decay 0.6 --mu 1 --binary 1 data/RCV1.train.bin data/RCV1.test.tsv 

bin/cfsvm --splits 64 --stepinitial 6.4 --step_decay 0.998 --mu 1 YearPredictionMSD.tsv YearPredictionMSD.tsv