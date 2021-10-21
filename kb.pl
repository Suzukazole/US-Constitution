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

% Article 1 Section 1

% legislativePower/1 defines which body has legislative power
% consist/2 has the body in second argument that is contained in first argument
% composed/3 holds if the bodies in the second and third arguments are contained in the first

legislativePower(congress).
legislativePower(X) :- consist(Y,X), legislativePower(Y).
consist(congress,senate).
consist(congress,houseOfRepresentatives).
% composed(X,Y,Z) :- consist(X,Y), consist(X,Z).

% Article 1 Section 3

% noOfVotesPerSenator/1 specifies the number of votes a senator can cast 
% noOfSenatorsPerState/1 specifies the number of senators per state
% durationOfSenator/1 specifies the duration of years a person will serve as a senator
% senator/1 refers to senators
% choosenBy/1 implies selected by the variable passed
% senateOfUS/4 checks validity of the whole senate
% electors/1 checks requisite qualifications
% firstClass/1 checks if there have been vacancies after specified years
% vacatedAt/1 checks the year of vacancy
% divisionOfSenate/3 checks the division of senate
% tempArrang/2 basic requisite for temporary arrangements 
% vacancies/3 checks all the conditions required to fill a vacancy
% fillVacancies/1 the filled vacancy has been allowed by the passed variable
% age_qualified_Senatot/2 holds if the age of first argument is atleast 36 years
% citizen_qualified_Senator/2 holds if citizenship of first argument is at least 9 years
% state_qualified_Senator/2 holds if first argument is elected by the people to the same state (fourth argument) the person lives in(second argument)
%  qualified_Senator/1 has the names of those in first argument who are qualified for an election/appointment for the position in second argument
% vPOTUS/1 specifies vice president of the US 
% votingVPOTUS/1 specifies the voting power of the vice president
% otherOfficers/1 votes of other officers when required
% powerOfImpeachement/3 conditions required for an impeachement to take place
% trialOfPOTUS/2 conditions required for a trial of the president of the US
% successfulImpeachement/1 actions taken after successful impeachement


noOfVotesPerSenator(1).
noOfSenatorsPerState(2).
durationOfSenator(6).
senators(choosenBy(legislature)).
senateOfUS(X, Y, Z, W) :-
    senators(X),
    noOfSenatorsPerState(Y),
    noOfVotesPerSenator(Z),
    durationOfSenator(W).
electors(requisiteQualifications).

firstClass(vacatedAt(secondYear)).
secondClass(vacatedAt(fourthYear)).
thirdClass(vacatedAt(sixthYear)).
divisionOfSenate(X, Y, Z) :- firstClass(X), secondClass(Y), thirdClass(Z).

% Changes due to Amendment 17
% vacancies(byResignation; recessOfLegislature).
% tempArrang(executive, vacancies, nextMeetingOfLegislature).
tempArrang(legislature, stateOfUS(Y)).
vacancies(senateOfUS(state), executiveAuthority(issueWrits), tempArrang(X)).
fillVacancies(legislature).

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

powerOfImpeachement(senateOfUS, (oath; affirmation), present(twothirdOfMembers).).
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

% Article 1 Section 4

% legislature/3 pertaining to elections conducted
% congress/3 pertaining to elections conducted
% assemblyOfCongress/1 procedings when the congress assembels 

legislature(elections(time), elections(place), elections(manner)).
congress(elections(time), elections(place), elections(manner), notChoosing(senators)).

assemblyOfCongress(X) :- 
    (onceEveryYear(X), thirdDayOfJan(X), time(noon(X))); % Changes due to Amendment 20 Section 2
    appointedByLaw(X).

% Article 1 Section 5

% judgeOfElections/1 checks for presence in house
% returnsOfMembers/1 checks for presence in house
% qualificationsOfMembers/1 checks for presence in house
% quorumForBuisness/2 checks for presence in house and its majority
% adjournHouse/2 to check if the house should be adjourned
% absentMembers/2 checks for presence in house and penalise if absent 
% rulesOfProceedings/1 checks for rules of house
% punishMembers/2 checks for presence in house and punishes members exhibiting disorderly behaviour
% journalOfProceedings/1 note down the events in house
% publishJOP/3 publish the events in house
% adjournHouse/3 conditions to adjourn the house

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

% Article 1 Section 6

% senators/1 the monetary compensation received by senators, priviliged from arrest and being questioned
% representatives/1 the monetary compensation received by representatives
% priviligedFromArrest/2 conditions which provide immunity from arrest 
% appointmentToCivilOffice/1 to check if a person can be appointment To Civil Office

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


% Article 3 Section 1

% judicialPower/2 is the judicial Power given to different courts 
% compensation/1 salary received by judges
% judges/3 positions of a judge 

judicialPower(supremeCourt).
judicialPower(lowerCourts, ordain(congress)).
compensation(basePay).
judges(supremeCourt, goodBehaviour, compensation(X)) :- X > basePay .
judges(lowerCourts, goodBehaviour, compensation(X)) :- X > basePay .

% Article 3 Section 2

% jury/2 checks for the opinion of the jury 

judicialPower(caseOflaw, appellateJurisdictionSC).
judicialPower(caseOfequity, appellateJurisdictionSC).
judicialPower(caseOfAmbassadors, supremeCourt).
judicialPower(caseOfPublicMinister, supremeCourt).
judicialPower(caseOfConsuls, supremeCourt).
judicialPower(caseOfAdmirality, appellateJurisdictionSC).
judicialPower(caseOfMaritime, appellateJurisdictionSC).
judicialPower(controversiesOfUS, appellateJurisdictionSC).
judicialPower(controveries, stateOfUS(X), stateOfUS(Y), supremeCourt) :- X =\= Y.
judicialPower(controveries, stateOfUS(X), citizenOf(stateOfUS(Y)), supremeCourt).
judicialPower(landsOfDiffStates, citizenOf(stateOfUS(X)), citizenOf(stateOfUS(X))).
judicialPower(landsOfDiffStates, citizenOf(stateOfUS(X)), stateOfUS(Y)).

% Changes due to Amendment XI
% judicialPower(landsOfDiffStates, citizenOf(stateOfUS(X)), foreignState(Y)).
% judicialPower(landsOfDiffStates, stateOfUS(X), foreignState(Y), supremeCourt).

jury(trialOfCrimes(X), stateOfUS(Y)) :- X =\= impeachement .
jury(trialOfCrimes(X), foreignState(Y), congress) :- X =\= impeachement .

% Article 3 Section 3

% treasonAgainstUS/1 treasons against US 
% convictOfTreason/2 convicts a person of treason
% declarePunishmentOfTreason/1 the body having the power to declare punishment of treason
% attainerOfTreason/1 effects of being convicted of treason 

treasonAgainstUS(war).
treasonAgainstUS(adheringToEnemies).
treasonAgainstUS(adheringToEnemies, (aid; comfort)).
convictOfTreason(testimonyOf(twoWitnesses), act).
convictOfTreason(testimonyOf(twoWitnesses), confessionInOpenCourt).

declarePunishmentOfTreason(congress).
attainerOfTreason(cannotWork(corruptionOfBlood)).
attainerOfTreason(cannotWork(forfeiture)).

% Preamble to the Bill of Rights

% assemblyOfCongress/3 conditions required for assembly Of Congress
% conventions/2 conventions followed by judicial bodies
% resolvedBy/4 resolving issues between different judicial bodies pertaining to amendments
% proposedTo/3 amendments proposed to 
% articles/2 conditions for a article to be passed

assemblyOfCongress(place(newYork), day(wednesday), date(D, M, Y)) :- D =:= 4, M =:= march, Y =:= 1789.
conventions([H|T]) :- stateOfUS(H), conventions(T).
conventions(preventMisconstruction, addClauses).
conventions(preventAbuseOfPower, addClauses).

resolvedBy(senateOfUS, houseOfRepresentatives, assemblyOfCongress, bothHouses(twothirdOfMembers)).
proposedTo(legislature(stateOfUS(X)), amendments, ratifiedBy(threefourthOfLegislatures)).

articles(proposedBy(congress), ratifiedBy(legislatureOf(stateOfUS(X)))).

% Amendment 1

% powerless/2 cases where an individual or an institution does not have any influence
% right/2 rights available to citizens of the US 

amendmentapproved(1, 15, 12, 1791).

powerless(congress, establishmentOfReligion).
powerless(congress, prohibitionOf(freeExcersiseOfReligion)).
right(people, freedomOfSpeech).
right(people, freedomOfPress).
right(people, freedomToPeacefullyAssemble).
right(people, petitionFor(redressOfGrievances)).

% Amendment 2

amendmentapproved(2, 15, 12, 1791).

right(people, keepAndBearArms).

% Amendment 3

amendmentapproved(3, 15, 12, 1791).

right(soldier, timeOfPeace(cannot(quartaredInHouse))).
right(soldier, timeOfPeace(permissionOfOwner(quartaredInHouse))).
right(soldier, timeOfWar(cannot(quartaredInHouse))).
right(soldier, timeOfWar(permissionOfOwner(quartaredInHouse))).

% Amendment 4

% secure/1 cases when an individual or an institution has immunity
% supportedBy/1 supported By these laws

amendmentapproved(4, 15, 12, 1791).

secure(inTheirPersons).
secure(inTheirHouses).
secure(ofTheirPapers).
right(people, secure(X)).
powerless(government, unreasonableSearchesAndSeizures).
powerless(government, warrants).
supportedBy(oaths).
supportedBy(affirmation).
havePower(government, warrants, supportedBy(X)).

% Amendment 5

% required/2 conditions required to conduct a trial against serious Criminal Charges

amendmentapproved(5, 15, 12, 1791).
required(grandJury, seriousCriminalCharges).
inService(war).
inService(publicDanger).
right(people, inService(X), noTrial).
right(people, sameOffence, noTrial).
right(people, againstSelfIncrimination, noTrial).
right(people, witnessAgainstHimself).
right(people, life).
right(people, liberty).
right(people, property).

% Amendment 6

amendmentapproved(6, 15, 12, 1791).
right(accused, speedyAndPublicTrial).
right(accused, trialByAnImpartialJury, in(stateOfUS(district(X)))).
right(accused, informationAboutNatureAndCauseOfAccusation).
right(accused, confrontedWithWitnessesAgainstHim).
right(accused, obtainWitnessesInHisFavour).
right(accused, assistanceOfDefenceCounsel).

% Amendment 7

amendmentapproved(7, 15, 12, 1791).
controversy(X).
right(people, trialByJury, controversy(X)) :- X > 20.

% Amendment 8

% notRequired/1 cases where certain actions are not required 

amendmentapproved(8, 15, 12, 1791).
notRequired(excessiveBail).
notRequired(excessiveFines).
notRequired(cruelPunishments).
notRequired(unusualPunishmnets).
right(people, notRequired(X)).

% Amendment 9

amendmentapproved(9, 15, 12, 1791).
right(people, deny, retainedBy(otherPeople)).
right(people, disparage, retainedBy(otherPeople)).

% Amendment 10

amendmentapproved(10, 15, 12, 1791).
reservedTo(stateOfUS(X)).
reservedTo(people).
powerNotDelegatedtoUS(byConstitution, reservedTo(X)).

% Amendment 20 Section 1

% endOfTerm/2 specifies the date and time of the end of term of the elected representatives

amendmentpassed(20,2,3,1932).
amendmentapproved(20, 23,1,1933).

endOfTerm(president, day(D,M,T)) :- D =:= 20, M =:= january, T =:= 1200.
endOfTerm(vPOTUS, day(D,M,T)) :- D =:= 20, M =:= january, T =:= 1200.
endOfTerm(senators, day(D,M,T)) :- D =:= 3, M =:= january, T =:= 1200.
endOfTerm(representatives, day(D,M,T)) :- D =:= 3, M =:= january, T =:= 1200.

% Amendment 20 Section 4

death(president, choosenBy(houseOfRepresentatives)).
death(vPOTUS, choosenBy(senateOfUS)).

% Amendment 20 Section 5

% amendmentenforced/5 states that amendment number in first argument, section number in the second argument, was passed on the date in third argument, month in fourth and year in fifth

amendmentenforced(20,1,15,10,1933).
amendmentenforced(20,2,15,10,1933).

% Amendment 20 Section 6

% amendmentOperative/3 states the amendment number in the first argument, second argument consists of the orignal document which is to be ratified and the third argument checks if it has been passed

amendmentOperative(20, toConstitution, passed(legislatureOf(stateOfUS(X), A), Y)) :- A>=0.75, Y<7.

% Amendment 24 Section 1

amendmentpassed(24,27,8,1962).
amendmentapproved(24, 23,1,1964).

right(citizen, vote(election)).

% Amendment 24 Section 2

power(congress, enforce(amendment(24))).
