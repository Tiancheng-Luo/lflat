
:- object(paratembFA,
	instantiates(fa)).

	initial(1).

	transitions([
		1/c/1, 1/a/2, 1/b/3,
		2/c/2, 2/a/1, 2/b/4,
		3/c/3, 3/b/3, 3/a/4,
		4/c/4, 4/b/4, 4/a/3
	]).

	finals([3]).

:- end_object.



:- object(paratembL,
	instantiates(language)).

	:- initialization((
		contests::setup,
		contests::diagnostics(paratembL),
		contests::check_definition(fa, paratembFA),
		contests::diagnostics(paratembFA),
		contests::check_deterministic(paratembFA),
		contests::test_mechanism(paratembL, paratembFA),
		contests::finish_checking
	)).

	alphabet([a,b,c]).

	positive([b]).
	positive([b,c]).
	positive([a,b,a]).
	positive([b,b]).
	positive([a,a,b,b]).
	positive([b,b,a,a]).
	positive([b,a,a,a,b,b,a,b]).

	negative([]).
	negative([a,b,b,b]).
	negative([a,a]).
	negative([a,a,a,b]).
	negative([a,a,a,a,a]).

:- end_object.
