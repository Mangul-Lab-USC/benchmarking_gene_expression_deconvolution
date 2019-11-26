ls ../4NormPredictions/NormedPredictions/*_CellMix* > FileLists/CellMix.txt
ls ../4NormPredictions/NormedPredictions/*_PBMC1* > FileLists/PBMC1.txt
ls ../4NormPredictions/NormedPredictions/*_PBMC2* > FileLists/PBMC2.txt
ls ../4NormPredictions/NormedPredictions/*_Stromal* > FileLists/Stromal.txt
ls ../4NormPredictions/NormedPredictions/*_Fram* > FileLists/Fram.txt

python A_Unroll.py FileLists/CellMix.txt ../TrueProportions/TruePropsCellMix.tsv > Unrolled_Normed_CellMix.tsv
python A_Unroll.py FileLists/PBMC1.txt ../TrueProportions/TruePropsPBMC1.tsv > Unrolled_Normed_PBMC1.tsv
python A_Unroll.py FileLists/PBMC2.txt ../TrueProportions/TruePropsPBMC2.tsv > Unrolled_Normed_PBMC2.tsv
python A_Unroll.py FileLists/Stromal.txt ../TrueProportions/TruePropsStromal.tsv > Unrolled_Normed_Stromal.tsv
python A_Unroll.py FileLists/Fram.txt ../TrueProportions/TruePropsFram.tsv > Unrolled_Normed_Fram.tsv
