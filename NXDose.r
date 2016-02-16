require("XML")
require("plyr")
require("ggplot2")

setwd("C:/Users/Eugene Mah/Documents/workspace/NXDoseMonitoring")
xmldata <- xmlParse("RT01NX01/DOSE_RT01NX01_20160121.xml")
DoseData <- xmlToDataFrame(nodes=getNodeSet(xmldata,"//DoseStatistic"))[c("AgeGroup","ExamGroup","ExposureType","BodyPart","EI","DI")]

DoseStat = ldply(xmlToList("RT01NX01/DOSE_RT01NX01_20160121.xml"),data.frame)
