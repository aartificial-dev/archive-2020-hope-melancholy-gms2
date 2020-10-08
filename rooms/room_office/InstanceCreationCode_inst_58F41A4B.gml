/// 555

scr_puzzle_init(10);

scr_puzzle_add_input(1, 1, 1, 329, noone);

scr_puzzle_add_power(1, 7, 1);

scr_puzzle_add_block(6, 7, puzzle_node.n_transit);
scr_puzzle_add_block(6, 1, puzzle_node.n_transit);
scr_puzzle_add_block(8, 4, puzzle_node.n_transit);

for (let i = 0; i < 7; i ++) {
	scr_puzzle_add_block(i, 4, puzzle_node.n_block);
}
scr_puzzle_add_block(6, 3, puzzle_node.n_block);
scr_puzzle_add_block(6, 5, puzzle_node.n_block);