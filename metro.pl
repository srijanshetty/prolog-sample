%% Assignment 1: Delhi Metro
%% Due on: 30 Sep 2013 (Monday) before midnight.

%% Please fill the following details
%% Full Name: Srijan R Shetty
%% Roll No: 11727

%% Given below is the metro lines of New Delhi. Write a function
%% that given any two metro station prints out the route to take

%% For example typing
%%     > findRoute(dwarka,new-delhi).
%% should print
%%     > From dwarka take blue line to rajiv-chowk
%%     > From rajiv-chowk take yellow line to new-delhi

%% Concepts not done in class: Formated print, List functions.
%%

%% Remark: You code *should work* work even if the lines are changed.
%% In particular you should not assume anything about the names of the
%% station, or their ordering or the topology of the network. In other
%% words think of this red, blue and green line as a sample input to your
%% program.

line(yellow,[ vishwa-vidayala
            , vidhan-sabha
            , civil-lines
            , kashmiri-gate
            , chandini-chowk
            , chawari-bazar
            , new-delhi
            , rajiv-chowk
            , patel-chowk
            , central-secretariat
            ]
    ).

line(blue,[ indraprastha
          , pragati-maidan
          , mandi-house
          , barakhamba-road
          , rajiv-chowk
          , ramakrishna-ashram-marg
          , jhandewala
          , karol-bagh
          , rajendra-place
          , patel-nagar
          , shadipur
          , kirti-nagar
          , moti-nagar
          , ramesh-nagar
          , rajouri-garden
          , tagore-garden
          , subhash-nagar
          , tilak-nagar
          , janakpuri-east
          , janakpuri-west
          , uttam-nagar-east
          , uttam-nagar-west
          , nawada
          , dwarka-mor
          , dwarka
          , sector-14-dwarka
          , sector-13-dwarka
          , sector-12-dwarka
          , sector-11-dwarka
          , sector-10-dwarka
          , sector-9-dwarka
          ]).

line(red,
	[ rithala,
          rohini-east,
          rohini-west,
          pitam-pura,
          kohat-enclave,
          netaji-subash-place,
          keshav-puram,
          kanhaiya-nagar,
          indralok,
          shastri-nagar,
          pratap-nagar,
          pul-bangesh,
          tiz-hazari,
          kashmiri-gate,
          shastri-park,
          seelam-pur,
          welcome,
          shahdara,
          mansarovar-park,
          jhilmil,
          dilshad-garden
        ]
    ).

line(black, [kanpur,dwarka,mumbai]).

line(grey, [kanpur,new-delhi]).

%change the input from findRoute/2 to findroute/4 with the unallowed routes set
%to [] and currentToure to []
findRoute(X,Y):-findRoute(X,Y,[],[]).

%%%%%%%%%%%%%%% DIRECT ROUTE %%%%%%%%%%%%%%
%Firstly we consider a route from X to Y not using any of the Lines specified in
%Lines and using only a sinlge line
findRoute(X,Y,Lines,Output):-line(Line,Stations),\+ member(Line,Lines),member(X,Stations),member(Y,Stations),append(Output,[[X,Line,Y]],NewOutput),print(NewOutput).

%%%%%%%%%%%%%% INDIRECT ROUTE %%%%%%%%%%%%%
%Next we consider an indirect route from X to Y not using any of the routes
%specified in Lines via an intermediate station Intermediate
findRoute(X,Y,Lines,Output):-line(Line,Stations),\+ member(Line,Lines),member(X,Stations),member(Intermediate,Stations),X\=Intermediate,Intermediate\=Y,append(Output,[[X,Line,Intermediate]],NewOutput),findRoute(Intermediate,Y,[Line|Lines],NewOutput).

%prints a formatted output
print([]).
print([H|T]):-format('from ~w take ~w line to ~w\n', H),print(T).

