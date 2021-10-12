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

% Functors used:
% legislativePower/1 defines which body has legislative power
% consist/2 has the body in second argument that is contained in first argument
% composed/3 holds if the bodies in the second and third arguments are contained in the first

consist(congress,senate).
consist(congress,houseOfRepresentatives).
legislativePower(congress).
legislativePower(X) :- consist(Y,X), legislativePower(Y).
% composed(X,Y,Z) :- consist(X,Y), consist(X,Z).

% ----------------------------------------------

%Section 2

% Functors used:
% elected/4 says X who is inhabitant of the state Y is elected by third argument to the state Z
% age_qualified_HOR/2 holds if the age of first argument is atleast 25 years
% citizen_qualified_HOR/2 holds if citizenship of first argument is at least 7 years
% state_qualified_HOR/2 holds if first argument is elected by the people to the same state (fourth argument) the person lives in(second argument)
% qualified/2 has the names of those in first argument who are qualified for an election/appointment for the position in second argument
% members/1 conatins the list of people who qualify to be a representative
% consist/2 has the body in second argument that is contained in first argument
% term/2 states that the duration of the term for first argument is second argument number of years
% stateOfUS/1 declares that the argument is a state of the US
% meetingOfCongress/3 Arguments are date for when the congress should assemble
% enum_done/1 puts time limit within which enumeration has to be done for that term
% total/3 finds length of the list in first argument and puts it in third argument
% num_representatives/1 has a list of number of representatives in each state, and gives upper and lower bounds on representation


elected(X,Y,people,Z).
age_qualified_HOR(H,X) :- age(H,X), X >=25.
citizen_qualified_HOR(H,Y) :- citizen(H,Y), Y >=7.
state_qualified_HOR(H,X) :- elected(H,X,people,X).
qualified([H|T],houseOfRepresentatives) :- age_qualified_HOR(H,X), citizen_qualified_HOR(H,Y), state_qualified_HOR(H,P,Q),qualified(T,houseOfRepresentatives).
members(X) :- qualified([X|T],houseOfRepresentatives); member(X,T).
consist(houseOfRepresentatives, members(X)).
term(members(X),2).

stateOfUS(rhodeisland).
meetingOfCongress(D, M, Year).
enum_done(X) :- meetingOfCongress(D, M, Year), X >= Year, X <= Year + 3, enum_done(Y), X - Y <= 10.
total([H|T], A, N) :- total(T, A-1, N).
total([],A,A). 
num_representatives(Y) :- Y = [H|T], H>=1, total(Y, 0, N), N <= *(/(1,30000), populationOfUS).
until_enum_representatives(stateOfUS(newHampshire), 3).
until_enum_representatives(stateOfUS(massachusetts), 8).
until_enum_representatives(stateOfUS(rhodeisland), 1).
until_enum_representatives(stateOfUS(connecticut), 5).
until_enum_representatives(stateOfUS(newYork), 6).
until_enum_representatives(stateOfUS(newJersey), 4).
until_enum_representatives(stateOfUS(pennsylvania), 8).
until_enum_representatives(stateOfUS(delaware), 1).
until_enum_representatives(stateOfUS(maryland), 6).
until_enum_representatives(stateOfUS(virginia), 10).
until_enum_representatives(stateOfUS(northCarolina), 5).
until_enum_representatives(stateOfUS(southCarolina), 5).
until_enum_representatives(stateOfUS(georgia), 3).

power(executive_authority, issueWritsOfElection) :- num_representatives(StateOfUs(X), Y), Y = 0.
power(houseOfRepresentatives, impeachment(X)).
choose(houseOfRepresentatives, speaker).
choose(houseOfRepresentatives, officers).

% ----------------------------------------------

% Section 8
% Check this section
% Functors used


power(congress, lay(tax)).
power(congress, collect(tax)).
power(congress, lay(duties)).
power(congress, collect(duties)).
power(congress, lay(imposts)).
power(congress, collect(imposts)).
power(congress, lay(excises)).
power(congress, collect(excises)).
power(congress, pay(debts)).
power(congress, provide(common_defence)).
power(congress, provide(general_welfare)).

% Check this once
power(congress, borrow(money_on_credit_of_US)).

% Check this once
power(congress, regulate(commerce_with_foreign_nations)).
power(congress, regulate(commerce_among_states)).
power(congress, regulate(commerce_with_indian_tribes)).

power(congress, coin(money)).
power(congress, regulate(currency_value)).
power(congress, fix(standard_weights)).
power(congress, fix(standard_measures)).

power(congress, define(piracies)).
power(congress, punish(piracies)).
power(congress, define(felonies_on_high_seas)).
power(congress, punish(felonies_on_high_seas)).
power(congress, define(offense_against_laws)).
power(congress, punish(offense_against_laws)).

power(congress, declare(war(X,Y))).
power(congress, grant(letter_of_marque)).
power(congress, grant(letter_of_reprisal)).
power(congress, make_rules(caputures_on_land_and_water)).


power(congress, raise(armies)).
power(congress, support(armies)).

power(congress, provide(navy)).
power(congress, maintain(navy)).

power(congress, make_rules(government)).
power(congress, make_rules(regulate(land_forces))).
power(congress, make_rules(regulate(navy))).






