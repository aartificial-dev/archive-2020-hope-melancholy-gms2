/// 330

scr_puzzle_init();

scr_puzzle_add_input(8, 1, 1, 555, noone);

scr_puzzle_add_block(2, 2, puzzle_node.n_transit);
scr_puzzle_add_block(2, 4, puzzle_node.n_transit);
scr_puzzle_add_block(8, 5, puzzle_node.n_transit);
scr_puzzle_add_block(5, 7, puzzle_node.n_transit);

scr_puzzle_add_block(6, 3, puzzle_node.n_multiplier);
scr_puzzle_add_block(4, 4, puzzle_node.n_multiplier);
scr_puzzle_add_block(6, 6, puzzle_node.n_multiplier);

scr_puzzle_add_block(8, 8, puzzle_node.n_breaker);

scr_puzzle_add_block(6, 1, puzzle_node.n_block);
scr_puzzle_add_block(6, 2, puzzle_node.n_block);
scr_puzzle_add_block(1, 7, puzzle_node.n_block);

scr_puzzle_add_power(1, 8, 1);

scr_puzzle_add_connection(2, 4, 2, 2);