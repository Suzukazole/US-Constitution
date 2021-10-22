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

officeOfTrust(ash).     %test cases for notElector.
officeOfProfit(bsh).    %test cases for notElector.

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
% presidentVotes/2 defines how many votes a person has got for the office of president.
% vicePresidentVotes/2 defines how many votes a person has got for the office of vice president.
% maxPresidentVotes/1 is true if the person has the maximum votes for the office of president.
% maxVicePresidentVotes/1 is true if the person has the maximum votes for the office of vice president.
% isPresident/1 is  ture if the person is the president.
% isVicePresident/1 is true if the person is the vice president.
% eligible_for_vicePresident/1 is true if the person is eligible for president.
% timeOfElection/1 defines who can determine the time of election.
% citizenEligible/1 is true if the person is an eligible citizen.
% ageEligible/1 is true if the person is eligible by age.
% compensation/1 defines that the body has a fixed compensation.
% oathPresident/1 defines the oath of the president.


votes(elector, president).
votes(elector, vicePresident).

state(elector1, michigan).          % test cases for notElector
state(elector2, massachusetts).     % test cases for notElector
state(elector3, california).        % test cases for notElector
state(president, massachusetts).    % test cases for notElector
state(vicePresident, california).   % test cases for notElector

stateCmp(X, president):- state(president, S1), state(X, S2), S1 = S2.
stateCmp(X, vicePresident):- state(vicePresident, S1), state(X, S2), S1 = S2.
notElector(Person) :- stateCmp(Person, president).
notElector(Person) :- stateCmp(Person, vicePresident).

presidentVotes(person1, 50).        % test cases for isPresident
presidentVotes(person2, 60).        % test cases for isPresident
vicePresidentVotes(person3, 70).    % test cases for isVicePresident
vicePresidentVotes(person4, 60).    % test cases for isVicePresident

maxPresidentVotes(Person) :- 
    presidentVotes(Person, X),
    presidentVotes(_, Y),
    X > Y.

maxVicePresidentVotes(Person) :- 
    vicePresidentVotes(Person, X),
    vicePresidentVotes(_, Y),
    X > Y.

isPresident(Person) :- maxPresidentVotes(Person).
isVicePresident(Person) :- maxVicePresidentVotes(Person). 

eligible_for_vicePresident(Person) :- eligible_for_president(Person).

% Amendment 20
% Section 3 


timeOfElection(congress).

citizenEligible(Person) :-
    citizen(Person, Y),
    Y>=14.
ageEligible(Person) :-
    age(Person, Y),
    Y>= 35.

eligible_for_president(Person) :-
    citizenEligible(Person),
    ageEligible(Person).

% Amendment 25.
% newPresident/1 defines who the next president is.
% nominate/1 defines when the vice president will be nominated.
% actingPresident/1 defines when vice president becomes the acting president.

% test facts for Amendment 25
removedFromOffice(president).       % if the president is removed from office.
death(president).                   % if the president dies.
resignation(president).             % if the president resigns.
vacancies(vicePresident).           % if there are vacancies for vice president office.
congressConsent(true).              % if the congress consents.

% written declarations of various bodies.
%% instructions: comment out any of the declarations to test under what conditions the vice president is appointed as an acting President.

writtenDeclaration(president, "unable to discharge the powers and duties of his office").
writtenDeclaration(vicePresident, "president is unable to discharge the powers and duties of his office").
writtenDeclaration(executive, "president is unable to discharge the powers and duties of his office").

%section 1
newPresident(vicePresident) :-
    removedFromOffice(president);
    death(president);
    resignation(president).

%section 2 
nominate(vicePresident) :-
    vacancies(vicePresident),
    congressConsent(true).

%section 3
actingPresident(vicePresident):-
    writtenDeclaration(president, _).

%section 4
actingPresident(vicePresident):-
    writtenDeclaration(vicePresident, _),
    writtenDeclaration(executive, _).

compensation(president).
oathPresident("I do solemnly swear (or affirm) that I will faithfully execute the Office of President of the United States, and will to the best of my Ability, preserve, protect and defend the Constitution of the United States").

% Section 2 (Article 2)

% senatorsConsent/2 tells if the senators consent or not to the statement in the first argument.
% commanderInChiefOfArmy/1 defines who the commander in chief of the army is.
% commanderInChiefOfNavy/1 defines who the commander in chief of the navy is.
% commanderInChiefOfMilitia/1 defines who the commander in chief of the militia is.


senatorsConsent("to make Treaties", true).      % set 2nd argument as true if consent is obtained.
commanderInChiefOfArmy(president).
commanderInChiefOfNavy(president).
commanderInChiefOfMilitia(president).

isImpeachement(true).     % set as true if case of impeachement
isRecess(true).           % set as true if recess of the senate.

power(president, grant(reprieves)) :- isImpeachement(true).
power(president, grant(pardon(offenseAgainstUS))) :- isImpeachement(true).
power(president, "to make Treaties"):- senatorsConsent("to make Treaties", Consent), Consent=true.
power(president, appoint(ambassadors)).
power(president, appoint(publicMinisters)).
power(president, appoint(consuls)).
power(president, appoint(judges)).
power(president, appoint("other offices of the United States")).
power(president, fillVacancies) :- isRecess(true).

% Section 3 (Article 2)
% informationOfState/2 tells if the first argument passes information of the state to the second argument.
% duty/2 lists the duty of the body in the second argument.
% recieve/2 defines the support that the president recieves.

ifDisagreement(true).       % set as true if both the houses are in disagreement.

informationOfState(president, congress).
power(president, "convene both Houses").
power(president, adjourn("both Houses")) :- ifDisagreement(true).

recieve(president, [ambassadors, publicMinisters]).

duty(president, ensure("laws are faithfully executed")).
duty(president, commission("other officers of the United States")).

% Section 4 (Article 2)
% convicted/2 defines what the body in the first argument is convicted of.
% removedFromOffice/1 tells if the body can be removed from the office.

%% convicted test cases, set the second argument of convicted 
%% as: treason, bribery, highCrimes as appropriate.

convicted(president, treason).          
convicted(vicePresident, bribery).
convicted(civilOfficers, highCrimes).

removedFromOffice(president) :- isImpeachement(true), convicted(president, _).
removedFromOffice(vicepPresident) :- isImpeachement(true), convicted(vicePresident, _).
removedFromOffice(civilOfficers) :- isImpeachement(true), convicted(civilOfficers, _).


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