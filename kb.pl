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
% officeOfTrust/1 indicates if the person holds an office of trust.
% officeOfProfit/1 indicates if the person holds an office of profit. 
% notElector/1 is true if the person is not eligible for being an elector.

executivePower(president).
term(president,4).
term(vicePresident,4).

officeOfTrust(ash). %test cases for notElector.
officeOfProfit(bsh). %test cases for notElector.

notElector(Person) :- officeOfTrust(Person).
notElector(Person) :- officeOfProfit(Person).

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




% Amendment 12

% votes/2 defines who the elector can vote for(president, vice president).
% state/2 defines the state of the first argument in the second argument.
% statecmp/2 is true if the state of the first argument equals the state of the second argument.
% notElector/1 is true if the person is from same state as either the president or the vice president. 

votes(elector, president).
votes(elector, vicePresident).

state(elector1, michigan). %test cases for notElector
state(elector2, massachusetts). %test cases for notElector
state(elector3, california). %test cases for notElector
state(president, massachusetts). %test cases for notElector
state(vicePresident, california). %test cases for notElector

stateCmp(X, president):- state(president, S1), state(X, S2), S1 = S2.
stateCmp(X, vicePresident):- state(vicePresident, S1), state(X, S2), S1 = S2.
notElector(Person) :- stateCmp(Person, president).
notElector(Person) :- stateCmp(Person, vicePresident).

maxPresidentVotes(Person, president).
maxVicePresidentVotes(Person, vicePresident).
eligible_for_vicePresident(Person):- eligible_for_president(Person).

% Amendment 20 section 3

citizenEligible(Person):- citizen(Person, Y), Y>=14.
ageEligible(Person):- age(Person, Y), Y>= 35.

eligible_for_president(Person) :-
    citizenEligible(Person),
    ageEligible(Person).


%Amendment 25.
%section 1
newPresident(vicePresident):- removedFromOffice(president); death(president); resignation(president).

%section 2 
nominate(vicePresident):- vacancies(vicePresident), congressConsent(true).

%section 3
actingPresident(vicePresident):- writtenDeclaration(president, "unable to discharge the powers and duties of his office").

%section 4
actingPresident(vicePresident):- writtenDeclaration(vicePresident, "president is unable to discharge the powers and duties of his office"), writtenDeclaration(executive, "president is unable to discharge the powers and duties of his office").

compensation(president).
oathPresident("I do solemnly swear (or affirm) that I will faithfully execute the Office of President of the United States, and will to the best of my Ability, preserve, protect and defend the Constitution of the United States").


% Section 2 

senatorsConsent("to make Treaties", true). 
commanderinchief(president, "Army", "Navy", "Militia").
power(president, "Grant Reprieves").
power(president, "Pardons for Offenses").
power(president, "to make Treaties"):- senatorsConsent("to make Treaties", Consent), Consent=true.
power(president, "appoint Ambassadors").
power(president, "appoint public Ministers").
power(president, "appoint consuls").
power(president, "appoint Judges").
power(president, "appoint other offices of the United States").
power(president, "fill vacancies during recess").

% Section 3
informationofState(president, congress).
power(president, "convene both Houses").

%section 4

removedFromOffice(member(X, [president, vice_president, "all civil Officers"]), Reason):- member(Reason, ["Treason", "Bribery", "high crimes"]). 

%Article 6
debtsvalid(confederation).
lawOfTheLand(constitution).
boundBy(judges, lawOfTheLand(constitution)).
boundBy(senator, oath(constitution)).
boundBy(executive, oath(constitution)).
boundBy(legislature, oath(constitution)).
boundBy(judges, oath(constitution)).

%Amendment 11 
noJudicialPower(federal, state).


%Amendment 21

%section 1
article(18, "repealed").

%section 2
prohibitedInUS(violation("state liquour laws")).

%section 3
ammendmentInoperative(27):- ratifiedAmmendment(27).

%amendment 27 
varyCompensation(senator, houseOfRepresentatives, nextElections).