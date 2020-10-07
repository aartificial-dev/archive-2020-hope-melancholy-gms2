/// 329

scr_puzzle_init(10);

scr_puzzle_add_input(8, 1, 5, 329, noone);

scr_puzzle_add_power(1, 1, 1);
scr_puzzle_add_power(1, 8, 1);
scr_puzzle_add_power(8, 8, 1);

scr_puzzle_add_block(6, 3, puzzle_node.n_multiplier);

scr_puzzle_add_block(4, 2, puzzle_node.n_transit);
scr_puzzle_add_block(7, 5, puzzle_node.n_transit);

scr_puzzle_add_block(4, 1, puzzle_node.n_block);
scr_puzzle_add_block(5, 1, puzzle_node.n_block);
scr_puzzle_add_block(1, 4, puzzle_node.n_block);
scr_puzzle_add_block(1, 5, puzzle_node.n_block);
scr_puzzle_add_block(8, 4, puzzle_node.n_block);
scr_puzzle_add_block(8, 5, puzzle_node.n_block);
scr_puzzle_add_block(4, 8, puzzle_node.n_block);
scr_puzzle_add_block(5, 8, puzzle_node.n_block);