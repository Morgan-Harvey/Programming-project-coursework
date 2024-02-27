#!/bin/bas

chmod +x test.sh

# removed the permissions of the file to test for bad permissions
chmod -r data/bad_perms.txt

# testing errors in arguments
echo -e "~~ Argument Tests ~~"
echo -n "Testing no arguments - "
./program > tmp
if grep -q "Usage: studentData <filename>" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Testing 2 arguments - "
./Program y z > tmp
if grep -q "Usage: Program <Maze file>" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

ech0


echo -e "\n~~ File Handling~~"

echo -n "Testing bad mapname - "
./studentData rge_1 x 5.txt > tmp
if grep -q "Error: unknown map" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi


echo -n "Testing bad permissions - "
./studentData maps/invalid/bad_perms.txt > tmp
if grep -q "Error: Bad permissions" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Testing file loading - "
./studentData maps/valid/reg_5x5.txt.txt > tmp
if grep -q "Error: Bad permissions" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -e "~~Symbol Precense~~\n"

./program maps/invalid/MissingStart.txt > tmp
echo -n "no start present"
if grep -q "Start is missing" tmp;
then
    echo "\e[32mPASS\e[0mm"
else
    echo "\e[31mFAIL\e[0m"
fi



echo -n "no End present"
./program maps/invalid/MissingEnd.txt > tmp
if grep -q "End is not present";
then
    echo "\e[32mPASS\e[0mm"
    ((pass_counter++))
else
    echo "\e[31mFAIL\e[0m"
fi

echo -n "Multiple start present"
./program maps/invalid/MultipleStart.txt > tmp
if grep -q "More than one start is present";
then
    echo "\e[32mPASS\e[0mm"
    ((pass_counter++))
else
    echo "\e[31mFAIL\e[0m"
fi


echo -n "Multiple End present"
./program maps/invalid/MultipleEnd.txt > tmp
if grep -q "more than one end is present";
then
    echo "\e[32mPASS\e[0mm"
    ((pass_counter++))
else
    echo "\e[31mFAIL\e[0m"
fi









echo -e "~~player input~~\n"
echo -n "Testing unknown input"

./program maps/valid/dierection_texting.txt < inputs/unknown_input.txt > tmp
if grep -q "Unknown Input detected" tmp;
then
    echo "\e[32mPASS\e[0mm"
    ((pass_counter++))
else
    echo "\e[31mFAIL\e[0m"
fi


echo -n "Testing W input"

./program maps/valid/dierection_texting.txt < inputs/Move_up.txt.txt > tmp
if grep -q "You pressed W";
then
    echo "\e[32mPASS\e[0mm"
    ((pass_counter++))
else
    echo "\e[31mFAIL\e[0m"
fi

echo -n "Testing A input"
./program maps/valid/dierection_texting.txt < inputs/Move_left.txt.txt > tmp
if grep -q "You pressed A";
then
    echo "\e[32mPASS\e[0mm"
    ((pass_counter++))
else
    echo "\e[31mFAIL\e[0m"
fi

echo -n "Testing S input"
./program maps/valid/wall_testing.txt < inputs/Move_down.txt > tmp
if grep -q "You pressed S";
then
    echo "\e[32mPASS\e[0mm"
    ((pass_counter++))
else
    echo "\e[31mFAIL\e[0m"
fi

echo -n "Testing D input"
./program maps/valid/dierection_texting.txt < inputs/Move_right.txt > tmp
if grep -q "You have moved right";
then
    echo "\e[32mPASS\e[0mm"
    ((pass_counter++))
else
    echo "\e[31mFAIL\e[0m"
fi



echo -e "~~Maze generation~~\n"
echo -n "test empty maze array"
echo -n "test maze 101 by 5"
echo -n "test maze 101 by 4"
echo -n "test maze 4 by 100"
echo -n "test maze 5 by 101"



if grep -q "Maze Height is too big" ;
then
    echo "PASS"
    ((pass_counter++))
else
    echo "FAIL"
fi

echo -e "~~Boundaries and walls~~\n"
echo -n "players testing"

if grep ... ;
then
    echo "PASS"
    ((pass_counter++))
else
    echo "FAIL"
fi


echo -n "~~Goal~~\n"
echo -n "reaching the goal"
./programs 

echo -n "~~players testing~~\n"
echo -n "~~players testing"



chmod +r data/bad_perms.csv