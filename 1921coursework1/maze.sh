#!/bin/bash
# Test script for maze game

# invalid maze test
# student_mazes/invalid/IV1.txt maze do not have S
echo -n "Test invalid maze IV1"
./maze student_mazes/invalid/IV1.txt < input/input.in > tmp
if grep -q "Maze does not have start point (S)" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# student_mazes/invalid/IV2.txt maze do not have E
echo -n "Test invalid maze IV2"
./maze student_mazes/invalid/IV2.txt < input/input.in > tmp
if grep -q "Maze does not have exit point (E)" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# student_mazes/invalid/IV3.txt maze with too few columns
echo -n "Test invalid maze IV3"
./maze student_mazes/invalid/IV3.txt < input/input.in > tmp
if grep -q "Invalid maze: too few columns" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# student_mazes/invalid/IV4.txt maze with too few rows
echo -n "Test invalid maze IV4"
./maze student_mazes/invalid/IV4.txt < input/input.in > tmp
if grep -q "Invalid maze: too few rows" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# student_mazes/invalid/IV5.txt maze with too many columns
echo -n "Test invalid maze IV5"
./maze student_mazes/invalid/IV5.txt < input/input.in > tmp
if grep -q "Invalid maze: too many columns" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# student_mazes/invalid/IV6.txt maze with too many rows
echo -n "Test invalid maze IV6"
./maze student_mazes/invalid/IV6.txt < input/input.in > tmp
if grep -q "Invalid maze: too many rows" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# student_mazes/invalid/IV7.txt maze with invalid character
echo -n "Test invalid maze IV7"
./maze student_mazes/invalid/IV7.txt < input/input.in > tmp
if grep -q "Invalid maze: contains invalid characters" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# student_mazes/invalid/IV8.txt maze with invalid character
echo -n "Test invalid maze IV8"
./maze student_mazes/invalid/IV8.txt < input/input.in > tmp
if grep -q "Invalid maze: contains invalid characters" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# student_mazes/invalid/IV9.txt maze with different length each row
echo -n "Test invalid maze IV9"
./maze student_mazes/invalid/IV9.txt < input/input.in > tmp
if grep -q "Invalid maze: rows have different lengths" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# Game initialization test
echo -n "Test game initialization"
./maze student_mazes/valid/V1.txt < input/input.in > tmp
if grep -q "Game initialized with maze from student_mazes/valid/V1.txt" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# Simulate player movement test
echo -n "Test player move up"
./maze student_mazes/valid/V1.txt < input/input.in > tmp
# Simulate player moving up
if grep -q "Player moved up" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi   
echo -n "Test player move left"
./maze student_mazes/valid/V1.txt < input/input.in > tmp
# Simulate player moving left
if grep -q "Player moved left" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Test player move down"
./maze student_mazes/valid/V1.txt < input/input.in > tmp
# Simulate player moving down
if grep -q "Player moved down" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Test player move right"
./maze student_mazes/valid/V1.txt < input/input.in > tmp
# Simulate player moving right
if grep -q "Player moved right" tmp;
then 
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Test player move into the wall"
./maze student_mazes/valid/V1.txt < input/input.in > tmp
# Simulate player moving into a wall
if grep -q "Cannot move into wall" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Test player move off the map"
./maze student_mazes/valid/V1.txt < input/input.in > tmp
# Simulate player moving off the map
if grep -q "Cannot move off map" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# Simulate displaying the map test
echo -n "Test displaying the map"
echo "M" | ./maze student_mazes/valid/V1.txt < input/input.in > tmp
if grep -q "X" tmp; # Player's curret location
then
    echo "PASS"
else
    echo "FAIL"
fi

# Simulate reaching the exit test
echo -n "Test teaching the exit"
./maze student_mazes/valid/V1.txt < input/input.in > tmp
if grep -q "Reached E, and you have won!" tmp;
then 
    echo "PASS"
else
    echo "FAIL"
fi

# Simulate invalid move test
echo -n "Test invalid move"
echo "B" | ./maze student_mazes/valid/V1.txt < input/input.in > tmp   # Assuming 'B' is an invalid move
if grep -q " It is an invalid move " tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

expected_output="expected output"
# Check if expected output function is in the command output
echo -n "Check if win"
./maze student_mazes/valid/V1.txt < input/input.in > tmp
if grep -q "$expected_output" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi
