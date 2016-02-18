require("XML")
require("plyr")
require("ggplot2")

setwd("C:/Users/Eugene Mah/Documents/workspace/NXDoseMonitoring")
xmldata <- xmlParse("RT01NX01/DOSE_RT01NX01_20160121.xml")

AgeGroup=xmlToDataFrame(colClasses = c("character"),getNodeSet(xmldata,"//AgeGroup"))
ExamGroup=xmlToDataFrame(colClasses=c("character"),getNodeSet(xmldata,"//ExamGroup"))
ExposureType=xmlToDataFrame(colClasses=c("character"),getNodeSet(xmldata,"//ExposureType"))
BodyPart=xmlToDataFrame(colClasses = c("character"),getNodeSet(xmldata,"//BodyPart"))
EI=xmlToDataFrame(colClasses=c("numeric"),getNodeSet(xmldata,"//EI"))
DI=xmlToDataFrame(colClasses=c("numeric"),getNodeSet(xmldata,"//DI"))
TEI=xmlToDataFrame(colClasses=c("numeric"),getNodeSet(xmldata,"//TEI"))

DoseData <- data.frame(AgeGroup,ExamGroup,ExposureType,BodyPart,EI,DI,TEI)
DoseData <- rename(DoseData,c(text="AgeGroup",text.1="ExamGroup",text.2="ExposureType",text.3="BodyPart",text.4="EI",text.5="DI",text.6="TEI"))

mean_BodyPart_EI <- aggregate(DoseData$EI,by=list(DoseData$BodyPart),FUN=mean)
mean_AgeGroup_EI <- aggregate(DoseData$EI,by=list(DoseData$AgeGroup),FUN=mean)
mean_ExamGroup_EI <- aggregate(DoseData$EI,by=list(DoseData$ExamGroup),FUN=mean)