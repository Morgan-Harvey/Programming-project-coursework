#!/bin/bash

chmod +x test.sh

# removed the permissions of the maze to test for bad permissions
chmod -r maps/invalid/bad_perms.txt

# initialise variables to count total test number of failed tests and number of passed tests
test_counter=0
pass_counter=0
fail_counter=0

# testing errors in arguments,
echo -e "\e[33m~~ Argument Tests ~~\e[0m]"
((test_counter++))
# check whether the program runs with no arguments
echo -n "Test no arguments - "
./program > tmp
if grep -q "Usage: Program <filename>" tmp;
then
    echo -e "\e[32mPASS\e[0m"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi

# tests inputing multiple arguments
((test_counter++))
echo -n "Test 2 arguments - "
./program y z > tmp
if grep -q "Usage: Program <Maze file>" tmp;
then
    echo -e "\e[32mPASS\e[0m"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi


((test_counter++))
echo -e "\n\e[33m~~ File Handling~~\e[0m"
echo -n "Test bad mapname - "
./program noexist.txt > tmp
if grep -q "Error: unknown map" tmp;
then
    echo -e "\e[32mPASS\e[0m"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi

((test_counter++))
echo -n "Test bad permissions - "
./program maps/invalid/bad_perms.txt > tmp
if grep -q "Error: Bad permissions" tmp;
then
    echo -e "\e[32mPASS\e[0m"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi

((test_counter++))
echo -n "Testing successful file loading - "
./program maps/valid/reg_5x5.txt > tmp
if grep -q "Map has loaded succesfully" tmp;
then
    echo -e "\e[32mPASS\e[0m"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi

((test_counter++))
echo -e "\n\e[33m~~Maze generation~~\e[0m"
echo -n "test empty maze array - "
./program maps/invalid/Empty_map.txt > tmp
if grep -q "Map is not valid" tmp;
then
    echo -e "\e[32mPASS\e[0m"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi

((test_counter++))
echo -n "test maze 101 by 5 - "
./program maps/invalid/HeightToBig.txt > tmp
if grep -q "Map is not valid" tmp;
then
    echo -e "\e[32mPASS\e[0m"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi

((test_counter++))
echo -n "test maze 5 by 101 - "
./program maps/invalid/WidthToBig.txt > tmp

if grep -q "Map is not valid" tmp;
then
    echo -e "\e[32mPASS\e[0m"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi

((test_counter++))
echo -n "test maze 4 by 100 - "
./program maps/invalid/HeightToSmall.txt > tmp

if grep -q "Map is not valid" tmp;
then
    echo -e "\e[32mPASS\e[0m"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi

((test_counter++))
echo -n "test maze 5 by 101 - "
./program maps/invalid/WidthToSmall.txt > tmp
if grep -q "Map is not valid" tmp;
then
    echo -e "\e[32mPASS\e[0m"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi

((test_counter++))
echo -n "test Irregular height - "
./program maps/invalid/ireg_height_5x5.txt > tmp
if grep -q "Map is not valid" tmp;
then
    echo -e "\e[32mPASS\e[0m"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi

((test_counter++))
echo -n "test Irregular Width - "
./program maps/invalid/ireg_width_5x5.txt > tmp
if grep -q "Map is not valid" tmp;
then
    echo -e "\e[32mPASS\e[0m"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi

((test_counter++))
echo -n "test maze 5 by 100 - "
./program maps/valid/100x5.txt > tmp
if grep -q "Map has loaded succesfully" tmp;
then
    echo -e "\e[32mPASS\e[0m"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi


((test_counter++))
echo -e "\n\e[33m~~Symbol Precense~~\e[0m"
echo -n "no start present - "
./program maps/invalid/MissingStart.txt > tmp
if grep -q "Map is not valid" tmp;
then
    echo -e "\e[32mPASS\e[0m"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi

((test_counter++))
echo -n "no End present - "
./program maps/invalid/MissingEnd.txt > tmp
if grep -q "Map is not valid" tmp;
then
    echo -e "\e[32mPASS\e[0m"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi

((test_counter++))
echo -n "Multiple start present - "
./program maps/invalid/MultipleStart.txt > tmp
if grep -q "Map is not valid" tmp;
then
    echo -e "\e[32mPASS\e[0m"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi

((test_counter++))
echo -n "Multiple End present - "
./program maps/invalid/MultipleEnd.txt > tmp
if grep -q "Map is not valid" tmp;
then
    echo -e "\e[32mPASS\e[0m"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi

((test_counter++))
echo -n "unknown Character present - "
./program maps/invalid/unknownCharacter.txt > tmp
if grep -q "Map is not valid" tmp;
then
    echo -e "\e[32mPASS\e[0m"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi


echo -e "\n\e[33m~~player input~~\e[0m"
((test_counter++))
echo -n "Testing unknown input - "
./program maps/valid/direction_testing.txt < inputs/unknown_input.txt > tmp
if grep -q "Unknown Input detected" tmp;
then
    echo -e "\e[32mPASS\e[0m"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi

((test_counter++))
echo -n "Testing W input - "
./program maps/valid/direction_testing.txt < inputs/Move_up.txt > tmp
if grep -q "You pressed W" tmp;
then
    echo -e "\e[32mPASS\e[0m"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi

((test_counter++))
echo -n "Testing A input - "
./program maps/valid/direction_testing.txt < inputs/Move_left.txt > tmp
if grep -q "You pressed A" tmp;
then
    echo -e "\e[32mPASS\e[0m"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi

((test_counter++))
echo -n "Testing S input - "
./program maps/valid/direction_testing.txt < inputs/Move_down.txt > tmp
if grep -q "You pressed S" tmp;
then
    echo -e "\e[32mPASS\e[0m"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi

((test_counter++))
echo -n "Testing D input - "
./program maps/valid/direction_texting.txt < inputs/Move_right.txt > tmp
if grep -q "You have moved right" tmp;
then
    echo -e "\e[32mPASS\e[0m"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi


echo -e "\n\e[33m~~Boundaries and walls~~\e[0m"
((test_counter++))
echo -n "test wall above - "
./program maps/valid/wall_testing.txt < inputs/Move_up.txt > tmp
if grep -q "You hit a wall" tmp;
then
    echo -e "\e[32mPASS\e[0m"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi

((test_counter++))
echo -n "test left wall - "
./program maps/valid/wall_testing.txt < inputs/Move_left.txt > tmp
if grep -q "You hit a wall" tmp;
then
    echo -e "\e[32mPASS\e[0m"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi

((test_counter++))
echo -n "test Wall below - "
./program maps/valid/wall_testing.txt < inputs/Move_down.txt > tmp
if grep -q "You hit a wall" tmp;
then
    echo -e "\e[32mPASS\e[0mm"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi

((test_counter++))
echo -n "test right wall - "
./program maps/valid/wall_texting.txt < inputs/Move_right.txt > tmp
if grep -q "You hit a wall" tmp;
then
    echo -e "\e[32mPASS\e[0m"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi

((test_counter++))
echo -e "\n\e[33m~~Goal~~\e[0m"
echo -n "reaching the goal - "
./program maps/valid/reg_5x5.txt < inputs/Goal.txt > tmp;
if grep -q "you have reached the goal!" tmp;
then
    echo -e "\e[32mPASS\e[0m"
    ((pass_counter++))
else
    echo -e "\e[31mFAIL\e[0m"
    ((fail_counter++))
fi

echo -e "\n\e[33m~~ Results~~\e[0m"
# was inspired by the Week 2 lab session'slab sheet
# displays the total number of tests passed and failed as well as the percentage passed
echo -e "Total tests: $test_counter"
echo -e "Passed tests: $pass_counter"
echo -e "Failed tests: $fail_counter"
echo "Percentage passed: $(echo "scale=2; $pass_counter*100 / $test_counter" | bc)%"
echo "Percentage failed: $(echo "scale=2; $fail_counter*100 / $test_counter" | bc)%"
# returns permissions to file
chmod +r maps/invalid/bad_perms.txt
rm -f tmp