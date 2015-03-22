# Cleaning-data Class Assingment
The R script in the repo assumes that the "UCI HAR Dataset" file is in the working directery. The script then
extracts the test and traing data sets and assins the infomation in the "featurs.txt"file as colum headings as
well as adding colums contaning the type of exersise performed and the test subject who performed the activertys.
All feater mesument not related to the mean or standard deviation of a veriable were then removed. the tow dater 
sets were then combind one under the other with the coulumbs matching. The data was then grouped by excersise and 
the subject and an averidge was calculated for the number of times the indervidule repeted an excercis this was 
done for each veriable in the data set.

## Activity
The activerty performed in the experiment.

## Subject
An identifying number showing the participent performing the activerty in the experiment.

## Time veriables
data represented agains time was gathered using a samsung s2 accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. The mesurments were taken at 50Hz and filtered at 20Hz
