#!/bin/bash

chmod +x test.sh

# removed the permissions of the maze to test for bad permissions
chmod -r maps/invalid/bad_perms.txt



# testing errors in arguments
echo -e "~~ Argument Tests ~~"
echo -n "Test no arguments - "
./program > tmp
if grep -q "Usage: Program <filename>" tmp;
then
    echo -e "   \e[32mPASS\e[0mm"
else
    echo -e "   \e[31mFAIL\e[0m"
fi


echo -n "Test 2 arguments - "
./program y z > tmp
if grep -q "Usage: Program <Maze file>" tmp;
then
    echo -e "   \e[32mPASS\e[0mm"
else
    echo -e "   \e[31mFAIL\e[0m"
fi


echo -e "\n~~ File Handling~~"
echo -n "Test bad mapname - "
./program noexist.txt > tmp
if grep -q "Error: unknown map" tmp;
then
    echo -e "   \e[32mPASS\e[0mm"
else
    echo -e "   \e[31mFAIL\e[0m"
fi


echo -n "Test bad permissions - "
./program maps/invalid/bad_perms.txt > tmp
if grep -q "Error: Bad permissions" tmp;
then
    echo -e "   \e[32mPASS\e[0mm"
else
    echo -e "   \e[31mFAIL\e[0m"
fi

echo -n "Testing successful file loading - "
./program maps/valid/reg_5x5.txt > tmp
if grep -q "Map has loaded succesfully" tmp;
then
    echo -e "\e[32mPASS\e[0mm"
else
    echo -e "\e[31mFAIL\e[0m"
fi

echo -e "\n~~Maze generation~~"
echo -n "test empty maze array - "
./program maps/invalid/Empty_map.txt > tmp
if grep -q "Map is not valid" tmp;
then
    echo -e "\e[32mPASS\e[0mm"
else
    echo -e "\e[31mFAIL\e[0m"
fi

echo -n "test maze 101 by 5 - "
./program maps/invalid/HeightToBig.txt > tmp
if grep -q "Map is not valid" tmp;
then
    echo -e "\e[32mPASS\e[0mm"
else
    echo -e "\e[31mFAIL\e[0m"
fi


echo -n "test maze 5 by 101 - "
./program maps/invalid/WidthToBig.txt > tmp

if grep -q "Map is not valid" tmp;
then
    echo -e "\e[32mPASS\e[0mm"
else
    echo -e "\e[31mFAIL\e[0m"
fi




echo -n "test maze 4 by 100 - "
./program maps/invalid/HeightToSmall.txt > tmp

if grep -q "Map is not valid" tmp;
then
    echo -e "\e[32mPASS\e[0mm"
else
    echo -e "\e[31mFAIL\e[0m"
fi


echo -n "test maze 5 by 101 - "
./program maps/invalid/WidthToSmall.txt > tmp
if grep -q "Map is not valid" tmp;
then
    echo -e "\e[32mPASS\e[0mm"
else
    echo -e "\e[31mFAIL\e[0m"
fi




echo -n "test Irregular height - "
./program maps/invalid/ireg_height_5x5.txt > tmp
if grep -q "Map is not valid" tmp;
then
    echo -e "\e[32mPASS\e[0mm"
else
    echo -e "\e[31mFAIL\e[0m"
fi




echo -n "test Irregular Width - "
./program maps/invalid/ireg_width_5x5.txt > tmp
if grep -q "Map is not valid" tmp;
then
    echo -e "\e[32mPASS\e[0mm"
else
    echo -e "\e[31mFAIL\e[0m"
fi





echo -n "test maze 5 by 100 - "
./program maps/valid/100x5.txt > tmp
if grep -q "Map has loaded succesfully" tmp;
then
    echo -e "\e[32mPASS\e[0mm"
else
    echo -e "\e[31mFAIL\e[0m"
fi



echo -e "\n~~Symbol Precense~~"
echo -n "no start present - "
./program maps/invalid/MissingStart.txt > tmp
if grep -q "Start is missing" tmp;
then
    echo -e "\e[32mPASS\e[0mm"
else
    echo -e "\e[31mFAIL\e[0m"
fi


echo -n "no End present - "
./program maps/invalid/MissingEnd.txt > tmp
if grep -q "End is not present" tmp;
then
    echo -e "\e[32mPASS\e[0mm"
else
    echo -e "\e[31mFAIL\e[0m"
fi


echo -n "Multiple start present - "
./program maps/invalid/MultipleStart.txt > tmp
if grep -q "More than one start is present" tmp;
then
    echo -e "\e[32mPASS\e[0mm"
else
    echo -e "\e[31mFAIL\e[0m"
fi



echo -n "Multiple End present - "
./program maps/invalid/MultipleEnd.txt > tmp
if grep -q "more than one end is present" tmp;
then
    echo -e "\e[32mPASS\e[0mm"
else
    echo -e "\e[31mFAIL\e[0m"
fi



echo -e "\n~~player input~~"
echo -n "Testing unknown input - "
./program maps/valid/direction_testing.txt < inputs/unknown_input.txt > tmp
if grep -q "Unknown Input detected" tmp;
then
    echo -e "\e[32mPASS\e[0mm"
else
    echo -e "\e[31mFAIL\e[0m"
fi



echo -n "Testing W input - "
./program maps/valid/direction_testing.txt < inputs/Move_up.txt > tmp
if grep -q "You pressed W" tmp;
then
    echo -e "\e[32mPASS\e[0mm"
else
    echo -e "\e[31mFAIL\e[0m"
fi



echo -n "Testing A input - "
./program maps/valid/direction_testing.txt < inputs/Move_left.txt > tmp
if grep -q "You pressed A" tmp;
then
    echo -e "\e[32mPASS\e[0mm"
else
    echo -e "\e[31mFAIL\e[0m"
fi


echo -n "Testing S input - "
./program maps/valid/direction_testing.txt < inputs/Move_down.txt > tmp
if grep -q "You pressed S" tmp;
then
    echo -e "\e[32mPASS\e[0mm"
else
    echo -e "\e[31mFAIL\e[0m"
fi


echo -n "Testing D input - "
./program maps/valid/direction_texting.txt < inputs/Move_right.txt > tmp
if grep -q "You have moved right" tmp;
then
    echo -e "\e[32mPASS\e[0mm"
else
    echo -e "\e[31mFAIL\e[0m"
fi


echo -e "\n~~Boundaries and walls~~"
echo -n "test wall above - "
./program maps/valid/wall_testing.txt < inputs/Move_up.txt > tmp
if grep -q "You hit a wall" tmp;
then
    echo -e "\e[32mPASS\e[0mm"
else
    echo -e "\e[31mFAIL\e[0m"
fi



echo -n "test left wall - "
./program maps/valid/wall_testing.txt < inputs/Move_left.txt > tmp
if grep -q "You hit a wall" tmp;
then
    echo -e "\e[32mPASS\e[0mm"
else
    echo -e "\e[31mFAIL\e[0m"
fi



echo -n "test Wall below - "
./program maps/valid/wall_testing.txt < inputs/Move_down.txt > tmp
if grep -q "You hit a wall" tmp;
then
    echo -e "\e[32mPASS\e[0mm"
else
    echo -e "\e[31mFAIL\e[0m"
fi


echo -n "test right wall - "
./program maps/valid/wall_texting.txt < inputs/Move_right.txt > tmp
if grep -q "You hit a wall" tmp;
then
    echo -e "\e[32mPASS\e[0mm"
else
    echo -e "\e[31mFAIL\e[0m"
fi



echo -e "\n~~Goal~~"
echo -n "reaching the goal - "
./program maps/valid/reg_5x5.txt < inputs/Goal.txt > tmp;
if grep -q "you have reached the goal!" tmp;
then
    echo -e "\e[32mPASS\e[0mm"
else
    echo -e "\e[31mFAIL\e[0m"
fi



chmod +r maps/invalid/bad_perms.txt
rm -f tmp