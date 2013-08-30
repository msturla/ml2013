function ret = game_finished(M)
	res = get_game_result(M);
	ret = res >= 0;
end