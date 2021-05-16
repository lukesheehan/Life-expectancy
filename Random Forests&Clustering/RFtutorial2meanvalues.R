# Return the column names containing missing observations
#https://www.guru99.com/r-replace-missing-values.html
list_na <- colnames(merge1)[ apply(merge1, 2, anyNA) ]
list_na

colnames(merge1)[apply(merge1, 2, anyNA)]


##calculate mean of missinf values

average_missing <- apply(merge1[,colnames(merge1) %in% list_na],
                         2,
                         mean,
                         na.rm =  TRUE)
average_missing

##replace values with mean

# Create a new variable with the mean and median
df_merge1_replace <- merge1 %>%
  mutate(replace_mean_hepatitis  = ifelse(is.na(Hepatitis.B), average_missing[1], Hepatitis.B),
         replace_mean_BMI = ifelse(is.na(BMI), average_missing[2], BMI),
         replace_mean_thinness119 = ifelse(is.na(thinness..1.19.years), average_missing[3], thinness..1.19.years),
         replace_mean_thinness59 = ifelse(is.na(thinness.5.9.years), average_missing[4], thinness.5.9.years))

####checking how many missing values there are
sum(is.na(df_merge1_replace$Hepatitis.B))
###swap hepaptitis b with whatever


##perform the replacement
sum(is.na(df_merge1_replace$replace_mean_hepatitis))
sum(is.na(df_merge1_replace$replace_mean_BMI))
sum(is.na(df_merge1_replace$replace_mean_thinness119))
sum(is.na(df_merge1_replace$replace_mean_thinness59))

####THEYRE AT THE END!!!!!

##replacing columns/removing them
df_merge1_replace[,-c(8,10,16,17)] -> df_merge1_replace


##renaming 
colnames(df_merge1_replace)
names(df_merge1_replace)[names(df_merge1_replace) == "replace_mean_hepatitis"] <- "Hepatitis.B"
names(df_merge1_replace)[names(df_merge1_replace) == "replace_mean_BMI"] <- "BMI"
names(df_merge1_replace)[names(df_merge1_replace) == "replace_mean_thinness119"] <- "Thinness.1-19.years"
names(df_merge1_replace)[names(df_merge1_replace) == "replace_mean_thinness59"] <- "Thinness.5-9.years"




write.csv(df_merge1_replace,'WHO2015.csv')