CPATH='.;../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar'  

# CLONING THE REPOSITORY:
rm -rf student
git clone $1 student

rm -rf grading
mkdir grading

echo 'Finished cloning'

# CHECKING IF CORRECT FILE IS PRESENT:
if ! [[ -f 'student/ListExamples.java' ]]; then
    echo "File 'ListExamples.java' not found in the student directory. Exiting..."
    exit 1
fi

#MOVE FILES TO CORRECT DIRECTORY
cp student/ListExamples.java grading/
cp TestListExamples.java grading/

cd grading

#COMPILING FILES
javac -cp $CPATH *.java
#CHECKS IF IT IS A COMPILER ERROR
if [ $? -ne 0 ]; then
    echo "Failed Compiling"
    exit 1
else
    echo "Sucess Compiling"
fi

java -cp $CPATH 'org.junit.runner.JUnitCore' TestListExamples