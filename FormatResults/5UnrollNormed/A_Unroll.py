from sys import *


def ParseFileName(fname):
  corefname = fname.split("/")[-1].split(".")[0]
  parts = corefname.strip().split("_")
  return parts

def main():
  flist = []
  SampleDict = {}
  for line in open(argv[1],"r"):
   flist.append(line.strip())
  print "\t".join(["Tool","Reference","SampleName", "CellType","Prediction", "Answer", "Error", "SqError"])
  partsList = []
  for line in open(argv[2],"r"):
     partsList.append(line.strip().split("\t"))

  CellTypes = partsList[0][1:]
  AnswersD = {}
  for parts in partsList[1:]:
     Sample = parts[0]
     SampleDict[Sample] = 0
     for i in range(1,len(parts)):
       CellType = CellTypes[i-1]  # -1 is a recent change that I may want to verify
       Answer = parts[i]
       AnswersD[Sample.lower() + "-" + CellType] = Answer

  for fname in flist:
     fstream = open(fname,"r")
     Tool = fname.split("_")[0].split("/")[-1]
     reference = fname.split("_")[2]
     LineList = []
     First = True
     for line in fstream:
       if First:
           First = False
           continue
       parts = line.strip().split("\t")
       LineList.append(line.strip().split("\t"))
     for parts in LineList:
       Sample = parts[0]
       if Sample not in SampleDict:
           continue
       for i in range(1,len(parts)):
         CellType = CellTypes[i-1]
         TrueProp = AnswersD[Sample.lower() + "-" + CellType]
         Error = abs(float(TrueProp)-float(parts[i]))
         SqError = Error*Error
         print "\t".join([Tool, reference, Sample ,CellType,parts[i], TrueProp, str(Error), str(SqError)])
main()