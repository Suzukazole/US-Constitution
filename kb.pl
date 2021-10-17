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

legislativePower(congress).
legislativePower(X) :- consist(Y,X), legislativePower(Y).
consist(congress,senate).
consist(congress,houseOfRepresentatives).
% composed(X,Y,Z) :- consist(X,Y), consist(X,Z).

%Section 2

% Article 2
% Section 1

% executivePower/1 defines which body has executive power.
% term/2 defines the term of the first argument in the second argument.

executivePower(president).
term(president,4).
term(vice_president,4).

notElector(Person) :- senator(Person); representative(Person).

% elector(X,Y) = houseOfRepresentatives(X,Z),senator(X,A),Y=Z+A.
% qualified([X|T],elector) :- post(X,Y), Y \=senator, Y\=representative, Y\=person_holding_office, Y\=person_earning_profit, qualified([X|T],elector).


% age_qualified(H,president) :- age(H,X), X >=35.
% citizen_qualified(H,president) :- citizen(H,Y), Y >=14.
% qualified([X|T],president) :- citizenship(X,natural_born),age_qualified(X,president),citizen_qualified(H,president).
% qualified(X|T,president) :- citizenship(X,citizen_at_adoption_constitution),age_qualified(X,president),citizen_qualified(H,president).

% removal(X,president) :- reason(X,death).
% removal(X,president) :- reason(X,resignation).
% removal(X,president) :- reason(X,inability_to_discharge).
% reelection(X,president) :- elect(X,congress), 




% Ammendment 12
votes(elector, "President").
votes(elector, "Vice president").
maxPresidentVotes(Person, "President").
maxVicePresidentVotes(Person, "Vice president").
eligible_for_vicePresident(Person):- eligible_for_president(Person).

% Ammendment 20 section 3



citizenEligible(Person):- citizen(Person, Y), Y>=14.
ageEligible(Person):- age(Person, Y), Y>= 35.

eligible_for_president(Person) :-
    citizenEligible(Person),
    ageEligible(Person).

% ammendment 25.


compensation(president).
oathPresident("I do solemnly swear (or affirm) that I will faithfully execute the Office of President of the United States, and will to the best of my Ability, preserve, protect and defend the Constitution of the United States").


    
