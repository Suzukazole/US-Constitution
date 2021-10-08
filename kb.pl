/* 
Name:
ID:

Name:
ID:

Name:
ID:

Name:
ID:
*/

% ----------- Facts copied for implementation of test cases---------------

age(rohan, 23).
citizen(rohan, 23).
age(meera, 30).
citizen(meera, 8).
age(david, 35).
citizen(david, 35).
age(leonard, 40).
citizen(leonard, 40).
age(amy, 38).
citizen(amy, 5).
stateOfUS(newHampshire).
stateOfUS(massachusetts).
stateOfUS(connecticut).
stateOfUS(newYork).
stateOfUS(newJersey).
stateOfUS(pennsylvania).
stateOfUS(delaware).
stateOfUS(maryland).
stateOfUS(virginia).
stateOfUS(northCarolina).
stateOfUS(southCarolina).
stateOfUS(georgia).
monday(7, 1, 2019).
monday(2, 12, 2019).

% Article 1
% Section 1

% legislativePower/1 defines which body has legislative power
% consist/2 has the body in second argument that is contained in first argument
% composed/3 holds if the bodies in the second and third arguments are contained in the first

consist(congress,senate).
consist(congress,houseOfRepresentatives).
legislativePower(congress).
legislativePower(X) :- consist(Y,X), legislativePower(Y).
% composed(X,Y,Z) :- consist(X,Y), consist(X,Z).

----------------------------------------------

%Section 2

% elected/4 says X who is inhabitant of the state Y is elected by third argument to the state Z
% age_qualified_HOR/2 holds if the age of first argument is atleast 25 years
% citizen_qualified_HOR/2 holds if citizenship of first argument is at least 7 years
% state_qualified_HOR/2 holds if first argument is elected by the people to the same state (fourth argument) the person lives in(second argument)
% qualified/2 has the names of those in first argument who are qualified for an election/appointment for the position in second argument
% members/1 conatins the list of people who qualify to be a representative
% consist/2 has the body in second argument that is contained in first argument
% term/2 states that the duration of the term for first argument is second argument number of years

elected(X,Y,people,Z).
age_qualified_HOR(H,X) :- age(H,X), X >=25.
citizen_qualified_HOR(H,Y) :- citizen(H,Y), Y >=7.
state_qualified_HOR(H,X) :- elected(H,X,people,X).
qualified([H|T],houseOfRepresentatives) :- age_qualified_HOR(H,X), citizen_qualified_HOR(H,Y), state_qualified_HOR(H,P,Q),qualified(T,houseOfRepresentatives).
members(X) :- qualified([X|T],houseOfRepresentatives); member(X,T).
consist(houseOfRepresentatives, members(X)).
term(members(X),2).
% consist(houseOfRepresentatives, elector(X)).


----------------------------------------------

% Section 3



