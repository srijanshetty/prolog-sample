route(X,Y):-edge(X,Y).
route(X,Y):-edge(X,C),route(C,Y).

edge(1,2).
edge(2,3).
edge(1,4).
