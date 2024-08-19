GP ?= gp -q

dirichlet_characters.txt dirichlet_groups.txt galois_characters.txt:
	echo "generate_data(5, 250);" | $(GP) characters.gp
