#! /bin/bash

echo " "
echo "-------- Welcome --------"
echo ""
echo "Please note: your program MUST be compiled with -g flag"

while :
do
echo "Please choose from the following options: "
echo "1. Memory Mode Advisor" #user only wants suggestions on what memory mode to use
echo "2. Cluster Mode Advisor" #user only wants suggestions for clustering mode
echo "3. Vectorization Advisor" #user wants report on changes for automatic vectorization
echo "4. All" #user wants advice for best memory & cluster modes, plus AV potential
echo "5. Quit"
read option

case $option in
   1) 
      echo "Memory Mode Advisor. Please enter program name: "
      read prog
      echo "Path to folder containing executable: "
      read dir
      echo "Please enter any program arguments: "
      read progargs  
      
      #Launch Memory profiling script
      bash mem_mode.sh $prog $dir $progargs
	;;
   2)
      echo "Clustering Mode Advisor. Please enter your program name: "
      read prog
      echo "Path to folder containing executable: "
      read dir
      echo "Please enter any program arguments: "
      read progargs

      #Launch clustering profiling script
      bash cluster_mode.sh $prog $dir $progargs
	;; 
   3) 
      echo "Vecorization Advisor. Please enter your program name: "
      read prog
      echo "Path to folder containing executable: "
      read dir
      echo "Please enter any program arguments: "
      read progargs

      #Launch Automatic Vectorization profiling script
      bash av_mode.sh $prog $dir $progargs
	;; 
   4) 
      echo "Will determine best memory and clustering modes and check for vectorization oportunities"
      echo "Please enter your program name: "
      read prog
      echo "Path to folder containing executable: "
      read dir
      echo "Please enter any program arguments: "
      read progargs

      #Launch profiling script
      bash all_mode.sh $prog $dir $progargs
	;; 
   5)
      exit;;
   *) echo "Invalid Option";;
esac
done
