% Declare letter/1 as dynamic so it can be modified at runtime
:- dynamic letter/1.

% Initial set of letters (a, b, c)
letter(a).
letter(b).
letter(c).

% Main menu loop
start :-
    nl,
    write('Hi, This is the "Name Game".'), nl,
    write('You will be given a set of English letters in which you will add, delete or move to create your name.'), nl, nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice....'), nl,
    read(Choice),
    action(Choice).

% 1- Display the current set of letters 
action(1) :-
    nl, write('Current letters: '), nl,
    display_letters,
    start.

% 2- Add a letter using assert/1
action(2) :-
    write('Enter letter to add: '), read(L),
    assert(letter(L)),
    write('Letter added.'), nl,
    start.

% 3- Add a letter at the top using asserta/1
action(3) :-
    write('Enter letter to add at the top: '), read(L),
    asserta(letter(L)),
    write('Letter added at the top.'), nl,
    start.

% 4- Add a letter at the bottom using assertz/1
action(4) :-
    write('Enter letter to add at the bottom: '), read(L),
    assertz(letter(L)),
    write('Letter added at the bottom.'), nl,
    start.

% 5- Delete a letter using retract/1 
action(5) :-
    write('Enter letter to delete: '), read(L),
    retract(letter(L)),
    write('Letter deleted.'), nl,
    start.

% 5b- Fallback if the letter does not exist 
action(5) :-
    write('Letter not found!'), nl,
    start.

% 6- Delete all letters 
action(6) :-
    retractall(letter(_)),
    write('All letters deleted.'), nl,
    start.

% 7- Exit
action(7) :-
    nl, write('Goodbye!'), nl.

% Catch-all for invalid choices
action(_) :-
    write('Invalid selection, please try again.'), nl,
    start.

% Helper predicate using fail/0 to print all facts
display_letters :-
    letter(X),
    writeln(X),
    fail.
display_letters.
