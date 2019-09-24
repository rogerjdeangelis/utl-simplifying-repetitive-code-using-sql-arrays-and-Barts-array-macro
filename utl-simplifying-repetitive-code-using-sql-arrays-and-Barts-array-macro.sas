Simplifying repetitive code using sql arrays and Barts array macro                                                                       
                                                                                                                                         
Problem: Simplify the SQl code below                                                                                                     
                                                                                                                                         
If you would rather insert the generated code just use mprint.                                                                           
Using SQL arrays tends to eliminate typos.                                                                                               
                                                                                                                                         
Probably my ignorance but                                                                                                                
I could not get the original array macro to work, because it appears to strip leading zeroes?                                            
                                                                                                                                         
                                                                                                                                         
Bart' macros (Bart's macro is very flexible because it supports datastep functions directly)                                             
                                                                                                                                         
Bartosz Jablonski                                                                                                                        
yabwon@gmail.com                                                                                                                         
                                                                                                                                         
http://www.mini.pw.edu.pl/~bjablons/SASpublic/array.sas                                                                                  
http://www.mini.pw.edu.pl/~bjablons/SASpublic/do_over.sas                                                                                
                                                                                                                                         
related to                                                                                                                               
SAS Forum                                                                                                                                
https://tinyurl.com/y4da7o29                                                                                                             
https://communities.sas.com/t5/SAS-Programming/Improve-case-satement-and-nested-statements/m-p/590935                                    
                                                                                                                                         
*_                   _                                                                                                                   
(_)_ __  _ __  _   _| |_                                                                                                                 
| | '_ \| '_ \| | | | __|                                                                                                                
| | | | | |_) | |_| | |_                                                                                                                 
|_|_| |_| .__/ \__,_|\__|                                                                                                                
        |_|                                                                                                                              
;                                                                                                                                        
                                                                                                                                         
proc sql;                                                                                                                                
    UPDATE GRV_Export_Dummy D                                                                                                            
                                                                                                                                         
                                                                                                                                         
 PROC SQL;                                                                                                                               
   UPDATE GRV_Export_Dummy D                                                                                                             
      SET (CASE                                                                                                                          
                WHEN       (SELECT "EB"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1"                                          
                THEN "EB/"                                                                                                               
                ELSE ""                                                                                                                  
          END)                                                                                                                           
          ||                                                                                                                             
          (CASE                                                                                                                          
                WHEN       (SELECT "M01"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1"                                         
                THEN "M/"                                                                                                                
                ELSE ""                                                                                                                  
          END)                                                                                                                           
          ||                                                                                                                             
          (CASE                                                                                                                          
                WHEN       (SELECT "V01"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                     
                           (SELECT "V02"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                     
                           (SELECT "V03"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1"                                         
                THEN "V/"                                                                                                                
                ELSE ""                                                                                                                  
          END)                                                                                                                           
          ||                                                                                                                             
          (CASE                                                                                                                          
                WHEN   %do_over(hs,phrase=(SELECT "?"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1",between=andand)            
                       (SELECT "H01"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "H02"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "H03"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "H04"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "H05"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "H06"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1"                                             
                THEN "H/"                                                                                                                
                ELSE ""                                                                                                                  
          END)                                                                                                                           
          ||                                                                                                                             
          (CASE                                                                                                                          
                WHEN       (SELECT "J01"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                     
                       (SELECT "J02"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "J03"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "J04"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "J05"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "J06"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "J07"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "J08"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "J09"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "J10"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "J11"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "J12"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1"                                             
                THEN "J/"                                                                                                                
                ELSE ""                                                                                                                  
          (CASE                                                                                                                          
                WHEN       (SELECT "K01"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                     
                       (SELECT "K02"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "K03"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "K04"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "K05"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "K06"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "K07"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "K08"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "K09"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "K10"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "K11"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "K12"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "K13"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "K14"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "K15"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "K16"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                       (SELECT "K17"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1" and                                         
                THEN "K/"                                                                                                                
                ELSE ""                                                                                                                  
           END)                                                                                                                          
   WHERE D.GRV IN (SELECT V.VTGONR FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR);                                                     
QUIT;                                                                                                                                    
                                                                                                                                         
*    _                 _                                                                                                                 
 ___(_)_ __ ___  _ __ | | ___ _ __                                                                                                       
/ __| | '_ ` _ \| '_ \| |/ _ \ '__|                                                                                                      
\__ \ | | | | | | |_) | |  __/ |                                                                                                         
|___/_|_| |_| |_| .__/|_|\___|_|                                                                                                         
                |_|                                                                                                                      
;                                                                                                                                        
                                                                                                                                         
I have renamed Bart's macros because I arleadt have macros array and do_over.                                                            
                                                                                                                                         
%barray(hs[1:6] $ 2, function = put(_i_,z2.) )                                                                                           
%barray(js[1:12] $ 2, function = put(_i_,z2.) )                                                                                          
%barray(ks[1:17] $ 2, function = put(_i_,z2.) )                                                                                          
                                                                                                                                         
PROC SQL;                                                                                                                                
     UPDATE GRV_Export_Dummy D                                                                                                           
           SET (CASE                                                                                                                     
                     WHEN    (SELECT 'EB'n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = '1'                                        
                     THEN 'EB/'                                                                                                          
                     ELSE ''                                                                                                             
               END)                                                                                                                      
               ||                                                                                                                        
               (CASE                                                                                                                     
                     WHEN    (SELECT 'M01'n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = '1'                                       
                     THEN 'M/'                                                                                                           
                     ELSE ''                                                                                                             
               END)                                                                                                                      
               ||                                                                                                                        
               (CASE                                                                                                                     
                     WHEN  %do_over(hs,phrase=(SELECT "?"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1",between=and)           
                                                                                                                                         
                     THEN 'V/'                                                                                                           
                     ELSE ''                                                                                                             
               END)                                                                                                                      
               ||                                                                                                                        
               (CASE                                                                                                                     
                     WHEN   %do_over(hs,phrase=(SELECT "?"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1",between=and)          
                     THEN 'H/'                                                                                                           
                     ELSE ''                                                                                                             
               END)                                                                                                                      
               ||                                                                                                                        
               (CASE                                                                                                                     
                     WHEN   %do_over(js,phrase=(SELECT "?"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1",between=and)          
                     THEN 'J/'                                                                                                           
                     ELSE ''                                                                                                             
               (CASE                                                                                                                     
                     WHEN   %do_over(js,phrase=(SELECT "?"n FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR) = "1",between=and)          
                     THEN 'K/'                                                                                                           
                     ELSE ''                                                                                                             
               END)                                                                                                                      
                                                                                                                                         
     WHERE D.GRV IN (SELECT V.VTGONR FROM SERVER.VIEW_TABLE V WHERE D.GRV = V.VTGONR);                                                   
UIT;                                                                                                                                     
                                                                                                                                         
                                                                                                                                         
