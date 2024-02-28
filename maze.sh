#!/bin/bash
# Test script for maze game

# Game initialization test
echo -n "Test game initialization"
./maze maze_file.txt<input.in>tmp
if grep -q "Game initialized with maze from maze_file.txt" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# Simulate player movement test
echo -n "Test player move up"
./maze maze_fle.txt<input.in>tmp
# Simulate player moving up
if grep -q "Player moved up" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi   
echo -n "Test player move left"
./maze maze_fle.txt<input.in>tmp
# Simulate player moving left
if grep -q "Player moved left" tmp;
then
    echo "PASS"
else
    echo "FAIL
fi
echo -n "Test player move down"
./maze maze_fle.txt<input.in>tmp
# Simulate player moving down
if grep -q "Player moved down" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi
echo -n "Test player move right"
./maze maze_fle.txt<input.in>tmp
# Simulate player moving right
if grep -q "Player moved right" tmp;
then 
    echo "PASS"
else
    echo "FAIL"
fi
echo -n "Test player move into the wall"
./maze maze_fle.txt<input.in>tmp
# Simulate player moving into a wall
if grep -q "Cannot move into wall" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi
echo -n "Test player move off the map"
./maze maze_fle.txt<input.in>tmp
# Simulate player moving off the map
if grep -q "Cannot move off map" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# Simulate displaying the map test
echo -n "Test displaying the map"
echo "M" | ./maze maze_file.txt<input.in>tmp
if grep -q "X" tmp; # Player's curret location
then
    echo "PASS"
else
    echo "FAIL"
fi

# Simulate reaching the exit test
echo -n "Test teaching the exit"
./maze maze_file.txt<input.in>tmp
if grep -q " Reached E and you have won " tmp;
then 
    echo "PASS"
else
    echo "FAIL"
fi

# Simulate invalid move test
echo -n "Test invalid move"
echo "B" | ./maze maze_file.txt<input.in>tmp   # Assuming 'B' is an invalid move
if grep -q " It is an invalid move " tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# Run the tests
test_initialize_game
test_player_movement
test_display_map
test_reach_exit
test_invalid_movement

# Check if expected output function is in the command output
echo -n "Check if win"
./maze maze_file.txt<input.in>tmp
if grep -q "$1" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi
