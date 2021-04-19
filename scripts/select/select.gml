/// @description  select(n, choice0, choice1, ..)
/// @param n
/// @param  choice0
/// @param  choice1
/// @param  ..

function select() { return argument[clamp(argument[0] + 1, 1, argument_count - 1)]; }