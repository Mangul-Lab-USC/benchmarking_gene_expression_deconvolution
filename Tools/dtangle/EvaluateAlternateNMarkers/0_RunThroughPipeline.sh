#after copying results files to 1PoolPredictions/PooledPredictions/

rm 2ReformatPredictions/ReformattedPredictions/*

cd 2ReformatPredictions/
./1_GenCommands.sh > 2_Commands.sh
./2_Commands.sh

cd ../3Unroll/
./0_UnrollAll.sh
Rscript 2_MakeCorrelationTables_WithGraphs.R
