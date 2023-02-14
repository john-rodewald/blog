+++
title = "Red Black Tree"

[taxonomies]
tags = ["programming","data-structures"]
+++
A red-black tree is a binary search tree with additional properties that make it self-balancing. The rules are:

- Each node is either black or red
- The root node is black
- Leaf nodes are black
- A red node only has black children
- The number of black nodes encountered from the root to any leaf node is the same

Insertion or removal operations can alter the tree's structure and put it in an invalid state. Therefore, when implementing a red-black tree, a validity check must follow after these operations.

If the tree is found to be invalid, an efficient way to correct its structure is through *[rotations](https://www.codesdope.com/course/data-structures-red-black-trees-insertion/)*. 
