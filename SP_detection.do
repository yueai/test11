/*-----------------------------------------------------------				
*	Goal:			Description of detection rates of SP visit

*	Input Data:		1) thc_detection_clean.dta
					2) vc_detection_clean.dta
					
*	Output Data:	1) SP_detection.do

										
*   Author(s):      Hao Xue  
*	Created: 		2016-03-20
*   Last Modified: 	2016-03-28 Hao Xue
-----------------------------------------------------------*/
/*-----------------------------------------------------------
 Note: primary steps of this do file
 
	Step 1: Detection rate of THC
	Step 2: Detectiom rate of VC
	Step 3: append THC and VC together
-----------------------------------------------------------*/




 

clear all eibabefi 
set more off
capture log close



/*-------
Step 1: Detection rate of THC
--------*/
cd "/Users/apple/Dropbox/SP_project_data/merge and double check/double check/detection survey/thc_detection/"
use thc_detection_clean.dta,replace

// use "/Users/apple/Dropbox/SP project data/merge and double check/double check/detection survey/vc_detection/"

//33 doctor think have received 1 SP and 12 doctor think have recevied 2 SPs

/*
The SP visit period time is from July 31-August 13

*/

gen corr_dete_1=.


//age and symptoms
replace corr_dete_1=0 if thc_de_Q2_1_6==4

//visit time and symptoms
tab thc_de_Q2_1_4,m
tab thc_de_Q2_1_5 if thc_de_Q2_1_4==6
list thc_de_docid thc_de_Q2_1* if thc_de_Q2_1_4==6
replace corr_dete_1=0 if thc_de_docid==120602 
replace corr_dete_1=0 if thc_de_docid==150801 

tab thc_de_Q2_1_5 if thc_de_Q2_1_4==7  //3 8 10 12 15 18 20 24 26

list thc_de_docid thc_de_Q2_1* if thc_de_Q2_1_4==7 & thc_de_Q2_1_5==3
replace corr_dete_1=1 if thc_de_docid==130304

list thc_de_docid thc_de_Q2_1* if thc_de_Q2_1_4==7 & thc_de_Q2_1_5==8
replace corr_dete_1=2 if thc_de_docid==120801

list thc_de_docid thc_de_Q2_1* if thc_de_Q2_1_4==7 & thc_de_Q2_1_5==10
replace corr_dete_1=1 if thc_de_docid==150803

list thc_de_docid thc_de_Q2_1* if thc_de_Q2_1_4==7 & thc_de_Q2_1_5==12 //checked

list thc_de_docid thc_de_Q2_1* if thc_de_Q2_1_4==7 & thc_de_Q2_1_5==15
replace corr_dete_1=1 if thc_de_docid==120406
replace corr_dete_1=2 if thc_de_docid==360801

list thc_de_docid thc_de_Q2_1* if thc_de_Q2_1_4==7 & thc_de_Q2_1_5==18
replace corr_dete_1=1 if thc_de_docid==350903

list thc_de_docid thc_de_Q2_1* if thc_de_Q2_1_4==7 & thc_de_Q2_1_5==20
replace corr_dete_1=1 if thc_de_docid==150202

list thc_de_docid thc_de_Q2_1* if thc_de_Q2_1_4==7 & thc_de_Q2_1_5==24
replace corr_dete_1=1 if thc_de_docid==180803

list thc_de_docid thc_de_Q2_1* if thc_de_Q2_1_4==7 & thc_de_Q2_1_5==26
replace corr_dete_1=1 if thc_de_docid==160403
replace corr_dete_1=2 if thc_de_docid==170701
replace corr_dete_1=1 if thc_de_docid==270304


tab thc_de_Q2_1_5 if thc_de_Q2_1_4==8  //1 3 4 5 6 7 10 12 15
list thc_de_docid thc_de_Q2_1* if thc_de_Q2_1_4==8 & (thc_de_Q2_1_5==12|thc_de_Q2_1_5==15)
replace corr_dete_1=1 if thc_de_docid==141001
replace corr_dete_1=1 if thc_de_docid==220801
replace corr_dete_1=2 if thc_de_docid==310703 //visit time wrong but symptoms are similar

list thc_de_docid thc_de_Q2_1* if thc_de_Q2_1_4==8 & thc_de_Q2_1_5==10
replace corr_dete_1=1 if thc_de_docid==310202 //symptoms are wrong but reason is so strong
replace corr_dete_1=1 if thc_de_docid==341001 
replace corr_dete_1=2 if thc_de_docid==360602 

list thc_de_docid thc_de_Q2_1* if thc_de_Q2_1_4==8 & thc_de_Q2_1_5==7
replace corr_dete_1=1 if thc_de_docid==140802
replace corr_dete_1=2 if thc_de_docid==270201
replace corr_dete_1=2 if thc_de_docid==270202
replace corr_dete_1=2 if thc_de_docid==311001

list thc_de_docid thc_de_Q2_1* if thc_de_Q2_1_4==8 & thc_de_Q2_1_5==6
replace corr_dete_1=1 if thc_de_docid==170410
replace corr_dete_1=1 if thc_de_docid==350301

list thc_de_docid thc_de_Q2_1* if thc_de_Q2_1_4==8 & thc_de_Q2_1_5==5
replace corr_dete_1=1 if thc_de_docid==230405
replace corr_dete_1=0 if thc_de_docid==250603
replace corr_dete_1=0 if thc_de_docid==340602

list thc_de_docid thc_de_Q2_1* if thc_de_Q2_1_4==8 & thc_de_Q2_1_5==4
replace corr_dete_1=1 if thc_de_docid==330901

list thc_de_docid thc_de_Q2_1* if thc_de_Q2_1_4==8 & thc_de_Q2_1_5==3
replace corr_dete_1=1 if thc_de_docid==230901
replace corr_dete_1=1 if thc_de_docid==271001
replace corr_dete_1=1 if thc_de_docid==350904

list thc_de_docid thc_de_Q2_1* if thc_de_Q2_1_4==8 & thc_de_Q2_1_5==1
replace corr_dete_1=1 if thc_de_docid==231002
replace corr_dete_1=0 if thc_de_docid==250102


list thc_de_docid thc_de_Q2_1_4 thc_de_Q2_1_5 if thc_de_Q2_2==1 & corr_dete_1==.

list thc_de_docid thc_de_Q2_1* if thc_de_Q2_1_4==.n
replace corr_dete_1=1 if thc_de_docid==210502

list thc_de_docid thc_de_Q2_1* if thc_de_Q2_1_5==.n
replace corr_dete_1=0 if thc_de_docid==140302
replace corr_dete_1=2 if thc_de_docid==160402
replace corr_dete_1=1 if thc_de_docid==210401
replace corr_dete_1=1 if thc_de_docid==210801
replace corr_dete_1=2 if thc_de_docid==250602
replace corr_dete_1=2 if thc_de_docid==260802
replace corr_dete_1=0 if thc_de_docid==360704
replace corr_dete_1=0 if thc_de_docid==360903
replace corr_dete_1=0 if thc_de_docid==361004

tab corr_dete_1 thc_de_Q2_2,m

gen corr_dete_2=.

tab thc_de_Q2_2_4,m
list thc_de_docid thc_de_Q2_2* if thc_de_Q2_2_4==6
replace corr_dete_2=0 if thc_de_docid==150801

list thc_de_docid thc_de_Q2_2* if thc_de_Q2_2_4==7
replace corr_dete_2=1 if thc_de_docid==130304
replace corr_dete_2=0 if thc_de_docid==170701

list thc_de_docid thc_de_Q2_2* if thc_de_Q2_2_4==8
replace corr_dete_2=2 if thc_de_docid==141001
replace corr_dete_2=1 if thc_de_docid==170410
replace corr_dete_2=0 if thc_de_docid==210801
replace corr_dete_2=2 if thc_de_docid==230901
replace corr_dete_2=1 if thc_de_docid==250602
replace corr_dete_2=2 if thc_de_docid==260802
replace corr_dete_2=1 if thc_de_docid==271001
replace corr_dete_2=1 if thc_de_docid==311001
replace corr_dete_2=2 if thc_de_docid==330901

tab corr_dete_2 thc_de_Q2_2,m

codebook corr_dete_1 corr_dete_2


///// double checked with enumerators' notes
list thc_de_docid corr_dete_1 corr_dete_2 thc_de_Q2_1*  thc_de_Q2_2*  if int(thc_de_docid/100)==1303 & thc_de_Q2_1==1

list thc_de_docid corr_dete_1 corr_dete_2 thc_de_Q2_1*  thc_de_Q2_2*  if int(thc_de_docid/100)==2104 & thc_de_Q2_1==1

list thc_de_docid corr_dete_1 corr_dete_2 thc_de_Q2_1*  thc_de_Q2_2*  if int(thc_de_docid/100)==2105 & thc_de_Q2_1==1

list thc_de_docid corr_dete_1 corr_dete_2 thc_de_Q2_1*  thc_de_Q2_2*  if int(thc_de_docid/100)==2108 & thc_de_Q2_1==1
replace corr_dete_2=1 if thc_de_docid==210801

list thc_de_docid corr_dete_1 corr_dete_2 thc_de_Q2_1*  thc_de_Q2_2*  if int(thc_de_docid/100)==2208 & thc_de_Q2_1==1

list thc_de_docid corr_dete_1 corr_dete_2 thc_de_Q2_1*  thc_de_Q2_2*  if int(thc_de_docid/100)==2309 & thc_de_Q2_1==1
replace corr_dete_2=1 if thc_de_docid==230901


list thc_de_docid corr_dete_1 corr_dete_2 thc_de_Q2_1*  thc_de_Q2_2*  if int(thc_de_docid/100)==2310 & thc_de_Q2_1==1

list thc_de_docid corr_dete_1 corr_dete_2 thc_de_Q2_1*  thc_de_Q2_2*  if int(thc_de_docid/100)==2608 & thc_de_Q2_1==1
replace corr_dete_1=1 if thc_de_docid==260802
replace corr_dete_2=1 if thc_de_docid==260802

list thc_de_docid corr_dete_1 corr_dete_2 thc_de_Q2_1*  thc_de_Q2_2*  if int(thc_de_docid/100)==2702 & thc_de_Q2_1==1
replace corr_dete_1=1 if thc_de_docid==270201
replace corr_dete_1=1 if thc_de_docid==270202

list thc_de_docid corr_dete_1 corr_dete_2 thc_de_Q2_1*  thc_de_Q2_2*  if int(thc_de_docid/100)==2710 & thc_de_Q2_1==1

list thc_de_docid corr_dete_1 corr_dete_2 thc_de_Q2_1*  thc_de_Q2_2*  if int(thc_de_docid/100)==3101 & thc_de_Q2_1==1

list thc_de_docid corr_dete_1 corr_dete_2 thc_de_Q2_1*  thc_de_Q2_2*  if int(thc_de_docid/100)==3107 & thc_de_Q2_1==1
replace corr_dete_1=1 if thc_de_docid==310703

list thc_de_docid corr_dete_1 corr_dete_2 thc_de_Q2_1*  thc_de_Q2_2*  if int(thc_de_docid/100)==3110 & thc_de_Q2_1==1
replace corr_dete_1=1 if thc_de_docid==311001

list thc_de_docid corr_dete_1 corr_dete_2 thc_de_Q2_1*  thc_de_Q2_2*  if int(thc_de_docid/100)==3410 & thc_de_Q2_1==1

list thc_de_docid corr_dete_1 corr_dete_2 thc_de_Q2_1*  thc_de_Q2_2*  if int(thc_de_docid/100)==3503 & thc_de_Q2_1==1

list thc_de_docid corr_dete_1 corr_dete_2 thc_de_Q2_1*  thc_de_Q2_2*  if int(thc_de_docid/100)==3509 & thc_de_Q2_1==1

list thc_de_docid corr_dete_1 corr_dete_2 thc_de_Q2_1*  thc_de_Q2_2*  if int(thc_de_docid/100)==3606 & thc_de_Q2_1==1
replace corr_dete_1=1 if thc_de_docid==360602

//////check with survey form and SP visit record
tab corr_dete_1 thc_de_Q2_1_9,m

list thc_de_docid thc_de_Q2_1* if corr_dete_1==2 & thc_de_Q2_1_9==1
replace corr_dete_1=0 if corr_dete_1==2 & thc_de_Q2_1_9==1


tab corr_dete_2 thc_de_Q2_2_9,m

list thc_de_docid thc_de_Q2_2* if corr_dete_2==2 & thc_de_Q2_2_9==1
list corr_dete_1 corr_dete_2 if thc_de_docid==330901
replace corr_dete_2=1 if thc_de_docid==330901  // the doctor knows "no drug story"

codebook corr_dete_1 corr_dete_2
tab corr_dete_1 corr_dete_2,m

list thc_de_docid corr_dete_1 corr_dete_2 if corr_dete_1==2|corr_dete_2==2
replace corr_dete_2=1 if thc_de_docid==141001
replace corr_dete_1=1 if thc_de_docid==160402
replace corr_dete_1=1 if thc_de_docid==360801

*******detection rate in THC
gen corr_dete=.
replace corr_dete=1 if corr_dete_1==1
replace corr_dete=1 if corr_dete_1==0 & corr_dete_2==1
replace corr_dete=2 if corr_dete_1==1 & corr_dete_2==1

list corr_dete corr_dete_1 corr_dete_2 if corr_dete!=.  //checked

*********disease
gen dete_disease=""

list thc_de_docid thc_de_Q2_1_8 thc_de_Q2_1_6 thc_de_Q2_1_7_1 thc_de_Q2_1_7_2 thc_de_Q2_1_7_3 thc_de_Q2_1_7_6 thc_de_Q2_1_7_10 thc_de_Q2_1_7a if corr_dete_1==1  

replace dete_disease="A" if thc_de_docid==120406
replace dete_disease="D" if thc_de_docid==130304
replace dete_disease="A" if thc_de_docid==140802
replace dete_disease="T" if thc_de_docid==141001
replace dete_disease="T" if thc_de_docid==150202
replace dete_disease="D" if thc_de_docid==150803
replace dete_disease="A" if thc_de_docid==160402
replace dete_disease="T" if thc_de_docid==160403
replace dete_disease="T" if thc_de_docid==170410
replace dete_disease="A" if thc_de_docid==180803
replace dete_disease="A" if thc_de_docid==210401
replace dete_disease="A" if thc_de_docid==210502
replace dete_disease="D" if thc_de_docid==210801
replace dete_disease="A" if thc_de_docid==220801
replace dete_disease="T" if thc_de_docid==230405
replace dete_disease="T" if thc_de_docid==230901
replace dete_disease="A" if thc_de_docid==231002
replace dete_disease="A" if thc_de_docid==260802
replace dete_disease="A" if thc_de_docid==270201
replace dete_disease="D" if thc_de_docid==270202
replace dete_disease="D" if thc_de_docid==270304
replace dete_disease="T" if thc_de_docid==271001
replace dete_disease="T" if thc_de_docid==310202
replace dete_disease="D" if thc_de_docid==310703
replace dete_disease="T" if thc_de_docid==311001
replace dete_disease="T" if thc_de_docid==330901
replace dete_disease="A" if thc_de_docid==341001
replace dete_disease="A" if thc_de_docid==350301
replace dete_disease="D" if thc_de_docid==350903
replace dete_disease="A" if thc_de_docid==350904
replace dete_disease="A" if thc_de_docid==360602
replace dete_disease="T" if thc_de_docid==360801


list thc_de_docid thc_de_Q2_2_8 thc_de_Q2_2_6 thc_de_Q2_2_7_1 thc_de_Q2_2_7_2 thc_de_Q2_2_7_3 thc_de_Q2_2_7_6 thc_de_Q2_2_7_10 thc_de_Q2_2_7a if corr_dete_2==1  
gen dete_disease_2=""
replace dete_disease_2="A" if thc_de_docid==130304
replace dete_disease_2="A" if thc_de_docid==141001
replace dete_disease_2="A" if thc_de_docid==170410
replace dete_disease_2="T" if thc_de_docid==210801
replace dete_disease_2="A" if thc_de_docid==230901
replace dete_disease_2="A" if thc_de_docid==250602
replace dete_disease_2="D" if thc_de_docid==260802
replace dete_disease_2="A" if thc_de_docid==271001
replace dete_disease_2="D" if thc_de_docid==311001
replace dete_disease_2="A" if thc_de_docid==330901

codebook dete_disease dete_disease_2
codebook corr_dete_1 corr_dete_2

tab corr_dete //24+2*9=42 cases recognized in THC
gen corr_dete_visit_1=.
gen corr_dete_visit_2=.
tab corr_dete thc_de_Q2_1_9 if corr_dete==1 & corr_dete_1==1 //11 cases recognized durging the first SPvisit, 12 cases did not.
replace corr_dete_visit_1=1 if corr_dete==1 & corr_dete_1==1 & thc_de_Q2_1_9==1
tab corr_dete thc_de_Q2_2_9 if corr_dete==1 & corr_dete_2==1 //1 case recognized durging decond SPvisit

replace corr_dete_visit_2=1 if corr_dete==1 & corr_dete_2==1 & thc_de_Q2_2_9==1
list corr_dete thc_de_Q2_1_9 thc_de_Q2_2_9 corr_dete_1 corr_dete_2 if corr_dete==2 //10 cases recognized durging SPvisit
replace corr_dete_visit_1=1 if corr_dete==2 & thc_de_Q2_1_9==1 & thc_de_Q2_2_9==1 //4*2=8 cases recognized during the visit by same doctor
replace corr_dete_visit_2=1 if corr_dete==2 & thc_de_Q2_1_9==1 & thc_de_Q2_2_9==1 //4*2=8 cases recognized during the visit by same doctor
replace corr_dete_visit_2=1 if corr_dete==2 & thc_de_Q2_1_9==0 & thc_de_Q2_2_9==1 //2 more cases recognized durging decond SPvisit


//14+2*4=22 cases been recognized during SPvisit in THC


/*
doctor think fake patients: 33+12*2=57 cases; 57/631%=9.03%

28 cases suspected during SP visit (15A+6D+7T)
22/631%=3.49% corrected during SP visit (13A+5D+4T=22)
42/631%=6.66% during and after SP visit (20 after) (21A+9D+12T=42)

*/

*********
/*gen ID and keep useful variables*/
list thc_de_docid if thc_de_Q2_2==1 & dete_disease=="" & thc_de_Q2_1_9==1
list thc_de_docid corr_dete_1 corr_dete_2 thc_de_Q2_1*  thc_de_Q2_2* if thc_de_docid==120801
replace dete_disease="A" if thc_de_docid==120801
list thc_de_docid corr_dete_1 corr_dete_2 thc_de_Q2_1*  thc_de_Q2_2* if thc_de_docid==140302
replace dete_disease="A" if thc_de_docid==140302
replace dete_disease="T" if thc_de_docid==250102
replace dete_disease="T" if thc_de_docid==340601

drop if thc_de_Q2_1==0
drop thc_de_Q2_1
rename thc_de_Q2_2 num_of_sp
drop if num_of_sp==.

keep thc_de_docid num_of_sp corr_dete_1 corr_dete_2 corr_dete dete_disease dete_disease_2 ///
corr_dete_visit_1 corr_dete_visit_2 thc_de_Q2_1_9 thc_de_Q2_1_10 thc_de_Q2_2_9 thc_de_Q2_2_10 thc_de_Q2_1_10a thc_de_Q2_2_10a ///
thc_de_Q2_1_3 thc_de_Q2_1_6 thc_de_Q2_1_7 thc_de_Q2_1_7a thc_de_Q2_2_3 thc_de_Q2_2_6 thc_de_Q2_2_7 thc_de_Q2_2_7a

keep if thc_de_Q2_1_9==1|thc_de_Q2_2_9==1

rename thc_de_docid doctorid
rename corr_dete corr_detetot
rename dete_disease dete_disease_1
rename thc_de_Q2_1_3 sp_gender_1
rename thc_de_Q2_2_3 sp_gender_2
rename thc_de_Q2_1_6 sp_age_1
rename thc_de_Q2_2_6 sp_age_2
rename thc_de_Q2_1_7 sp_symtom_1
rename thc_de_Q2_2_7 sp_symtom_2
rename thc_de_Q2_1_7a sp_symtom_note_1
rename thc_de_Q2_2_7a sp_symtom_note_2
rename thc_de_Q2_1_10 recognize_reason_1 
rename thc_de_Q2_2_10 recognize_reason_2
rename thc_de_Q2_1_10a recognize_reason_note_1
rename thc_de_Q2_2_10a recognize_reason_note_2


drop thc_de_Q2_1_9  thc_de_Q2_2_9 
reshape long corr_dete_ dete_disease_ corr_dete_visit_ sp_gender_ sp_age_ sp_symtom_ sp_symtom_note_ recognize_reason_ recognize_reason_note_, i(doctorid) j(order_disease)
drop order_disease corr_detetot
drop if dete_disease_==""

drop if num_of_sp==1 & corr_dete_==.
sum num_of_sp corr_dete_ corr_dete_visit_
tab corr_dete_visit_ dete_disease,m
tab corr_dete_ dete_disease,

keep if corr_dete_visit_==1

tostring doctorid,replace
gen ID="SPV_"+dete_disease+doctorid if corr_dete_visit_==1

cd "/Users/apple/Dropbox/SP_project_data/paper/Analysis/SP_all/data/"
save thc_detection_corr.dta,replace

************
************
************

/*-------
Step 2: Detection rate of THC
--------*/

clear all
set more off

cd "/Users/apple/Dropbox/SP_project_data/merge and double check/double check/detection survey/vc_detection/"
use vc_detection_clean.dta,replace
tab vc_de_Q2_1 vc_de_Q2_2,m 
/*61+3=64 cases are suspected*/
drop if vc_de_Q2_1==0
drop *_raw

list vc_de_docid if vc_de_Q2_2==2

tab vc_de_Q2_1_3,m

tab vc_de_Q2_1_4,m  //7 8 7月底8月初 .n
tab vc_de_Q2_1_5 if vc_de_Q2_1_4=="7" //.n 10 11,12 12 15 18 2 20 25 26 27 28 29 8

gen corr_dete_1=.
gen corr_dete_visit_1=.
gen dete_disease_1=""
list vc_de_docid vc_de_Q2_1* if vc_de_Q2_1_4=="7"

replace corr_dete_1=1 if vc_de_docid=="1202101"
replace corr_dete_visit_1=1 if vc_de_docid=="1202101"
replace dete_disease_1="T" if vc_de_docid=="1202101"
replace corr_dete_1=1 if vc_de_docid=="1206102"
replace dete_disease_1="D" if vc_de_docid=="1206102"
replace corr_dete_1=1 if vc_de_docid=="1310101"
replace dete_disease_1="A" if vc_de_docid=="1310101"
replace corr_dete_1=1 if vc_de_docid=="1508101"
replace dete_disease_1="T" if vc_de_docid=="1508101"
replace corr_dete_1=1 if vc_de_docid=="1509101"
replace dete_disease_1="T" if vc_de_docid=="1509101"
replace corr_dete_1=1 if vc_de_docid=="1704101"
replace dete_disease_1="D" if vc_de_docid=="1704101"
replace corr_dete_1=1 if vc_de_docid=="2201101"
replace corr_dete_visit_1=1 if vc_de_docid=="2201101"
replace dete_disease_1="T" if vc_de_docid=="2201101"
replace corr_dete_1=1 if vc_de_docid=="2301101"
replace dete_disease_1="T" if vc_de_docid=="2301101"
replace corr_dete_1=1 if vc_de_docid=="2305201"
replace dete_disease_1="T" if vc_de_docid=="2305201"
replace corr_dete_1=1 if vc_de_docid=="2309201"
replace dete_disease_1="T" if vc_de_docid=="2309201"
replace corr_dete_1=1 if vc_de_docid=="2409101"
replace dete_disease_1="T" if vc_de_docid=="2409101"
replace corr_dete_1=1 if vc_de_docid=="2507101"
replace corr_dete_visit_1=1 if vc_de_docid=="2507101"  //need double check
replace dete_disease_1="A" if vc_de_docid=="2507101"
replace corr_dete_1=1 if vc_de_docid=="3108101"
replace dete_disease_1="A" if vc_de_docid=="3108101"
replace corr_dete_1=1 if vc_de_docid=="3309102"
replace corr_dete_visit_1=1 if vc_de_docid=="3309102"  //need double check
replace dete_disease_1="A" if vc_de_docid=="3309102"
replace corr_dete_1=1 if vc_de_docid=="3408102"
replace dete_disease_1="T" if vc_de_docid=="3408102"
replace corr_dete_1=1 if vc_de_docid=="3501101"
replace dete_disease_1="A" if vc_de_docid=="3501101"
replace corr_dete_1=1 if vc_de_docid=="3507101"
replace dete_disease_1="A" if vc_de_docid=="3507101"
replace corr_dete_visit_1=1 if vc_de_docid=="3507101"
replace corr_dete_1=1 if vc_de_docid=="3508102"
replace dete_disease_1="A" if vc_de_docid=="3508102"
replace corr_dete_1=1 if vc_de_docid=="3510101"
replace dete_disease_1="T" if vc_de_docid=="3510101"
replace corr_dete_visit_1=1 if vc_de_docid=="3510101" 



list vc_de_docid vc_de_Q2_1* if vc_de_Q2_1_4=="8"
replace corr_dete_1=1 if vc_de_docid=="1110101"
replace dete_disease_1="D" if vc_de_docid=="1110101"
replace corr_dete_1=1 if vc_de_docid=="1203101"
replace dete_disease_1="T" if vc_de_docid=="1203101"
replace corr_dete_1=1 if vc_de_docid=="1208101"
replace dete_disease_1="D" if vc_de_docid=="1208101"
replace corr_dete_1=1 if vc_de_docid=="1303101"
replace dete_disease_1="T" if vc_de_docid=="1303101"
replace corr_dete_1=1 if vc_de_docid=="1504101"
replace dete_disease_1="T" if vc_de_docid=="1504101"
replace corr_dete_visit_1=1 if vc_de_docid=="1504101"
replace corr_dete_1=1 if vc_de_docid=="1608101"
replace dete_disease_1="T" if vc_de_docid=="1608101"
replace corr_dete_1=1 if vc_de_docid=="1802101"
replace dete_disease_1="T" if vc_de_docid=="1802101"
replace corr_dete_1=1 if vc_de_docid=="1807101"
replace dete_disease_1="A" if vc_de_docid=="1807101"
replace corr_dete_1=1 if vc_de_docid=="2104201"
replace dete_disease_1="T" if vc_de_docid=="2104201"
replace corr_dete_visit_1=1 if vc_de_docid=="2104201"
replace corr_dete_1=1 if vc_de_docid=="2205101"
replace dete_disease_1="A" if vc_de_docid=="2205101"
replace corr_dete_visit_1=1 if vc_de_docid=="2205101"
replace corr_dete_1=1 if vc_de_docid=="2206201"
replace dete_disease_1="T" if vc_de_docid=="2206201"
replace corr_dete_visit_1=1 if vc_de_docid=="2206201"
replace corr_dete_1=1 if vc_de_docid=="2302101" 
replace dete_disease_1="T" if vc_de_docid=="2302101"
replace corr_dete_1=1 if vc_de_docid=="2401101"
replace dete_disease_1="A" if vc_de_docid=="2401101"
replace corr_dete_visit_1=1 if vc_de_docid=="2401101"
replace corr_dete_1=1 if vc_de_docid=="2407201"
replace dete_disease_1="D" if vc_de_docid=="2407201"
replace corr_dete_1=1 if vc_de_docid=="2510101"
replace dete_disease_1="A" if vc_de_docid=="2510101"
replace corr_dete_1=1 if vc_de_docid=="2602101"
replace dete_disease_1="A" if vc_de_docid=="2602101"
replace corr_dete_1=1 if vc_de_docid=="2610101"
replace dete_disease_1="A" if vc_de_docid=="2610101"
replace corr_dete_1=1 if vc_de_docid=="2702201" 
replace dete_disease_1="A" if vc_de_docid=="2702201"
replace corr_dete_1=1 if vc_de_docid=="2704101"
replace dete_disease_1="D" if vc_de_docid=="2704101"
replace corr_dete_1=1 if vc_de_docid=="2706101"
replace dete_disease_1="A" if vc_de_docid=="2706101"
replace corr_dete_visit_1=1 if vc_de_docid=="2706101"
replace corr_dete_1=1 if vc_de_docid=="3105101"
replace dete_disease_1="A" if vc_de_docid=="3105101"
replace corr_dete_visit_1=1 if vc_de_docid=="3105101"
replace corr_dete_1=1 if vc_de_docid=="3203102"
replace dete_disease_1="T" if vc_de_docid=="3203102"
replace corr_dete_1=1 if vc_de_docid=="3505102"
replace dete_disease_1="A" if vc_de_docid=="3505102"
replace corr_dete_visit_1=1 if vc_de_docid=="3505102"
replace corr_dete_1=1 if vc_de_docid=="3509101"
replace dete_disease_1="A" if vc_de_docid=="3509101"


list vc_de_docid vc_de_Q2_1* if vc_de_Q2_1_4==".n"
replace corr_dete_1=1 if vc_de_docid=="2107101"
replace dete_disease_1="D" if vc_de_docid=="2107101"
replace corr_dete_1=1 if vc_de_docid=="2607101"
replace dete_disease_1="A" if vc_de_docid=="2607101"
replace corr_dete_visit_1=1 if vc_de_docid=="2607101"
replace corr_dete_1=1 if vc_de_docid=="3301101"
replace dete_disease_1="D" if vc_de_docid=="3301101"


list vc_de_docid vc_de_Q2_1* if vc_de_Q2_1_4=="7月底8月初"
replace corr_dete_1=1 if vc_de_docid=="3102102"
replace dete_disease_1="A" if vc_de_docid=="3102102"
replace corr_dete_1=1 if vc_de_docid=="3107101"
replace dete_disease_1="D" if vc_de_docid=="3107101"
replace corr_dete_visit_1=1 if vc_de_docid=="3107101"

gen corr_dete_2=.
gen dete_disease_2=""
list vc_de_docid vc_de_Q2_2* if vc_de_Q2_2_4!=.
replace corr_dete_2=1 if vc_de_docid=="1110101"
replace dete_disease_2="A" if vc_de_docid=="1110101"
replace corr_dete_2=1 if vc_de_docid=="M141"
replace dete_disease_2="A" if vc_de_docid=="M141"

tab corr_dete_1 corr_dete_2,m

list vc_de_docid dete_disease_1 dete_disease_2 if corr_dete_1==1 & corr_dete_2==1
replace dete_disease_1="A" if vc_de_docid=="1110101"
replace dete_disease_2="" if vc_de_docid=="1110101"
replace corr_dete_1=1 if vc_de_docid=="1110101"
replace corr_dete_2=. if vc_de_docid=="1110101"
replace corr_dete_1=1 if vc_de_docid=="M141"
replace corr_dete_2=. if vc_de_docid=="M141"
replace dete_disease_1="A" if vc_de_docid=="M141"
replace dete_disease_2="" if vc_de_docid=="M141"

keep if vc_de_Q2_1_9==1

keep migrant vc_de_docid vc_de_Q2_2 corr_dete_1 corr_dete_visit_1 dete_disease_1 ///
vc_de_Q2_1_3 vc_de_Q2_1_6 vc_de_Q2_1_7 vc_de_Q2_1_7a vc_de_Q2_1_10 vc_de_Q2_1_10a

rename vc_de_docid doctorid
rename vc_de_Q2_2 num_of_sp

tab corr_dete_1 dete_disease_1,m
drop if num_of_sp==.

rename corr_dete_1 corr_dete_
rename corr_dete_visit_1 corr_dete_visit_
rename dete_disease_1 dete_disease_
rename vc_de_Q2_1_3 sp_gender_
rename vc_de_Q2_1_6 sp_age_ 
rename vc_de_Q2_1_7 sp_symtom_
rename vc_de_Q2_1_7a sp_symtom_note_
rename vc_de_Q2_1_10 recognize_reason_
rename vc_de_Q2_1_10 recognize_reason_note_

list doctorid if dete_disease_==""
replace dete_disease_="T" if doctorid=="2504101"
replace dete_disease_="D" if doctorid=="M201"
tab dete_disease_ if migrant!=1

gen ID="SPV_"+dete_disease+doctorid if corr_dete_visit_==1

cd "/Users/apple/Dropbox/SP_project_data/paper/Analysis/SP_all/data/"
save vc_detection_corr.dta,replace



tab num_of_sp dete_disease
tab corr_dete_visit dete_disease

/*
228 village SP visit cases in total
64 cases being suspected by village doctors

19 cases suspected during SP visit (11A+1D+7T)

49 (21.49%) cases are correct suspected
22A+8D+19T=49

16 (7.01%) cases during SP visit c corrected suspected 
9A+1D+6T==16
*/	


/*-------
Step 3: append THC and VC together
--------*/


append using thc_detection_corr.dta
duplicates report ID

drop if ID==""
drop migrant doctorid num_of_sp corr_dete_

order ID corr_dete_visit_ dete_disease_ sp_gender_ sp_age_ sp_symtom_ sp_symtom_note_ ///
 recognize_reason_ recognize_reason_note_

save spv_detection.dta,replace


/*-------
Step 4: append THC and VC together
--------*/
clear all
set maxvar 20000
use spv_detection.dta,replace
merge 1:1 ID using /Users/apple/Dropbox/SP_project_data/paper/Analysis/SP_all/data/SP_description_irt.dta

tab dete_disease_ level,m
tab sp_gender if disease=="A"
list ID sp_gender sp_age sp_symtom_ sp_symtom_note recognize_reason_ recognize_reason_note_ if disease=="A" & corr_dete_visit==1
list ID sp_gender  SPmale_Diarrhea sp_age sp_symtom_ sp_symtom_note recognize_reason_ recognize_reason_note_ if disease=="D" & corr_dete_visit==1
list ID sp_gender SPmale_TB sp_age sp_symtom_ sp_symtom_note recognize_reason_ recognize_reason_note_ if disease=="T" & corr_dete_visit==1








