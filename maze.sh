#!/bin/bash
# Test script for maze game

# Game initialization test
echo -n "Test game initialization"
output=$(./maze maze_file.txt)
if echo "$output" |grep -q "Game initialized with maze from maze_file.txt"
then
    echo "PASS"
else
    echo "FAIL"
fi

# Simulate player movement test
echo -n "Test player move up"
output=$(./maze maze_fle.txt)
# Simulate player moving up
if echo "$output" | grep -q "Player moved up"
then
    echo "PASS"
else
    echo "FAIL"
fi   
echo -n "Test player move left"
output=$(./maze maze_fle.txt)
# Simulate player moving left
if echo "$output" | grep -q "Player moved left"
then
    echo "PASS"
else
    echo "FAIL
fi
echo -n "Test player move down"
output=$(./maze maze_fle.txt)
# Simulate player moving down
if echo "$output" | grep -q "Player moved down"
then
    echo "PASS"
else
    echo "FAIL"
fi
echo -n "Test player move right"
output=$(./maze maze_fle.txt)
# Simulate player moving right
if echo "$output" | grep -q "Player moved right"
then 
    echo "PASS"
else
    echo "FAIL"
fi
echo -n "Test player move into the wall"
output=$(./maze maze_fle.txt)
# Simulate player moving into a wall
if echo "$output" | grep -q "Cannot move into wall"
then
    echo "PASS"
else
    echo "FAIL"
fi
echo -n "Test player move off the map"
output=$(./maze maze_fle.txt)
# Simulate player moving off the map
if echo "$output" | grep -q "Cannot move off map"
then
    echo "PASS"
else
    echo "FAIL"
fi

# Simulate displaying the map test
echo -n "Test displaying the map"
output=$(echo "M" | ./maze maze_file.txt)
if echo "$output" | grep -q "X" # Player's curret location
then
    echo "PASS"
else
    echo "FAIL"
fi

# Simulate reaching the exit test
echo -n "Test teaching the exit"
output=$(./maze maze_file.txt)
if echo "$output" | grep -q " Reached E and you have won "
then 
    echo "PASS"
else
    echo "FAIL"
fi

# Simulate invalid move test
echo -n "Test invalid move"
output=$(echo "B" | ./maze maze_file.txt) # Assuming 'B' is an invalid move
if echo "$output" | grep -q " It is an invalid move "
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
output=$(./maze maze_file.txt)
if echo "$output" | grep -q "$1";
then
    echo "PASS"
else
    echo "FAIL"
fi
