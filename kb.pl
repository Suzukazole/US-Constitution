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
consist(congress,senate).
consist(congress,houseOfRepresentatives).
composed(X,Y,Z) :- consist(X,Y), consist(X,Z).