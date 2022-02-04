male(abdul).
male(asad).
male(tajul).
male(saidul).
male(saiful).
male(shajib).
male(sadaf).
male(milon).
male(soad).
male(ariyan).
male(zayan).
male(ramim).
male(rabib).


female(rahatun).
female(saleha).
female(rehena).
female(sohana).
female(noori).
female(snigdha).
female(era).
female(shuchi).
female(samira).
female(eva).
female(rusa).
female(arusa).
female(zara).


spouse(abdul,rahatun).
spouse(asad, saleha).
spouse(tajul,rehena).
spouse(saidul,sohana).
spouse(saiful,noori).
spouse(shajib,snigdha).
spouse(sadaf,era).
spouse(milon,shuchi).
spouse(ruhan,eva).
spouse(ariyan,rusa).
spouse(zayan,arusa).


father(asad,abdul).
father(tajul,abdul).
father(saidul,asad).
father(saiful,asad).
father(snigdha,tajul).
father(soad,saidul).
father(samira,saidul).
father(shuchi,saiful).
father(sadaf,shajib).
father(ariyan,sadaf).
father(eva,milon).
father(rabib,ruhan).
father(ramim,ruhan).
father(zara,zayan).

first_cousin(X,Y):-
    grandparent(X,Z),
    grandparent(Y,Z),
    X\=Y,
    not(sibling(X,Y)).

second_cousin(X,Y):-
    greatgrandparent(X,Z),
    greatgrandparent(Y,Z),X\=Y,
    not(first_cousin(X,Y)),
    not(sibling(X,Y)).

third_cousin(X,Y):-
    greatgreatgrandparent(X,Z),
    greatgreatgrandparent(Y,Z),
    X\=Y,
    not(second_cousin(X,Y)),
    not(sibling(X,Y)).

first_cousin_once_removed(X,Y):-
    father(Y,Z),
    first_cousin(X,Z),
    X\=Y.

first_cousin_twice_removed(X,Y):-
   grandparent(Y,Z),
   first_cousin(X,Z),
   X\=Y.

second_cousin_once_removed(X,Y):-
    father(Y,Z),
    second_cousin(X,Z),
    X\=Y.

second_cousin_twice_removed(X,Y):-
    grandparent(Y,Z),
    second_cousin(X,Z),
    X\=Y.

third_cousin_once_removed(X,Y):-
    parent(Y,Z),
    third_cousin(Z,X),
    X\=Y.
third_cousin_twice_removed(X,Y):-
    grandparent(Z,Y),
    third_cousin(X,Z),
    X\=Y.

sibling(X,Y):-
    parent(X,Z),
    parent(Y,Z),
    X\=Y.

mother(X,Y):-
    father(X,Z),
    spouse(Z,Y),
    X\=Y,
    female(Y).

parent(X,Y):-
    (father(X,Y);
    mother(X,Y)),
    X\=Y.

grandparent(X,Y):-
    parent(X,Z),
    parent(Z,Y),
    X\=Y.

greatgrandparent(X,Y):-
    grandparent(X,Z),
    parent(Z,Y),
    X\=Y.

greatgreatgrandparent(X,Y):-
    greatgrandparent(X,Z),
    parent(Z,Y),
    X\=Y.





