## Code Book: Getting and Cleaning Data Peer Graded Programming Assignment
## Aron O'Connor
## Aug. 14, 2016

### Background

The data used in this exercise comes from work done by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto
at Università degli Studi di Genova.  Below is a description of the data set provided by the original curators of the data:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed 
six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) 
on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity 
at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly 
partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data."

"The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding 
windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, 
was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low 
frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by 
calculating variables from the time and frequency domain."

### Description of the Data
I combined and manipulated the original data sets in order to form two sets if tidy data that are hopfully easier to work with. The first data 
set "combined_smartphone_data.txt" includes all the data features that include mean and standard deviation values as well as variables for the 
activity performed, the test subject, and whether the data was part of the 'test' or the 'train' data set.  The second data set 
"average_smartphone_data.txt" includes the average of each variable for each activity and each subject.

### Variables
Below is a list of the terms within the set of variables.  These terms help identify what data each variable contains:
- time: time domain signals
- frequency: frequency domain signals
- body: indicates bodily movement
- accelerometer: values were obtained from gyroscopic measurements
- gyroscope: values were obtained from accelerometer measurements
- x,y,z: direction of the accelerometer or gyroscopic data obtained
- jerk: rate of change of acceleration
- magnitude: magnitude of the signal
- mean: average value
- std: standard deviation
- subject: indicates the person who was performing the activity when the data was recorded (person is indicated by a number)
- activity: indicates the activity that was being performed when the data was recorded
- test/train: indicates which category the data falls under (the test data set or the train data set)


Below is a list of all variables within the data set:
 [1] "time_body_accelerometer-mean()-x"                            
 [2] "time_body_accelerometer-mean()-y"                            
 [3] "time_body_accelerometer-mean()-z"                            
 [4] "time_body_accelerometer-std()-x"                             
 [5] "time_body_accelerometer-std()-y"                             
 [6] "time_body_accelerometer-std()-z"                             
 [7] "time_gravity_accelerometer-mean()-x"                         
 [8] "time_gravity_accelerometer-mean()-y"                         
 [9] "time_gravity_accelerometer-mean()-z"                         
[10] "time_gravity_accelerometer-std()-x"                          
[11] "time_gravity_accelerometer-std()-y"                          
[12] "time_gravity_accelerometer-std()-z"                          
[13] "time_body_accelerometer_jerk-mean()-x"                       
[14] "time_body_accelerometer_jerk-mean()-y"                       
[15] "time_body_accelerometer_jerk-mean()-z"                       
[16] "time_body_accelerometer_jerk-std()-x"                        
[17] "time_body_accelerometer_jerk-std()-y"                        
[18] "time_body_accelerometer_jerk-std()-z"                        
[19] "time_body_gyroscope-mean()-x"                                
[20] "time_body_gyroscope-mean()-y"                                
[21] "time_body_gyroscope-mean()-z"                                
[22] "time_body_gyroscope-std()-x"                                 
[23] "time_body_gyroscope-std()-y"                                 
[24] "time_body_gyroscope-std()-z"                                 
[25] "time_body_gyroscope_jerk-mean()-x"                           
[26] "time_body_gyroscope_jerk-mean()-y"                           
[27] "time_body_gyroscope_jerk-mean()-z"                           
[28] "time_body_gyroscope_jerk-std()-x"                            
[29] "time_body_gyroscope_jerk-std()-y"                            
[30] "time_body_gyroscope_jerk-std()-z"                            
[31] "time_body_accelerometer_magnitude-mean()"                    
[32] "time_body_accelerometer_magnitude-std()"                     
[33] "time_gravity_accelerometer_magnitude-mean()"                 
[34] "time_gravity_accelerometer_magnitude-std()"                  
[35] "time_body_accelerometer_jerk_magnitude-mean()"               
[36] "time_body_accelerometer_jerk_magnitude-std()"                
[37] "time_body_gyroscope_magnitude-mean()"                        
[38] "time_body_gyroscope_magnitude-std()"                         
[39] "time_body_gyroscope_jerk_magnitude-mean()"                   
[40] "time_body_gyroscope_jerk_magnitude-std()"                    
[41] "frequency_body_accelerometer-mean()-x"                       
[42] "frequency_body_accelerometer-mean()-y"                       
[43] "frequency_body_accelerometer-mean()-z"                       
[44] "frequency_body_accelerometer-std()-x"                        
[45] "frequency_body_accelerometer-std()-y"                        
[46] "frequency_body_accelerometer-std()-z"                        
[47] "frequency_body_accelerometer-meanfrequency()-x"              
[48] "frequency_body_accelerometer-meanfrequency()-y"              
[49] "frequency_body_accelerometer-meanfrequency()-z"              
[50] "frequency_body_accelerometer_jerk-mean()-x"                  
[51] "frequency_body_accelerometer_jerk-mean()-y"                  
[52] "frequency_body_accelerometer_jerk-mean()-z"                  
[53] "frequency_body_accelerometer_jerk-std()-x"                   
[54] "frequency_body_accelerometer_jerk-std()-y"                   
[55] "frequency_body_accelerometer_jerk-std()-z"                   
[56] "frequency_body_accelerometer_jerk-meanfrequency()-x"         
[57] "frequency_body_accelerometer_jerk-meanfrequency()-y"         
[58] "frequency_body_accelerometer_jerk-meanfrequency()-z"         
[59] "frequency_body_gyroscope-mean()-x"                           
[60] "frequency_body_gyroscope-mean()-y"                           
[61] "frequency_body_gyroscope-mean()-z"                           
[62] "frequency_body_gyroscope-std()-x"                            
[63] "frequency_body_gyroscope-std()-y"                            
[64] "frequency_body_gyroscope-std()-z"                            
[65] "frequency_body_gyroscope-meanfrequency()-x"                  
[66] "frequency_body_gyroscope-meanfrequency()-y"                  
[67] "frequency_body_gyroscope-meanfrequency()-z"                  
[68] "frequency_body_accelerometer_magnitude-mean()"               
[69] "frequency_body_accelerometer_magnitude-std()"                
[70] "frequency_body_accelerometer_magnitude-meanfrequency()"      
[71] "frequency_body__accelerometer_jerk_magnitude-mean()"         
[72] "frequency_body__accelerometer_jerk_magnitude-std()"          
[73] "frequency_body__accelerometer_jerk_magnitude-meanfrequency()"
[74] "frequency_body__gyroscope_magnitude-mean()"                  
[75] "frequency_body__gyroscope_magnitude-std()"                   
[76] "frequency_body__gyroscope_magnitude-meanfrequency()"         
[77] "frequency_body__gyroscope_jerk_magnitude-mean()"             
[78] "frequency_body__gyroscope_jerk_magnitude-std()"              
[79] "frequency_body__gyroscope_jerk_magnitude-meanfrequency()"    
[80] "subject"                                                     
[81] "activity"                                                    
[82] "test/train"
