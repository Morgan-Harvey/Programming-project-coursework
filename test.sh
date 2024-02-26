#!/bin/bas

chmod +x <test.sh>

# count the number of tests completed
((all_counter++))


./Program > tep
echo -e "~~Symbol testing~~\n"
echo -n "players testing"

if grep ;
then
    echo "\e[32mPASS\e[0mm"
    ((pass_counter++))
else
    echo "\e[31mFAIL\e[0m"
fi

echo -e "~~player input~~\n"

echo -n "Testing W input"

if grep -q ";
then
    echo "\e[32mPASS\e[0mm"
    ((pass_counter++))
else
    echo "\e[31mFAIL\e[0m"
fi

echo -n "Testing W input
echo -n "Testing A input"
echo -n "Testing S input"
echo -n "Testing D input"
echo -n "Testing unknown input"


echo -e "~~Maze generation~~\n"
echo -n "test empty maze array"
echo -n "test maze 101 by 5"
echo -n "test maze 101 by 4"
echo -n "test maze 4 by 100"
echo -n "test maze 5 by 101"

if grep ... ;
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
echo -n "players testing"

echo -n "~~players testing~~\n"
echo -n "~~players testing"


echo -n "~~ tests complete~~ "
echo -n "Total tests: $all_counter"
echo -n "Passed tests: $pass_counter"
echo -n "Percentage passed: $(echo "scale=2; $pass_counter*100 / $all_counter"