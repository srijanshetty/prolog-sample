memList(X,[X|_]).
memList(X, [_|Y]):-memList(X,Y).
