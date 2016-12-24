dopewild/bin/svm --splits 256 --stepinitial 0.1 --step_decay 0.9 --mu 1 --binary 1 data/RCV1.train.bin data/RCV1.test.tsv 

dopewild/bin/cfsvm --splits 256 --stepinitial 0.8 --step_decay 1 --mu 1 --binary 1 data/RCV1.train.bin data/RCV1.test.tsv 

dopewild/bin/cfsvm --epochs 512 --splits 64 --stepinitial 0.8 --step_decay 1 --mu 1 --binary 1 data/RCV1.train.bin data/RCV1.test.tsv

dopewild/bin/cfsvm --epochs 512 --splits 256 --stepinitial 1.6 --step_decay 1 --mu 1 --binary 1 data/RCV1.train.bin data/RCV1.test.tsv

dopewild/bin/svm --splits 64 --stepinitial 0.1 --step_decay 1 --mu 1 --binary 1 data/RCV1.train.bin data/RCV1.test.tsv 

dopewild/bin/svm --epochs 5 --splits 32 --stepinitial 0.1 --step_decay 1 --mu 1 data/Year.train.tsv data/Year.test.tsv