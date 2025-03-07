#Clear existing data and graphics
rm(list=ls())
graphics.off()
#Load Hmisc library
library(Hmisc)
library(data.table)
#Read Data
data=read.csv('~/git/phenocare/fibers/C1/originalFiles/LongitudinalSerie_DATA_2024-04-25_1752.csv')
#Setting Labels

label(data$record_id)="Record ID"
label(data$redcap_event_name)="Event Name"
label(data$redcap_repeat_instrument)="Repeat Instrument"
label(data$redcap_repeat_instance)="Repeat Instance"
label(data$redcap_survey_identifier)="Survey Identifier"
label(data$information_and_consent_timestamp)="Survey Timestamp"
label(data$registration_date)="Registration Date"
label(data$to_be_informed)="I wish to be informed of the publication of results and/or the progress of the study."
label(data$abnormal)="If abnormalities are found in routine analysis (choose one option). "
label(data$unused_specimens)="What is your preference for any un-used specimens (choose one option)"
label(data$inulin_choices___1)="I would like to participate in the food study (tick those that apply, and you may choose more than one) (choice=Jerusalem artichoke)"
label(data$inulin_choices___2)="I would like to participate in the food study (tick those that apply, and you may choose more than one) (choice=Globe artichoke)"
label(data$inulin_choices___3)="I would like to participate in the food study (tick those that apply, and you may choose more than one) (choice=Yacon)"
label(data$inulin_choices___4)="I would like to participate in the food study (tick those that apply, and you may choose more than one) (choice=Elephant garlic)"
label(data$inulin_choices___5)="I would like to participate in the food study (tick those that apply, and you may choose more than one) (choice=Apple)"
label(data$inulin_choices___6)="I would like to participate in the food study (tick those that apply, and you may choose more than one) (choice=Orange)"
label(data$inulin_choices___7)="I would like to participate in the food study (tick those that apply, and you may choose more than one) (choice=Tomato)"
label(data$inulin_choices___8)="I would like to participate in the food study (tick those that apply, and you may choose more than one) (choice=Watermelon)"
label(data$faecal_sample)="I would like to provide a stool sample as part of this study "
label(data$information_and_consent_complete)="Complete?"
label(data$demographic_timestamp)="Survey Timestamp"
label(data$gender)="Gender:"
label(data$dob)="Date of Birth:"
label(data$age)="Age:"
label(data$availability___1)="What is your availability for attending the clinic visit?  Please select all that apply. (choice=Tuesday)"
label(data$availability___2)="What is your availability for attending the clinic visit?  Please select all that apply. (choice=Thursday)"
label(data$availability___3)="What is your availability for attending the clinic visit?  Please select all that apply. (choice=Saturday)"
label(data$demographic_complete)="Complete?"
label(data$ht)="Height"
label(data$wt)="Weight"
label(data$bmi_2)="BMI"
label(data$bmi_complete)="Complete?"
label(data$sv_date)="Date"
label(data$sv_timepoint)="Screening Visit Time Point"
label(data$sv_h2bt)="Screening Visit H2BT Level"
label(data$screening_measures_complete)="Complete?"
label(data$food_date)="Date:"
label(data$d_food_non_standard)="Food consumed outside of standardize diet. Please describe and enter time."
label(data$d_medications)="Please list medications taken and time taken."
label(data$d_activity)="Please list physical activity and time."
label(data$test_food___1)="What is the test food undertaken?  (choice=Globe Artichoke)"
label(data$test_food___2)="What is the test food undertaken?  (choice=Jerusalem Artichoke)"
label(data$test_food___3)="What is the test food undertaken?  (choice=Elephant Garlic)"
label(data$test_food___4)="What is the test food undertaken?  (choice=Yacon)"
label(data$test_food___5)="What is the test food undertaken?  (choice=Apple)"
label(data$test_food___6)="What is the test food undertaken?  (choice=Orange)"
label(data$test_food___7)="What is the test food undertaken?  (choice=Tomato)"
label(data$test_food___8)="What is the test food undertaken?  (choice=Watermelon)"
label(data$test_food___9)="What is the test food undertaken?  (choice=Baseline diet only)"
label(data$test_food___10)="What is the test food undertaken?  (choice=Other)"
label(data$food_notconsumed)="Please indicate the amount of test food (in g) that was NOT consumed by the participant."
label(data$food_diary_complete)="Complete?"
label(data$cv_date)="Date"
label(data$time_hr)="Time Point"
label(data$h2bt_level)="H2BT Level"
label(data$urine_id)="Urine ID"
label(data$blood_id)="Blood ID"
label(data$feces_id)="Faeces ID"
label(data$clinic_measures_complete)="Complete?"
#Setting Units


#Setting Factors(will create new variable for factors)
data$redcap_event_name.factor = factor(data$redcap_event_name,levels=c("enrollment_arm_1","screening_visit_arm_1","clinic_visit_1_arm_1","clinic_visit_2_arm_1","clinic_visit_3_arm_1","clinic_visit_4_arm_1","clinic_visit_5_arm_1","clinic_visit_6_arm_1","clinic_visit_7_arm_1"))
data$redcap_repeat_instrument.factor = factor(data$redcap_repeat_instrument,levels=c("food_diary","clinic_measures","screening_measures"))
data$to_be_informed.factor = factor(data$to_be_informed,levels=c("0","1"))
data$abnormal.factor = factor(data$abnormal,levels=c("0","1"))
data$unused_specimens.factor = factor(data$unused_specimens,levels=c("0","1"))
data$inulin_choices___1.factor = factor(data$inulin_choices___1,levels=c("0","1"))
data$inulin_choices___2.factor = factor(data$inulin_choices___2,levels=c("0","1"))
data$inulin_choices___3.factor = factor(data$inulin_choices___3,levels=c("0","1"))
data$inulin_choices___4.factor = factor(data$inulin_choices___4,levels=c("0","1"))
data$inulin_choices___5.factor = factor(data$inulin_choices___5,levels=c("0","1"))
data$inulin_choices___6.factor = factor(data$inulin_choices___6,levels=c("0","1"))
data$inulin_choices___7.factor = factor(data$inulin_choices___7,levels=c("0","1"))
data$inulin_choices___8.factor = factor(data$inulin_choices___8,levels=c("0","1"))
data$faecal_sample.factor = factor(data$faecal_sample,levels=c("0","1"))
data$information_and_consent_complete.factor = factor(data$information_and_consent_complete,levels=c("0","1","2"))
data$gender.factor = factor(data$gender,levels=c("1","2","3"))
data$availability___1.factor = factor(data$availability___1,levels=c("0","1"))
data$availability___2.factor = factor(data$availability___2,levels=c("0","1"))
data$availability___3.factor = factor(data$availability___3,levels=c("0","1"))
data$demographic_complete.factor = factor(data$demographic_complete,levels=c("0","1","2"))
data$bmi_complete.factor = factor(data$bmi_complete,levels=c("0","1","2"))
data$sv_timepoint.factor = factor(data$sv_timepoint,levels=c("0","1","2","3","4","5","6","7","8"))
data$screening_measures_complete.factor = factor(data$screening_measures_complete,levels=c("0","1","2"))
data$test_food___1.factor = factor(data$test_food___1,levels=c("0","1"))
data$test_food___2.factor = factor(data$test_food___2,levels=c("0","1"))
data$test_food___3.factor = factor(data$test_food___3,levels=c("0","1"))
data$test_food___4.factor = factor(data$test_food___4,levels=c("0","1"))
data$test_food___5.factor = factor(data$test_food___5,levels=c("0","1"))
data$test_food___6.factor = factor(data$test_food___6,levels=c("0","1"))
data$test_food___7.factor = factor(data$test_food___7,levels=c("0","1"))
data$test_food___8.factor = factor(data$test_food___8,levels=c("0","1"))
data$test_food___9.factor = factor(data$test_food___9,levels=c("0","1"))
data$test_food___10.factor = factor(data$test_food___10,levels=c("0","1"))
data$food_diary_complete.factor = factor(data$food_diary_complete,levels=c("0","1","2"))
data$time_hr.factor = factor(data$time_hr,levels=c("0","1","2","3","4","5","6","7","8"))
data$clinic_measures_complete.factor = factor(data$clinic_measures_complete,levels=c("0","1","2"))

levels(data$redcap_event_name.factor)=c("Enrollment","Screening Visit","Clinic Visit 1","Clinic Visit 2","Clinic Visit 3","Clinic Visit 4","Clinic Visit 5","Clinic Visit 6","Clinic Visit 7")
levels(data$redcap_repeat_instrument.factor)=c("Food Diary","Clinic Measures","Screening Measures")
levels(data$to_be_informed.factor)=c("No","Yes")
levels(data$abnormal.factor)=c("Contact designated general practitioner","Do not contact general practitioner")
levels(data$unused_specimens.factor)=c("Should be discarded","Can be stored and used in future analysis")
levels(data$inulin_choices___1.factor)=c("Unchecked","Checked")
levels(data$inulin_choices___2.factor)=c("Unchecked","Checked")
levels(data$inulin_choices___3.factor)=c("Unchecked","Checked")
levels(data$inulin_choices___4.factor)=c("Unchecked","Checked")
levels(data$inulin_choices___5.factor)=c("Unchecked","Checked")
levels(data$inulin_choices___6.factor)=c("Unchecked","Checked")
levels(data$inulin_choices___7.factor)=c("Unchecked","Checked")
levels(data$inulin_choices___8.factor)=c("Unchecked","Checked")
levels(data$faecal_sample.factor)=c("No","Yes")
levels(data$information_and_consent_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$gender.factor)=c("Male","Female","Other")
levels(data$availability___1.factor)=c("Unchecked","Checked")
levels(data$availability___2.factor)=c("Unchecked","Checked")
levels(data$availability___3.factor)=c("Unchecked","Checked")
levels(data$demographic_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$bmi_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$sv_timepoint.factor)=c("T0","T1","T2","T3","T4","T5","T6","T7","T8")
levels(data$screening_measures_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$test_food___1.factor)=c("Unchecked","Checked")
levels(data$test_food___2.factor)=c("Unchecked","Checked")
levels(data$test_food___3.factor)=c("Unchecked","Checked")
levels(data$test_food___4.factor)=c("Unchecked","Checked")
levels(data$test_food___5.factor)=c("Unchecked","Checked")
levels(data$test_food___6.factor)=c("Unchecked","Checked")
levels(data$test_food___7.factor)=c("Unchecked","Checked")
levels(data$test_food___8.factor)=c("Unchecked","Checked")
levels(data$test_food___9.factor)=c("Unchecked","Checked")
levels(data$test_food___10.factor)=c("Unchecked","Checked")
levels(data$food_diary_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$time_hr.factor)=c("T0","T1","T2","T3","T4","T5","T6","T7","T8")
levels(data$clinic_measures_complete.factor)=c("Incomplete","Unverified","Complete")


# here we coalesce the foodType in a single column (not necessary, skip to line 188)
foodType <- data.frame(ga = as.character(factor(data$test_food___1.factor, labels = c(NA, "globe artichoke"))),
                       ja = as.character(factor(data$test_food___2.factor, labels = c(NA, "jerusalem artichoke"))),
                       eg = as.character(factor(data$test_food___3.factor, labels = c(NA, "elephant garlic"))),
                       ya = as.character(factor(data$test_food___4.factor, labels = c(NA, "yacon"))),
                       ap = as.character(factor(data$test_food___5.factor, labels = c(NA, "apple"))), #11
                       or = as.character(factor(data$test_food___6.factor, labels = c(NA, "orange"))),
                       to = as.character(factor(data$test_food___7.factor, labels = c(NA, "tomato"))),
                       wa = as.character(factor(data$test_food___8.factor, labels = c(NA, "watermelon"))), #11
                       ba = as.character(factor(data$test_food___9.factor, labels = c(NA, "baseline"))))

foodTypes = dplyr::coalesce(
  foodType$ga, foodType$ja, foodType$eg, foodType$ya, foodType$ap, foodType$or, foodType$to, foodType$wa, foodType$ba
)


# here we check that we captured it all correct
t<-data.table(recordId=data$record_id,
              foodType = foodTypes,
              sampleLabel = data$urine_id,
              sampleMatrixType = "URI")

table(t$foodType) # correct
table(t$sampleMatrixType)


# t<-data.table(recordId=data$record_id,
#               foodType = factor(data$test_food___5.factor, labels = c("unchecked", "apple")),
#               sampleLabel=data$urine_id)

# because previous code for coalescence did not work we used an sql strategy
types <- c("Globe Artichoke",
           "Jerusalem Artichoke",
           "Elephant Garlic",
           "Yacon",
           "Apple",
           "Orange",
           "Tomato",
           "Watermelon",
           "Baseline diet only")

listOf <- list()
for (type in 1:length(types)) {
  column <- paste0("test_food___", type,".factor")
  ids <- which(data[column] == "Checked")
  visit <- data.frame(recordId = data$record_id[ids],
                     visit = data$redcap_event_name.factor[ids],
                     type = types[type])
  visit$uuid <- paste0(visit$recordId, visit$visit)
  listOf[[type]] <- visit
}
tableOf <- data.table(do.call("rbind", listOf))
sel <- c("type", "uuid")
tableOf <- tableOf[,..sel]

### There are lot of typos and missing data table(redcap)
SDL<-read.csv("~/git/phenocare/fibers/C1/sampleDescriptionAll.csv")
SDL<-SDL%>%select(sampleID:sampleMatrixType,tubeLabel:sampleTimePoint)%>%
  mutate(key = gsub("-","_",gsub("FIB-","FIB",toupper(tubeLabel))))

SDL_URI<-SDL%>%filter(sampleMatrixType=="URI")
SDL_PLA<-SDL%>%filter(sampleMatrixType=="PLA")
SDL_FAE<-SDL%>%filter(sampleMatrixType=="FAE")
SDL_FAE$key<-gsub("_1","",SDL_FAE$key)
SDL_FAE$key<-gsub("_2","",SDL_FAE$key)

SDL_URI$key[-which(SDL_URI$key %in% data$urine_id)]
SDL_PLA$key[-which(SDL_PLA$key %in% data$blood_id)]
SDL_FAE$key[-which(SDL_FAE$key %in% data$feces_id)]

## Fixing typo on urine_id, blood_id, feces_id
# FIB123_U3_T8 and FIB123_B3_T8 (they bve duplicated T6 but in different time_hr....)
idx<-which(data$urine_id=="FIB123_U3_T6" & data$time_hr=="8")
data$urine_id[idx]<-"FIB123_U3_T8"
data$blood_id[idx]<-"FIB123_B3_T8"
rm(idx)
# "FIB123_U4_" many of the tubeLabels are wrong 
idx<-grep("FIB123_U4_",data$urine_id)
data$urine_id[idx]<-paste0("FIB123_U4_T",data$time_hr[idx])
data$blood_id[idx]<-paste0("FIB123_B4_T",data$time_hr[idx])


# FIB202_UX_T8 is missign in the data # add them with H2bt levels of 5
idx<-grep("FIB202_UX_T6",data$urine_id)
sub<-data[idx,]
sub$urine_id<-gsub("T6","T8",sub$urine_id)
sub$time_hr<-8
sub$h2bt_level<-5
sub$time_hr.factor<-"T8"
data<-rbind(data,sub)

# FIB239 is actuall FIB329 change the SDL
idx<-grep("FIB239",SDL$key)
SDL$key[idx]<-"FIB329_U1_T2"
rm(idx)

# FIB426 U4 is actually U1 change the SDL
## data has a wrong urine_id fix that first
idx<-grep("FIB426_U1",data$urine_id)
data$urine_id[idx]<-paste0("FIB426_U1_T",data$time_hr[idx])
rm(idx)
idx<-grep("FIB426_U4",SDL$key)
SDL$key[idx]<-gsub("U4","U1",SDL$key[idx])
rm(idx)

# FIB427 U4 is actually FIB256 change the SDL
idx<-grep("FIB247",SDL$key)
SDL$key[idx]<-gsub("247","256",SDL$key[idx])
rm(idx)

# FIB621 U5 is actually U1 change the SDL
idx<-grep("FIB621_U5",SDL$key)
SDL$key[idx]<-gsub("FIB621_U5","FIB621_U1",SDL$key[idx])
rm(idx)

# FIB623 U3 is actually U1 change the SDL
## FIB623_U1_T7 for blood is actually FIB623_U1_T6 (same for one of the duplicated B1_T7)
idx<-grep("FIB623_U3",SDL$key)
SDL$key[idx]<-gsub("FIB623_U3","FIB623_U1",SDL$key[idx])
rm(idx)
idx<-which(data$urine_id=="FIB623_U1_T7")
data$urine_id[idx]<-"FIB623_U1_T6"
data$blood_id[idx]<-"FIB623_B1_T6"
rm(idx)

# FIB256_B3_T2
idx<-which(data$blood_id=="FIB256_B3_T3" & data$time_hr=="2")
data$blood_id[idx]<-"FIB256_B3_T2"
rm(idx)

# FIB623_B1_T6
idx<-which(data$blood_id=="FIB659_B1_T2" & data$time_hr=="1")
data$blood_id[idx]<-"FIB659_B1_T1"
rm(idx)

# FIB112_FX_T0
idx<-which(data$cv_date=="5/4/2024" & data$record_id=="FIB112" & data$time_hr=="0")
data$feces_id[idx]<-"FIB112_FX_T0"
rm(idx)

#"FIB117_F1_T1"
idx<-which(data$blood_id=="FIB117_B1_T1")
data$feces_id[idx]<-"FIB117_F1_T1"
rm(idx)
#"FIB123_F1_T1" 
idx<-which(data$blood_id=="FIB123_B1_T1")
data$feces_id[idx]<-"FIB123_F1_T1"
rm(idx)

#"FIB150_F1_T1"
idx<-which(data$blood_id=="FIB150_B1_T1")
data$feces_id[idx]<-"FIB150_F1_T1"
rm(idx)

#"FIB202_F1_T1" 
idx<-which(data$blood_id=="FIB202_B1_T1")
data$feces_id[idx]<-"FIB202_F1_T1"
rm(idx)

#"FIB212_F1_T1" 
idx<-which(data$blood_id=="FIB202_B1_T1")
data$feces_id[idx]<-"FIB202_F1_T1"
rm(idx)

#"FIB220_F1_T1" 
idx<-which(data$blood_id=="FIB220_B1_T1")
data$feces_id[idx]<-"FIB220_F1_T1"
rm(idx)

#"FIB256_F1_T1"
idx<-which(data$blood_id=="FIB256_B1_T1")
data$feces_id[idx]<-"FIB256_F1_T1"
rm(idx)

#"FIB274_F1_T1"
idx<-which(data$blood_id=="FIB274_B1_T1")
data$feces_id[idx]<-"FIB274_F1_T1"
rm(idx)

#"FIB284_F1_T1" (2 aliquots??)
idx<-which(data$blood_id=="FIB284_B1_T1")
data$feces_id[idx]<-"FIB284_F1_T1"
rm(idx)

#"FIB297_F1_T1"
idx<-which(data$blood_id=="FIB297_B1_T1")
data$feces_id[idx]<-"FIB297_F1_T1"
rm(idx)

#"FIB329_F1_T1" 
idx<-which(data$blood_id=="FIB329_B1_T1")
data$feces_id[idx]<-"FIB329_F1_T1"
rm(idx)

#"FIB380_F1_T1" 
idx<-which(data$blood_id=="FIB380_B1_T1")
data$feces_id[idx]<-"FIB380_F1_T1"
rm(idx)

#"FIB420_F1_T1" 
idx<-which(data$blood_id=="FIB420_B1_T1")
data$feces_id[idx]<-"FIB420_F1_T1"
rm(idx)

#"FIB439_F1_T1"
idx<-which(data$blood_id=="FIB439_B1_T1")
data$feces_id[idx]<-"FIB439_F1_T1"
rm(idx)

#"FIB439_F3_T1" 
idx<-which(data$blood_id=="FIB439_B3_T1")
data$feces_id[idx]<-"FIB439_F3_T1"
rm(idx)

#"FIB455_F1_T1"
idx<-which(data$blood_id=="FIB455_B1_T1")
data$feces_id[idx]<-"FIB455_F1_T1"
rm(idx)

# we find rows with valid tubeLabels (one row can have multiple tubes)
idx <- grepl("FIB", data$urine_id) | grepl("FIB", data$blood_id) | grepl("FIB", data$feces_id)

t<-data.table(recordId = data$record_id[idx],
              visit = data$redcap_event_name.factor[idx],
              timePoint = data$time_hr.factor[idx],
              bloodId = data$blood_id[idx],
              urineId = data$urine_id[idx],
              fecesId = data$feces_id[idx])
t$uuid <- paste0(t$recordId, t$visit)


tt <- merge(t, tableOf, all.x = TRUE, by = "uuid")
tt <- tt[grepl("FIB", tt$recordId), c(-1)]
tt$typeId <- gsub("Clinic Visit ", "V", tt$visit)

tt$sampleTimePoint <- nmr.parser::cleanNames(paste0(tt$timePoint, "-", tt$typeId))
tt$key <- nmr.parser::cleanNames(paste0(tt$recordId, tt$sampleTimePoint))


################################################################################
### adding metadata
################################################################################

bmi <- data[!is.na(data$bmi_2),]
sel <- c("record_id", "bmi_2")
bmi <- bmi[,sel]
colnames(bmi) <- c("record_id", "bmi")
tt <-merge(tt, bmi, all.x = TRUE, by.x = "recordId", by.y = "record_id")

age <- data[!is.na(data$age),]
sel <- c("record_id", "age")
age <- age[,sel]
tt <-merge(tt, age, all.x = TRUE, by.x = "recordId", by.y = "record_id")

sex <- data[!is.na(data$gender.factor),]
sel <- c("record_id", "gender.factor")
sex <- sex[,sel]
colnames(sex) <- c("record_id", "sex")
tt <-merge(tt, sex, all.x = TRUE, by.x = "recordId", by.y = "record_id")
rm(bmi,age,sex,sel)
################################################################################
### ADD MORE METADADA HERE...
################################################################################
library(lubridate)

tdf <- data[!nchar(data$dob)==0,]
sel <- c("record_id", "dob")
tdf <- tdf[,sel]
colnames(tdf) <- c("record_id", "DOB")
tdf$DOB<-as.character(dmy(tdf$DOB))
tt <-merge(tt, tdf, all.x = TRUE, by.x = "recordId", by.y = "record_id")
rm(tdf)
  
tdf <- data[!is.na(data$ht),]
sel <- c("record_id", "ht")
tdf <- tdf[,sel]
colnames(tdf) <- c("record_id", "height")
tt <-merge(tt, tdf, all.x = TRUE, by.x = "recordId", by.y = "record_id")
rm(tdf)
 
tdf <- data[!is.na(data$wt),]
sel <- c("record_id", "wt")
tdf <- tdf[,sel]
colnames(tdf) <- c("record_id", "Weight")
tt <-merge(tt, tdf, all.x = TRUE, by.x = "recordId", by.y = "record_id")
rm(tdf)

tdf <- data[!nchar(data$sv_date)==0,]
sel <- c("record_id","sv_timepoint" ,"sv_date")
tdf <- tdf[,sel]
tdf<-tdf[match(paste0(tt$recordId,tt$timePoint),paste0(tdf$record_id,"T",tdf$sv_timepoint)),]
tt$`Screen Visit Date`<-as.character(dmy(tdf$sv_date))
rm(tdf)

tdf <- data[!is.na(data$sv_h2bt),]
sel <- c("record_id","sv_timepoint" ,"sv_h2bt")
tdf <- tdf[,sel]
tdf<-tdf[match(paste0(tt$recordId,tt$timePoint),paste0(tdf$record_id,"T",tdf$sv_timepoint)),]
tt$`Screen Visit H2BT`<-tdf$sv_h2bt
rm(tdf)

tdf <- data[!nchar(data$food_date)==0,]
sel <- c("record_id","redcap_event_name" ,"food_date")
tdf <- tdf[,sel]
tdf$redcap_event_name<-paste0("V",
                              sapply(strsplit(tdf$redcap_event_name,"_"),"[",3))
tdf<-tdf[match(paste0(tt$recordId,tt$typeId),paste0(tdf$record_id,tdf$redcap_event_name)),]
tt$`food date`<-as.character(dmy(tdf$food_date))
rm(tdf)

tdf <- data[!nchar(data$cv_date)==0,]
sel <- c("record_id","redcap_event_name" ,"cv_date")
tdf <- tdf[,sel]
tdf$redcap_event_name<-paste0("V",
                              sapply(strsplit(tdf$redcap_event_name,"_"),"[",3))
tdf<-tdf[match(paste0(tt$recordId,tt$typeId),paste0(tdf$record_id,tdf$redcap_event_name)),]
tt$`Clinic Visit Date`<-as.character(dmy(tdf$cv_date))
rm(tdf)
  
tdf <- data[!nchar(data$h2bt_level)==0,]
sel <- c("blood_id" ,"h2bt_level")
tdf <- tdf[match(tt$bloodId,tdf$blood_id),sel]
tt$`Clinic Visit H2BT`<-tdf$h2bt_level


tdf <- data[!nchar(data$d_food_non_standard)==0,]
sel <- c("record_id","redcap_event_name" ,"d_food_non_standard")
tdf <- tdf[,sel]
tdf$redcap_event_name<-paste0("V",
                              sapply(strsplit(tdf$redcap_event_name,"_"),"[",3))
tdf<-tdf[match(paste0(tt$recordId,tt$typeId),paste0(tdf$record_id,tdf$redcap_event_name)),]
tt$`Non standard Food`<-tdf$d_food_non_standard
rm(tdf)

tdf <- data[!nchar(data$d_medications)==0,]
sel <- c("record_id","redcap_event_name" ,"d_medications")
tdf <- tdf[,sel]
tdf$redcap_event_name<-paste0("V",
                              sapply(strsplit(tdf$redcap_event_name,"_"),"[",3))
tdf<-tdf[match(paste0(tt$recordId,tt$typeId),paste0(tdf$record_id,tdf$redcap_event_name)),]
tt$`Medication`<-tdf$d_medications
rm(tdf) 

tdf <- data[!nchar(data$d_activity)==0,]
sel <- c("record_id","redcap_event_name" ,"d_activity")
tdf <- tdf[,sel]
tdf$redcap_event_name<-paste0("V",
                              sapply(strsplit(tdf$redcap_event_name,"_"),"[",3))
tdf<-tdf[match(paste0(tt$recordId,tt$typeId),paste0(tdf$record_id,tdf$redcap_event_name)),]
tt$`Activity`<-tdf$d_activity
rm(tdf) 

################################################################################
### End of Metadata cleaning. --> Expand and add sampleID --> daE
################################################################################

library(tidyr)
label(tt$bloodId) = NA
label(tt$urineId) = NA
label(tt$fecesId) = NA
test<-tt%>%
  pivot_longer(cols = bloodId:fecesId,names_to = "sampleMatrixType",values_to ="tubeLabels" )%>%
  mutate(sampleMatrixType = ifelse(sampleMatrixType=="bloodId","PLA","URI"),
         sampleMatrixType = ifelse(substr(tubeLabels,8,8)=="F","FAE",sampleMatrixType))%>%
  filter(!nchar(tubeLabels)==0)%>%
  mutate(tubeLabels = tolower(gsub("_","-",tubeLabels)))

library(dplyr)

SDL$tubeLabel<-tolower(gsub("_","-",SDL$key))
SDL$tubeLabel<-substr(SDL$tubeLabel,1,12)
SDL_red<-SDL[which(SDL$tubeLabel %in% test$tubeLabels),]
test_red<-test[which(test$tubeLabels %in% SDL_red$tubeLabel),]
test_red<-test_red[match(SDL_red$tubeLabel,test_red$tubeLabels),]
SDL_red$sampleTimePoint<-paste0(substr(SDL_red$tubeLabel,11,12),"-",substr(SDL_red$tubeLabel,8,9))

Ann<-cbind(SDL_red%>%select(-key),test_red%>%select(visit:Activity))
# sdl_uri<-read.table("sampleDescriptionListUri.ignore.tsv",header = T)
# sid <- read.table("updateLayoutForm_FIBb01-27-06-2024.csv", header = TRUE, sep = ",")
# sid<-sid%>%select(sampleID,tubeLabel)%>%
#   mutate(projectName = "fibers",
#          cohortName = "C1",
#          sampleMatrixType = "PLA",
#          sourceID = sapply(strsplit(tubeLabel,"-"),"[",1),
#          sampleTimePoint = paste0(sapply(strsplit(tubeLabel,"-"),"[",3),"-",sapply(strsplit(tubeLabel,"-"),"[",2)))
# sdl_uri<-sdl_uri%>%select(sampleID:cohortName,sampleMatrixType,tubeLabel:sampleTimePoint)
# 
# SDL<-rbind(sdl_uri,sid)
# rm(sdl_uri,sid)
# 
# ANN<-cbind(SDL[match(test$tubeLabels,gsub("fib-","fib",SDL$tubeLabel)),],test%>%select(visit:Activity))
# 
library(fusion)
Ann$sampleID<-makeUnique(Ann$sampleID,sep = "#")
# 
da <- new("dataElement",
          .Data = NA_character_,
          obsDescr = list(Ann),
          varName = NA_character_,
          type = "ANN",
          method = NA_character_,
          version = paste0(c(paste("daE: 1.0; rldx:", utils::packageVersion("rldx")),
                             paste("nmr.parser:", utils::packageVersion("nmr.parser")),
                             paste("fusion:", utils::packageVersion("fusion"))),
                           collapse = "; "))

check(da)
# save(da,file = "~/OneDrive - Murdoch University/datasets/fibers/C1/dataElements/fibers_C1_ANN.daE")
rm(da,ANN,SDL,test,tt,t)

################################################################################
### End of Annotation daE making 
################################################################################



## here we got all valid samples with information

# here we merge with existing list of samples as corrected by RLL
# we cannot use this anymore as 3 additional samples where added
# s <- read.table("sampleDescriptionListUri.ignore.tsv", header = TRUE, sep = "\t")
# therefore we use this ...
s <- dbGetQuery(con, "select * from samples where projectName = 'fibers' and sampleMatrixType = 'URI'")
s$key <- paste0(s$sourceID, s$sampleTimePoint)
s$key <- gsub("-u", "-v", s$key)
st <- merge(s, tt, all.x = TRUE, by = "key")
st <- st[,c(c(2,9),c(19:29))]
# we got 434 rows
write.table(st, file = "RC_dump_URI.csv", sep = ",", row.names = FALSE, quote = TRUE)

# we do the same for serum
s <- dbGetQuery(con, "select * from samples where projectName = 'fibers' and sampleMatrixType = 'PLA'")
s$key <- paste0(s$sourceID, s$sampleTimePoint)
s$key <- gsub("-b", "-v", s$key)
st <- merge(s, tt, all.x = TRUE, by = "key")
st <- st[,c(c(2,9),c(19:29))]
# we got 748 rows

write.table(st, file = "RC_dump_PLA.csv", sep = ",", row.names = FALSE, quote = TRUE)






# q <- read.table("Fiber_Urine_Quants_Crea-Hip-PAG.csv", header = TRUE, sep = ",")
# qst <- merge(q, st, all.x = TRUE, by = "sampleID")
# write.table(qst, file = "quant.csv", sep = ",", row.names = FALSE, quote = TRUE)
