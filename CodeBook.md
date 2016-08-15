## Code Book: Getting and Cleaning Data Peer Graded Programming Assignment
## Aron O'Connor
## Aug. 14, 2016

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
