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

% Section 3

noOfVotesPerSenator(1).
noOfSenatorsPerState(2).
durationOfSenator(6).
senators(choosenBy(legislature)).
senateOfUS(X, Y, Z, W) :-
    senators(X),
    noOfSenatorsPerState(Y),
    noOfVotesPerSenator(Z),
    durationOfSenator(W).

firstClass(vacatedAt(secondYear)).
secondClass(vacatedAt(fourthYear)).
thirdClass(vacatedAt(sixthYear)).
divisionOfSenate(X, Y, Z) :- firstClass(X), secondClass(Y), thirdClass(Z).
vacancies(byResignation; recessOfLegislature).
tempArrang(executive, vacancies, nextMeetingOfLegislature).

age_qualified_Senator(S,X) :- age(S,X), X >=36.
citizen_qualified_Senator(S,Y) :- citizen(S,Y), Y >=9.
state_qualified_Senator(S,X) :- inhabitantOf(state).
qualified_Senator([S,X,Y,Z]) :-
    age_qualified_Senator(S,X),
    citizen_qualified_Senator(S,Y),
    state_qualified_Senator(S,Z).

vPOTUS(presidentOf(senateOfUS)).
votingVPOTUS(equalHouse).

otherOfficers(absenceOf(vPOTUS); officeOFTPOTUS(vPOTUS)).
presidentProTempore(absenceOf(vPOTUS)).

powerOfImpeachement(senateOfUS, oath; affirmation, present(twothirdOfMembers).).
trialOfPOTUS(present(twothirdOfMembers), present(chiefJustice)).

successfulImpeachement(senator(X)) :-
    removalFromOffice(X),
    disqualification(X),
    noTrust(X); noProfit(X).

successfulImpeachement(party(X)) :-
    indictment(X),
    trial(X),
    judgment(X),
    punishment(X).

% Section 4

legislature(elections(time), elections(place), elections(manner)).
congress(elections(time), elections(place), elections(manner), notChoosing(senators)).

assemblyOfCongress(X) :- 
    (onceEveryYear(X), firstMondayOfDecember(X));
    appointedByLaw(X).

% Section 5

judgeOfElections(house).
returnsOfMembers(house).
qualificationsOfMembers(house).
quorumForBuisness(house, majority).
adjournHouse(house, X) :- X < majority.
absentMembers(house, penalties).

rulesOfProceedings(house).
punishMembers(house, disorderlyBehaviour).
expelMember(house, disorderlyBehaviour, twothirdOfMembers).

journalOfProceedings(house).
publishJOP(house, notPublish(requireSecrecy), answersToQuestions(onefifthOfPresent)).

adjournHouse(congress, consentOfOtherHouse, Place) :- Place =!= twoHousesSitting.
adjournHouse(congress, Days, Place) :- 
    Days<4,
    Place =!= twoHousesSitting.

% Section 6

senators(compensation(ascertainedByLaw, paidByTreasury)).
representatives(compensation(ascertainedByLaw, paidByTreasury)).
priviligedFromArrest(attendanceAt, house).
priviligedFromArrest(goingTo, house).
priviligedFromArrest(returningFrom, house).
priviligedFromArrest(speech, house).
priviligedFromArrest(debate, house).
priviligedFromArrest(except(treason)).
priviligedFromArrest(except(felony)).
priviligedFromArrest(except(breachOfPeace)).
senators(priviligedFromArrest(X)).
senators(questioned, house).

appointmentToCivilOffice(notAllowed(senators, whileElected)).
appointmentToCivilOffice(notAllowed(representatives, whileElected)).
memberOfHouse(notAllowed(memberOfCivilOffice)).
