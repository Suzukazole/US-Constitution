/* 
Name: A.Sudarshan
ID: 2019B4A70744P

Name: Ashwin Murali
ID: 2019B2A70957P

Name: Hari Sankar
ID: 2019B3A70564P

Name: Ruchir Kumbhare
ID: 2019B5A70650P
*/

% ----------- Facts copied for implementation of test cases---------------

% Informs system that arguments of this predicate mught not be together
:- discontiguous age/2.
:- discontiguous citizen/2.
:- discontiguous consist/2.
:- discontiguous stateOfUS/1.
:- discontiguous power/2.
:- discontiguous nocoin/2.
:- discontiguous nogrant/2.
:- discontiguous lay/2.
:- discontiguous amendmentpassed/4.
:- discontiguous amendmentapproved/4.
:- discontiguous sum/3.
:- discontiguous right/2.
:- discontiguous notdenied/2.
:- discontiguous qualified/2.
:- discontiguous senator/2.
:- discontiguous senators/1.
:- discontiguous judicialPower/2.
:- discontiguous powerless/2.
:- discontiguous jury/2.
:- discontiguous tempArrang/2.
:- discontiguous vacancies/3.
:- discontiguous fillVacancies/1.
:- discontiguous assemblyOfCongress/3.
:- discontiguous members/1.
:- discontiguous successfulImpeachement/1.
:- discontiguous crime/2.
:- discontiguous bill_passed/2.
:- discontiguous term/2.
:- discontiguous notElector/2.
:- discontiguous notElector/1.
:- discontiguous actingPresident/1.
:- discontiguous removedFromOffice/1.
:- discontiguous presidentVotes/2.
:- discontiguous vicePresidentVotes/2.
:- discontiguous compensation/1.
:- discontiguous votes/2.
:- discontiguous state/2.
:- discontiguous stateCmp/2.
:- discontiguous maxPresidentVotes/1.
:- discontiguous maxVicePresidentVotes/1.
:- discontiguous isPresident/1.
:- discontiguous isVicePresident/1.
:- discontiguous eligible_for_vicePresident/1.
:- discontiguous notQualified/2.
:- discontiguous notChosen/2.
:- discontiguous actingPresident/1.
:- discontiguous death/1.
:- discontiguous resignation/1.
:- discontiguous vacancies/1.
:- discontiguous congressConsent/1.
:- discontiguous writtenDeclaration/2.
:- discontiguous newPresident/1.
:- discontiguous nominate/1.


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


% ARTICLE 1 Section 1


% Functors used:
% legislativePower/1 defines which body has legislative power
% consist/2 has the body in second argument that is contained in first argument
% composed/3 holds if the bodies in the second and third arguments are contained in the first
% populationOfUS/1 states the population of US

populationOfUS(10). %Fact to use further
consist(congress,senate).
consist(congress,houseOfRepresentatives).
legislativePower(congress).
legislativePower(X) :- consist(Y,X), legislativePower(Y).

% ----------------------------------------------

% ARTICLE 1 Section 2

% Functors used:
% elected/4 says X who is inhabitant of the state Y is elected by third argument to the state Z
% age_qualified_HOR/1 holds if the age of the argument is atleast 25 years
% citizen_qualified_HOR/1 holds if citizenship of the argument is at least 7 years
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
% sum/3 calculates the sum elements of the list in first argument using accumulator in second argument and saves result in last argument
% right/2 states that the right in second argument holds for first argument
% male/1 holds if the person (name in argument) is a male
% female/1 holds if the person (name in argument) is a female
% denied/2 holds if the right in first argument is denied on account of second argument
% notdenied/2 holds if the right in first argument can't be denied on account of second argument

age(george, 50). %Fact added to test right/2 and other functors
citizen(george, 45). %Fact added to test right/2 and other functors
age(raghu, 45). %Fact added to test right/2 and other functors
citizen(raghu, 45). %Fact added to test right/2 and other functors
age(katie, 30). %Fact added to test right/2 and other functors
citizen(katie, 20). %Fact added to test right/2 and other functors
age(emma, 20). %Fact added to test right/2 and other functors
citizen(emma, 5). %Fact added to test right/2 and other functors
age(sundar, 45). %Fact added to test right/2 and other functors
citizen(sundar, 40). %Fact added to test right/2 and other functors
elected(david, massachusetts, people, massachusetts). % Fact added to test elected/4
elected(leonard, connecticut, people, connecticut). % Fact added to test elected/4
elected(meera, newJersey, people, newYork). % Fact added to test elected/4
elected(george, delaware, people, delaware). % Fact added to test elected/4
age_qualified_HOR(H) :- age(H,X), X >=25.
citizen_qualified_HOR(H) :- citizen(H,Y), Y >=7.
state_qualified_HOR(H,X) :- stateOfUS(X), elected(H,X,people,X).

qualified(H,houseOfRepresentatives) :- age_qualified_HOR(H), citizen_qualified_HOR(H), state_qualified_HOR(H,Q).

members(X) :- qualified([X|T],houseOfRepresentatives); member(X,T).
consist(houseOfRepresentatives, members(X)).
term(members(X),2).

% Changes due to Amendment 14 Section 2
sum([H|T], A, S) :- A = A1 + H, sum(T, A1, S).
sum([], A, A).

% sum([No_of_FreePersons, No_of_Indians_not_taxed], 0, CountOfRepresentatives) is the template of this functor
sum([8, 1], 0, CountOfRepresentatives).

right(A,B).

% Changes due to Amendment 26 Section 1
notdenied(right(Y, vote_elect(X)), on_account_of_age) :- citizen(Y,Z), age(Y, Age), Age >= 18.

male(rohan). %Fact added to test right/2 and other functors
male(david). %Fact added to test right/2 and other functors
male(leonard). %Fact added to test right/2 and other functors
male(george). %Fact added to test right/2 and other functors
male(raghu). %Fact added to test right/2 and other functors
male(sundar). %Fact added to test right/2 and other functors
female(X) :- \+male(X).

% sum([No_of_FreePersons, No_of_Indians_not_taxed, -(0, /(A, Males_above_18))], 0, CountOfRepresentatives) is the template of this functor
% [rohan, david, leonard, george, raghu, sundar] is list of males above 18
% [leonard, george, raghu] is list of males above 18 and denied vote due to any reason
sum([8,  1, -(0, /(A, 6))], 0, ReducedCountOfRepresentatives) :- length([leonard, george, raghu], A), male(X), denied(right(X, vote_elect(elector_for_President)), _).
sum([8,  1, -(0, /(A, 6))], 0, ReducedCountOfRepresentatives) :- length([leonard, george, raghu], A), male(X), denied(right(X, vote_elect(elector_for_Vice_President)), _).
sum([8,  1, -(0, /(A, 6))], 0, ReducedCountOfRepresentatives) :- length([leonard, george, raghu], A), male(X), denied(right(X, vote_elect(representative_in_congress)), _).
sum([8,  1, -(0, /(A, 6))], 0, ReducedCountOfRepresentatives) :- length([leonard, george, raghu], A), male(X), denied(right(X, vote_elect(executive_officers)), _).
sum([8,  1, -(0, /(A, 6))], 0, ReducedCountOfRepresentatives) :- length([leonard, george, raghu], A), male(X), denied(right(X, vote_elect(judicial_officers)), _).
sum([8,  1, -(0, /(A, 6))], 0, ReducedCountOfRepresentatives) :- length([leonard, george, raghu], A), male(X), denied(right(X, vote_elect(members_of_legislature)), _).
sum([8,  1, -(0, /(A, 6))], 0, ReducedCountOfRepresentatives) :- length([leonard, george, raghu], A), male(X), denied(right(X, vote_elect(members_of_legislature)), _).
sum([8,  1, -(0, /(A, 6))], 0, ReducedCountOfRepresentatives) :- length([leonard, george, raghu], A), male(X), abridges_immunities(X,Y), abridges_privelegies(X,Y), Y = true.

stateOfUS(rhodeisland). %Fact added to be used further
meetingOfCongress(04, 07, 1861). %Fact added to test enum_done/1 and other fns
meetingOfCongress(02, 12, 1861). %Fact added to test enum_done/1 and other fns
meetingOfCongress(07, 12, 1863). %Fact added to test enum_done/1 and other fns
meetingOfCongress(05, 12, 1864). %Fact added to test enum_done/1 and other fns
meetingOfCongress(03, 01, 2019). %Fact added to test enum_done/1 and other fns
enum_done(1862).
enum_done(X) :- meetingOfCongress(D, M, Year), X >= Year, =<(X, +(Year,3)).
total([H|T], A, N) :- total(T, A-1, N).
total([],A,A). 
num_representatives(Y) :- Y = [H|T], H>=1, total(Y, 0, N), =<(N,*(/(1,30000)) , populationOfUS(X)).
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

power(executive_authority, issueWritsOfElection) :- num_representatives(stateOfUS(X), Y), Y = 0.
impeachement(david).
power(houseOfRepresentatives, impeachment(X)).
choose(houseOfRepresentatives, speaker).
choose(houseOfRepresentatives, officers).

%--------------------------------------------------------

% ARTICLE 1 Section 3

% Functors used
% noOfVotesPerSenator/1 specifies the number of votes a senator can cast 
% noOfSenatorsPerState/1 specifies the number of senators per state
% durationOfSenator/1 specifies the duration of years a person will serve as a senator
% senator/2 refers to senator name in first argument and second argument says who chose the senator
% choosenBy/1 implies selected by the variable passed
% senate/4 checks validity of the whole senate
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
% votingpower_vicePresident/1 specifies the voting power of the vice president
% otherOfficers/1 votes of other officers when required
% powerOfImpeachement/3 conditions required for an impeachement to take place
% trialOfPOTUS/2 conditions required for a trial of the president of the US
% successfulImpeachement/1 actions taken after successful impeachement


noOfVotesPerSenator(1).
noOfSenatorsPerState(2).
durationOfSenator(6).
senator(obama, choosenBy(legislature)).% Fact added to test senator/2
senator(kamala, choosenBy(legislature)).% Fact added to test senator/2

senate(X, Y, Z, W) :-
    senator(X,choosenBy(legislature)),
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
vacancies(senate(state), executiveAuthority(issueWrits), tempArrang(X)).
fillVacancies(legislature).

age_qualified_Senator(S,X) :- age(S,X), X >=36.
citizen_qualified_Senator(S,Y) :- citizen(S,Y), Y >=9.
state_qualified_Senator(S,X) :- inhabitantOf(state).
qualified_Senator([S,X,Y,Z]) :-
    age_qualified_Senator(S,X),
    citizen_qualified_Senator(S,Y),
    state_qualified_Senator(S,Z).

presidentOfSenate(vicePresident).
votingpower_vicePresident(equalHouse).

otherOfficers(absenceOf(vPOTUS); officeOFTPOTUS(vPOTUS)).
presidentProTempore(absenceOf(vPOTUS)).

powerOfImpeachement(senate, (oath; affirmation), present(twothirdOfMembers)).
trialOfPOTUS(present(twothirdOfMembers), present(chiefJustice)).

senator(john).% Fact added to test senator/1
removalFromOffice(john).% Fact added to test removalFromOffice/1
disqualification(john).% Fact added to test disqualification/1
noTrust(john).% Fact added to test noTrust/1
noProfit(john).% Fact added to test noProfit/1

successfulImpeachement(senator(X)) :-
    removalFromOffice(X),
    disqualification(X),
    noTrust(X); noProfit(X).

party(republicans). % Fact added to test party/1
indictment(republicans). % Fact added to test indictment/1
trial(republicans). % Fact added to test trial/1
judgment(republicans). % Fact added to test judgment/1
punishment(republicans). % Fact added to test punishment/1

successfulImpeachement(party(X)) :-
    indictment(X),
    trial(X),
    judgment(X),
    punishment(X).

%--------------------------------------------------------

% ARTICLE 1 Section 4

% Functors used
% legislature/3 pertaining to elections conducted
% congress/3 pertaining to elections conducted
% assemblyOfCongress/1 procedings when the congress assembels 

legislature(elections(time), elections(place), elections(manner)).
congress(elections(time), elections(place), elections(manner), notChoosing(senators)).

time(noon(12)).% Fact added to test time/1
assemblyOfCongress(3, january, time(X)).% Fact added to test assemblyOfCongress/3
appointedByLaw(constitution).% Fact added to test appointedByLaw/1

assemblyOfCongress(D,M,T,X) :- 
    (onceEveryYear(D), thirdDayOfJan(M), time(noon(T))); % Changes due to Amendment 20 Section 2
    appointedByLaw(X).

%--------------------------------------------------------

% ARTICLE 1 Section 5

% Functors used
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
adjournHouse(house, 0.3).% Fact added to test adjournHouse/2
adjournHouse(house, X) :- X < 0.5.
absentMembers(house, penalties).

rulesOfProceedings(house).
punishMembers(house, disorderlyBehaviour).
members(0.7).% Fact added to test members/1
expelMember(house, disorderlyBehaviour, members(X)) :- X>0.66.

journalOfProceedings(house).
publishJOP(house, notPublish(requireSecrecy), answersToQuestions(onefifthOfPresent)).

adjournHouse(congress, consentOfOtherHouse, oneHouseSitting).% Fact added to test adjournHouse/3
adjournHouse(congress, 2, oneHouseSitting).% Fact added to test adjournHouse/3

adjournHouse(congress, consentOfOtherHouse, Place) :- Place =\= twoHousesSitting.
adjournHouse(congress, Days, Place) :- 
    Days<4,
    Place =\= twoHousesSitting.

%--------------------------------------------------------

% ARTICLE 1 Section 6

% Functors used
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
senators(questioned_by_house).

appointmentToCivilOffice(notAllowed(senators, whileElected)).
appointmentToCivilOffice(notAllowed(representatives, whileElected)).
memberOfHouse(notAllowed(memberOfCivilOffice)).

%--------------------------------------------------------

% ARTICLE 1 Section 7

%Functors used
%bill_to_law/1 contiains the name of law which has to passed
%bill_passed/2 contains the people in power who have to pass the bill and the name of the bill.
%order_passed/2 contains who passed it and name of the order.
%resolution_passed/2 contains who passed it and name of the resolution.
%vote_passed/2 contains who passed it and for what they voted.

bill_passed(houseOfRepresentatives,job_for_everyone).
bill_passed(senate,job_for_everyone).
bill_passed(president,job_for_everyone).
raise(revenue_bills).
propose(amendments_bills).
concor(amendments_bills).
power(houseofRepresentatives, raise(revenue_bills)).
power(senate, propose(amendments_bills)).
power(senate, concor(amendments_bills)).
order_approve(president,min_wage_to_everyone,7). 
bill_to_law(X) :- bill_passed(houseOfRepresentatives,X), bill_passed(senate,X), bill_passed(president,X).
bill_passed(president,X) :- bill_approve(president,X,Y), =<(Y,10). 
bill_passed(president,X) :- bill_disapprove(president,X), bill_reconsider(houseOfRepresentatives,X,Y), bill_reconsider(senate,X,Y), Y>=0.66.
order(X) :- order_passed(houseOfRepresentatives,X), order_passed(senate,X), order_passed(president,X).
order_passed(president,X) :- order_approve(president,X,Y), Y=<10.
order_passed(president,X) :- order_approve(president,X,Y), Y>10.
order_passed(president,X) :- order_disapprove(president,X), order_reconsider(houseOfRepresentatives,X,Y), order_reconsider(senate,X,Y), Y>=0.66.
resolution(X) :- resolution_passed(houseOfRepresentatives,X), resolution_passed(senate,X), resolution_passed(president,X).
resolution_passed(president,X) :- resolution_approve(president,X,Y), Y=<10.
resolution_passed(president,X) :- resolution_approve(president,X,Y), Y>10.
resolution_passed(president,X) :- resolution_disapprove(president,X), resolution_reconsider(houseOfRepresentatives,X,Y), resolution_reconsider(senate,X,Y), Y>=0.66.
vote(X) :- vote_passed(houseOfRepresentatives,X), vote_passed(senate,X), vote_passed(president,X).
vote_passed(president,X) :- vote_approve(president,X,Y), Y=<10.
vote_passed(president,X) :- vote_approve(president,X,Y), Y>10.
vote_passed(president,X) :- vote_disapprove(president,X), vote_reconsider(houseOfRepresentatives,X,Y), vote_reconsider(senate,X,Y), Y>=0.66.



% ----------------------------------------------

% ARTICLE 1 Section 8

% Check this section
% Functors used
% power/2 says the government body in the first argument has the power mentioned in the second argument
% term/2 states that the duration of the term for first argument is second argument number of years
% district/1 says that the argument is a district
% area/2 says the area of first argument is the second argument

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

power(congress, borrow(money_on_credit_of_US)).

power(congress, regulate(commerce_with_foreign_nations)).
power(congress, regulate(commerce_among_states)).
power(congress, regulate(commerce_with_indian_tribes)).

power(congress, establish(rule_of_naturalization)).
power(congress, establish(rule_on_subject_of_bankruptcies)).

power(congress, coin(money)).
power(congress, regulate(currency_value)).
power(congress, fix(standard_weights)).
power(congress, fix(standard_measures)).

power(congress, provide(punish(counterfeiting_securities))).
power(congress, provide(punish(counterfeiting_current_coin))).

power(congress, establish(post_offices)).
power(congress, establish(post_roads)).
power(congress, promote(progress_of_science)).
power(congress, promote(progress_of_useful_arts)).

power(congress, constitute(tribunals)).

power(congress, define(piracies)).
power(congress, punish(piracies)).
power(congress, define(felonies_on_high_seas)).
power(congress, punish(felonies_on_high_seas)).
power(congress, define(offense_against_laws)).
power(congress, punish(offense_against_laws)).

power(congress, declare(war(X,Y))) :- X = stateOfUS(X1), stateOfUS(X1), Y = stateOfUS(X2), stateOfUS(X2),  X2 \= X1.
power(congress, grant(letter_of_marque)).
power(congress, grant(letter_of_reprisal)).
power(congress, make_rules(caputures_on_land_and_water)).

power(congress, raise(armies)) :- term(provide(raise(armies)), Y), =<(Y,2).
power(congress, support(armies)) :- term(provide(support(armies)), Y), =<(Y,2).

power(congress, provide(navy)).
power(congress, maintain(navy)).

power(congress, make_rules(government)).
power(congress, make_rules(regulate(land_forces))).
power(congress, make_rules(regulate(navy))).

power(congress, provide(calling_militia(execute_laws_of_union))).
power(congress, provide(calling_militia(suppress_insurrection))).
power(congress, provide(calling_militia(repel_invasions))).

power(congress, provide(organinizing_militia)).
power(congress, provide(arming_militia)).
power(congress, provide(diciplining_militia)).

area(connecticut_first, 5).
area(georgia_first, 10).
area(massachusetts_first, 20).
district(X) :- area(X, A), =<(A,10).
power(congress, exerciseLegislation(Y)) :- Y = district(X), district(X).

power(congress, makelaws(execute_foregoing_powers)).
power(congress, makelaws(power_vested_in_government)).

% ----------------------------------------------

%ARTICLE 1 Section 9

%functors used
%migrationtostates/2 contains the name of the person and when he migrated
%nopreferenceshallbegiven/1 contains name of port of us which will not be preffered over others.
%acceptTitle/1 contains name of person who has to accept title but if he holds a officeofprofit in us he has to take consent of congress before accepting.
%person/2 name of person and what office he holds

stateOfUS(delaware).
officeofProfit(us_Bank).
person(hari, officeofProfit(us_Bank)).
consentbycongresstoacceptTitle(hari).
port(heisenberg, stateOfUS(delaware)).
prohibition(0,kate, 1801).
tax_imposed(kate,7).
migrationtostates(Y, Year) :- prohibition(0,Y, Year), =<(Year, 1808), tax_imposed(Y,Tax_paid), Tax_paid =< 10.
susensionofWritofHabeasCorpus(X) :- rebellion(Y).
notpassed(X) :-  billofAttainder(X).
notpassed(X) :-  expostfactoLaw(X).
notax(X) :- export(X, stateOfUS(Y)).
nopreferenceshallbegiven(Y) :- port(Y, stateOfUS(X)).
norevenueshallbegiven(Y) :- port(Y, stateOfUS(X)).
nordutyshallbetaken(Y) :- shipbound(Z), port(Y,stateOfUS(X)).
nomoneydrawnfromtreasury(X) :- appropriationmadebylaw(X).
publish(regularStatement).
publish(accountoftheReceiptsandExpendituresofallpublicMoney).
notitleofnobilitybyUS(hari).
notitleofnobilitybyUS(Y).
acceptOffice(X) :-person(X, officeofProfit(Y)),consentbycongresstoacceptoffice(X).
acceptOffice(X) :-person(X, officeoftrust(Y)),consentbycongresstoacceptoffice(X).
acceptTitle(X) :-person(X, officeofProfit(Y)),consentbycongresstoacceptTitle(X).
acceptTitle(X) :-person(X, officeoftrust(Y)),consentbycongresstoacceptTitle(X).
acceptEmolument(X) :-person(X, officeofProfit(Y)),consentbycongresstoacceptEmolument(X).
acceptEmolument(X) :-person(X, officeoftrust(Y)),consentbycongresstoacceptEmolument(X).

%__________________________________________________

% ARTICLE 1 Section 10

% Functors used
% notreaty/2 says two states won't enter into a treaty
% noalliance/2 says two states won't enter into an alliance
% noconfederation/2 says two states won't enter into a confederation
% nogrant/2 says state in first argument won't grant the value in second argument
% nocoin/2 says state in first argument won't coin the value in second argument
% noemit/2 says state in first argument won't emit the value in second argument
% nopass/2 says state in first argument won't pass the bill or law in second argument
% lay/2 says state in first argument lays the second argument
% useOfUStreasury/1 says that the argument is used for US Treasurey
% keep/2 says state in first argument keeps the second argument
% enter_agreement/2 says state in first argument enters into an agreement with the second argument which is a state or foreign power
% enter_compact/2 says state in first argument enters into a compact with the second argument which is a state or foreign power
% war/2 says the state in first argument declares war on the second argument which is a state or foreign power
% consentOfCongress/1 says whether the congress has given consent
% invaded/3 says that the first argument was invaded by the second and third argument says if that is happened or not (true or false)
% necessary/3 says whether first argument considers the second argument is necessary or not

notreaty(X, Y) :- stateOfUS(X), stateOfUS(Y), X\=Y.
noalliance(X,Y) :- stateOfUS(X), stateOfUS(Y), X\=Y.
noconfederation(X,Y) :- stateOfUS(X), stateOfUS(Y), X\=Y.
nogrant(X, letter_of_reprisal) :- stateOfUS(X).
nogrant(X, letter_of_marque) :- stateOfUS(X).
nocoin(X, money) :- stateOfUS(X).
noemit(X, bill_of_credit) :- stateOfUS(X).
nocoin(X, tender_in_payment_of_debt) :- stateOfUS(X).
nopass(X, bill(attainder)) :- stateOfUS(X).
nopass(X, bill(ex_post_facto_law)) :- stateOfUS(X).
nopass(X, law(impairing_obligation_of_contracts)) :- stateOfUS(X).
nogrant(X, title_of_nobility) :- stateOfUS(X).

lay(X, imposts_on_imports) :- stateOfUS(X), consentOfCongress(Consent), Consent = true, necessary(congress, inspection, Inspection), Inspection = true.
lay(X, imposts_on_exports) :- stateOfUS(X), consentOfCongress(Consent), Consent = true, necessary(congress, inspection, Inspection), Inspection = true.
lay(X, duties_on_imports) :- stateOfUS(X), consentOfCongress(Consent), Consent = true, necessary(congress, inspection, Inspection), Inspection = true.
lay(X, duties_on_exports) :- stateOfUS(X), consentOfCongress(Consent), Consent = true, necessary(congress, inspection, Inspection), Inspection = true.
useOfUStreasury(netprod_of_imposts_and_duties_laid_by_state) :- lay(X, imposts_on_imports);
                                                                lay(X, imposts_on_exports);
                                                                lay(X, duties_on_imports);
                                                                lay(X, duties_on_exports).

lay(X, duty_of_tonnage) :- stateOfUS(X), consentOfCongress(Consent), Consent = true, invaded(X,Y,Z), Z = true.
keep(X, troops) :- stateOfUS(X), consentOfCongress(Consent), Consent = true, invaded(X,Y,Z), Z = true.
keep(X, ships_of_war) :- stateOfUS(X), consentOfCongress(Consent), Consent = true, invaded(X,Y,Z), Z = true.
enter_agreement(X,Y) :- stateOfUS(X), consentOfCongress(Consent), Consent = true, invaded(X,Z,M), M = true.
enter_compact(X,Y) :- stateOfUS(X), consentOfCongress(Consent), Consent = true, invaded(X,Z,M), M = true.
war(X, Y) :- stateOfUS(X), consentOfCongress(Congress), Consent = true, invaded(X,Y,Z), Z = true.

% ----------------------------------------------

% ARTICLE 2 Section 1

% Functors used
% executivePower/1 defines which body has executive power.
% term/2 defines the term of the first argument in the second argument.
% officeOfTrust/1 indicates if the person holds an office of trust.
% officeOfProfit/1 indicates if the person holds an office of profit. 
% notElector/1 is true if the person is not eligible for being an elector.
% timeOfElection/1 defines who can determine the time of election.
% citizenEligible/1 is true if the person is an eligible citizen.
% ageEligible/1 is true if the person is eligible by age.
% compensation/1 defines that the body has a fixed compensation.
% oathPresident/1 defines the oath of the president.

executivePower(president).
term(president,4).
term(vicePresident,4).

officeOfTrust(ash).     %test cases for notElector.
officeOfProfit(sash).    %test cases for notElector.

notElector(Person) :- officeOfTrust(Person).
notElector(Person) :- officeOfProfit(Person).

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

compensation(president).
oathPresident("I do solemnly swear (or affirm) that I will faithfully execute the Office of President of the United States, and will to the best of my Ability, preserve, protect and defend the Constitution of the United States").

% ----------------------------------------------

% AMENDMENT 12

% Functors used
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

votes(elector, president).
votes(elector, vicePresident).

state(elector1, stateOfUS(michigan)).          % test cases for notElector
state(elector2, stateOfUS(massachusetts)).     % test cases for notElector
state(elector3, stateOfUS(california)).        % test cases for notElector
state(president, stateOfUS(massachusetts)).    % test cases for notElector
state(vicePresident, stateOfUS(california)).   % test cases for notElector

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

% ----------------------------------------------

% AMENDMENT 20 Section 3

% Functors used
% actingPresident/1 defines who the acting president is. 
% test facts for actingPresident/1

notQualified(president, true).  % set true if president is not qualified.
notQualified(president, true).  % set true if vice president is not qualified.
notChosen(president, true).     % set true if president is not chosen. 
actingPresident(vicePresident) :- 
    notQualified(president, true);
    notChosen(president, true).

actingPresident(providedByCongress) :-
    notQualified(president, true),
    notQualified(vicePresident, true).


% ----------------------------------------------

% AMENDMENT 25.
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

% ----------------------------------------------

% ARTICLE 2 Section 2

% Functors used
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

% ----------------------------------------------

% ARTICLE 2 Section 3

% Functors used 
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

% ----------------------------------------------

% ARTICLE 2 Section 4

% Functors used
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

% ----------------------------------------------

% ARTICLE 3 Section 1

% Functors used
% judicialPower/2 is the judicial Power given to different courts 
% compensation/1 salary received by judges
% judges/3 positions of a judge 

judicialPower(supremeCourt).
judicialPower(lowerCourts, ordain(congress)).
compensation(basePay).
compensation(basePay*2).% Fact added to test compensation/1
judges(supremeCourt, goodBehaviour, compensation(X)) :- X > basePay .
judges(lowerCourts, goodBehaviour, compensation(X)) :- X > basePay .

% ----------------------------------------------

% ARTICLE 3 Section 2

% Functors used
% jury/2 checks for the opinion of the jury 
% judicialPower(landsOfDiffStates, citizenOf(stateOfUS(X)), foreignState(Y)).
% judicialPower(landsOfDiffStates, stateOfUS(X), foreignState(Y), supremeCourt).

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

% Changes due to Amendment 11
trialOfCrimes(felony).% Fact added to test trialOfCrimes/1
trialOfCrimes(treason).% Fact added to test trialOfCrimes/1
trialOfCrimes(murder).% Fact added to test trialOfCrimes/1

jury(trialOfCrimes(X), stateOfUS(Y)) :- X =\= impeachement .
jury(trialOfCrimes(X), foreignState(Y)) :- X =\= impeachement .

% ----------------------------------------------

% ARTICLE 3 Section 3

% Functors used
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

% ----------------------------------------------

% ARTICLE 4 Section 1

% Functors used
% faithandcredit/3 all states will respect each other's publicact,records and judicialproceedings
% congressmannertoprove/1 set of rules decided by congress to prove acts,record,etc. 

judicialproceeding(interfaithmarriageallowed).
stateOfUS(delaware).
stateOfUS(connecticut).
faithandcredit(X,publicact(Z),Y):- stateOfUS(X),stateOfUS(Y).
faithandcredit(X,records(Z),Y):- stateOfUS(X),stateOfUS(Y).
faithandcredit(X,judicialproceeding(Z),Y):- stateOfUS(X),stateOfUS(Y).
congressmannertoprove(acts).
congressmannertoprove(records).
congressmannertoprove(proceedings).

% ----------------------------------------------

% ARTICLE 4 Section 2

% functors used 
% privileges/1 name of person who will enjoy privileges
% crime/2 X is the person name and Y is the state where he has commited crime
% deliver/2 x is name of person and y is the state he will be forced to return
% demand/1 executiveauthority must take permission

citizen(hari,8).
demand(executiveauthority(delaware)).
found(ajay,connecticut).
privileges(X) :-citizen(X,_).
immunities(X) :-citizen(X,_).
crime(X,Y) :- deliver(X,Y).
executiveauthority(Y).
deliver(X,Y) :- found(X,Z), demand(executiveauthority(Y)).

% ----------------------------------------------

% ARTICLE 4 Section 3

% Functors used
% statesformation/1 state's name
% newstateconsentfromotherstateslegislatures/1 state's name which has to take consent

power(congress,admit(newstatesintounion)).
statesformation(X):-withinjurisdiction(X).
statesformation(X):-nojunctionofstates(X). 
withinjurisdiction(X) :-newstateconsentfromotherstateslegislatures(X).
nojunctionofstates(X) :-newstateconsentfromotherstateslegislatures(X).
power(congress,disposeofRulesandRegulationsrespectingtheTerritoryorotherPropertybelongingtotheUnitedStates).
power(congress,makeallneedfulRulesandRegulationsrespectingtheTerritoryorotherPropertybelongingtotheUnitedStates).

% ----------------------------------------------

% ARTICLE 4 Section 4

% Functors used
% applicationforprotectionAgainstDomesticViolence/3 - firts predicate indicates who the stae has to approach for getting protection, Y is states name and 1 means it can be convened

guaranteerepublicformofgovernment(X) :- stateOfUS(X).
protectionAgainstInvasion(X) :-stateOfUS(X).
protectionAgainstDomesticViolence(Y) :- applicationforprotectionAgainstDomesticViolence(legislature,Y,0), stateOfUS(Y). 
protectionAgainstDomesticViolence(Y) :- applicationforprotectionAgainstDomesticViolence(executive,Y,1), stateOfUS(Y), applicationforprotectionAgainstDomesticViolence(legislature,Y,0).

%--------------------------------------------

% ARTICLE 5

% Functors used
% twothirds/1 is true if at least two thirds of the 50 states are in the list (the argument)
% threefourths/1 is true if at least three fourths of the 50 states are in the list (the argument)
% proposeAmendment/2 says that congress can propose the amendment in the second argument (denoted by amendment number) or not
% approveAmendment/2 says if the amendment in the secondargument (denoted by amendment number) is approved or not.
% forbidAmendment/1 says the amendment is forbid
% nodenyvote/1 says the state can't be denied vote

twothirds(States) :- length(States, L), >=(L,34).
threefourths(States) :- length(States, L), >=(L,38).
proposeAmendment(congress, Amendment) :-  necessary(twothirds(senate), Amendment, Necessary), necessary(twothirds(houseOfRepresentatives), Amendment, Necessary), Necessary = true;
                               callForConstitutionalConvention(twothirds(States), Called), Called = true.
approveAmendment(Approved, Amendment) :- legislatureOfStates(threefourths(LegislatureOfStates),Approved), Approved = true.                        
forbidAmendment(Amendment) :- amendmentpassed(Amendment, X, Y, Z), <=(Z, 1808).
nodenyvote(State) :- stateOfUS(State), consent(State, Consent), Consent = false.

% ----------------------------------------------

% ARTICLE 6

% Functors used
% debtsValid/1 defines that the previous debts of the confederate are still valid.
% lawOfTheLand/1 defines that the constitution is to be followed as the law of the land.
% boundBy/2 defines what oath the body in the first argument is bound by.

debtsValid(confederation).
lawOfTheLand(constitution).
boundBy(judges, lawOfTheLand(constitution)).
boundBy(senator, oath(constitution)).
boundBy(executive, oath(constitution)).
boundBy(legislature, oath(constitution)).
boundBy(judges, oath(constitution)).

% ----------------------------------------------

% ARTICLE 7
% Functors used
% witnesstoindependenceofUS/2 the first predicate is the state the person belongs too and the second is the person's name
% presentduringconvention/2 the states which were present

% Functors used
% mr_Hamiltonfrom/1 says the state Mr.Hamilton is from

witnesstoindependenceofUS(stateOfUS(newHampshire),johnLangdon).
witnesstoindependenceofUS(stateOfUS(newHampshire),nicholasGilman).
witnesstoindependenceofUS(stateOfUS(massachusetts),nathanielGorham).
witnesstoindependenceofUS(stateOfUS(massachusetts),rufusKing).
witnesstoindependenceofUS(stateOfUS(connecticut),wmsamlJohnson).
witnesstoindependenceofUS(stateOfUS(connecticut),rogerSherman).
witnesstoindependenceofUS(stateOfUS(newYork),alexanderHamilton).
witnesstoindependenceofUS(stateOfUS(),wilLivingston).
witnesstoindependenceofUS(stateOfUS(newJersey),wilLivingston).
witnesstoindependenceofUS(stateOfUS(newJersey),wilLivingston).
witnesstoindependenceofUS(stateOfUS(newJersey),wilLivingston).
witnesstoindependenceofUS(stateOfUS(newJersey),wilLivingston).
witnesstoindependenceofUS(stateOfUS(pennsylvania),bFranklinn).
witnesstoindependenceofUS(stateOfUS(pennsylvania),thomasMifflin).
witnesstoindependenceofUS(stateOfUS(pennsylvania),robtMorris).
witnesstoindependenceofUS(stateOfUS(pennsylvania),geoClymer).
witnesstoindependenceofUS(stateOfUS(pennsylvania),thosFitzSimons).
witnesstoindependenceofUS(stateOfUS(pennsylvania),jaredIngersoll).
witnesstoindependenceofUS(stateOfUS(pennsylvania),jamesWilson).
witnesstoindependenceofUS(stateOfUS(pennsylvania),gouvMorris).
witnesstoindependenceofUS(stateOfUS(delaware),geoRead).
witnesstoindependenceofUS(stateOfUS(delaware),gunningBedfordjun).
witnesstoindependenceofUS(stateOfUS(delaware),johnDickinson).
witnesstoindependenceofUS(stateOfUS(delaware),richardBassett).
witnesstoindependenceofUS(stateOfUS(delaware),jacoBroom).
witnesstoindependenceofUS(stateOfUS(maryland),jamesMcHenry).
witnesstoindependenceofUS(stateOfUS(maryland),danofSt.Thos.Jenifer).
witnesstoindependenceofUS(stateOfUS(maryland),danlCarroll ).
witnesstoindependenceofUS(stateOfUS(virginia),johnBlair).
witnesstoindependenceofUS(stateOfUS(virginia),jamesMadisonJr).
witnesstoindependenceofUS(stateOfUS(northCarolina),wmBlount).
witnesstoindependenceofUS(stateOfUS(northCarolina),richdDobbsSpaight).
witnesstoindependenceofUS(stateOfUS(northCarolina),huWilliamson).
witnesstoindependenceofUS(stateOfUS(southCarolina),rutledge).
witnesstoindependenceofUS(stateOfUS(southCarolina),charlesCotesworthPinckney).
witnesstoindependenceofUS(stateOfUS(southCarolina),charlesPinckney).
witnesstoindependenceofUS(stateOfUS(southCarolina),pierceButler).
witnesstoindependenceofUS(stateOfUS(georgia),williamFew).
witnesstoindependenceofUS(stateOfUS(georgia),abrBaldwin).
constitutionpassed(monday(17,9,1787)).
presentduringconvention(stateOfUS(newHampshire)).
presentduringconvention(stateOfUS(massachusetts)).
presentduringconvention(stateOfUS(connecticut)).
presentduringconvention(mr_Hamiltonfrom(stateOfUS(newYork))).
presentduringconvention(stateOfUS(newJersey)).
presentduringconvention(stateOfUS(pennsylvania)). 
presentduringconvention(stateOfUS(delaware)).
presentduringconvention(stateOfUS(maryland)).
presentduringconvention(stateOfUS(northCarolina)).
presentduringconvention(stateOfUS(southCarolina)).
presentduringconvention(stateOfUS(georgia)).

% ----------------------------------------------
% **************************************THE AMENDMENTS TO THE CONSTITUTION OF THE UNITED STATES AS RATIFIED BY THE STATES*********************************************

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

resolvedBy(senate, houseOfRepresentatives, assemblyOfCongress, bothHouses(twothirdOfMembers)).
proposedTo(legislature(stateOfUS(X)), amendments, ratifiedBy(threefourthOfLegislatures)).

articles(proposedBy(congress), ratifiedBy(legislatureOf(stateOfUS(X)))).

% ----------------------------------------------

% AMENDMENT 1

% Functors used
% powerless/2 cases where an individual or an institution does not have any influence
% right/2 rights available to citizens of the US 

amendmentapproved(1, 15, 12, 1791).

powerless(congress, establishmentOfReligion).
powerless(congress, prohibitionOf(freeExcersiseOfReligion)).
right(X, freedomOfSpeech) :- citizen(X,Y).
right(X, freedomOfPress) :- citizen(X,Y).
right(X, freedomToPeacefullyAssemble) :- citizen(X,Y).
right(X, petitionFor(redressOfGrievances)) :- citizen(X,Y).

% ----------------------------------------------

% AMENDMENT 2

amendmentapproved(2, 15, 12, 1791).

right(X, keepAndBearArms) :- citizen(X,Y).

% ----------------------------------------------

% AMENDMENT 3

amendmentapproved(3, 15, 12, 1791).

right(soldier, timeOfPeace(permissionOfOwner(quartaredInHouse))).
right(soldier, timeOfPeace(cannot(quartaredInHouse))).
right(soldier, timeOfWar(cannot(quartaredInHouse))).
right(soldier, timeOfWar(permissionOfOwner(quartaredInHouse))).

% ----------------------------------------------

% AMENDMENT 4

% Functors used
% secure/1 cases when an individual or an institution has immunity
% supportedBy/1 supported By these laws

amendmentapproved(4, 15, 12, 1791).


secure(ofTheirPapers).
right(Y, secure(inTheirPersons)) :- citizen(Y,Z).
right(Y, secure(ofTheirPapers)) :- citizen(Y,Z).
right(Y, secure(inTheirHouses)) :- citizen(Y,Z).
powerless(government, unreasonableSearchesAndSeizures).
powerless(government, warrants).
supportedBy(oaths).
supportedBy(affirmation).
havePower(government, warrants, supportedBy(X)).

% ----------------------------------------------

% AMENDMENT 5

% Functors used
% required/2 conditions required to conduct a trial against serious Criminal Charges

amendmentapproved(5, 15, 12, 1791).


right(Y, noTrial_inService(war)) :- citizen(Y,Z).
right(Y, noTrial_inService(publicDanger)) :- citizen(Y,Z).
right(X, noTrial_sameOffence) :- citizen(X,Y).
right(X, noTrial_againstSelfIncrimination) :- citizen(X,Y).
right(X, witnessAgainstHimself) :- citizen(X,Y).
right(X, life) :- citizen(X,Y).
right(X, liberty) :- citizen(X,Y).
right(X, property) :- citizen(X,Y).

% ----------------------------------------------

% AMENDMENT 6

amendmentapproved(6, 15, 12, 1791).

stateOfUS(california, district(sanDiego)).% Fact added to test stateOfUS/2
stateOfUS(newYork, district(1)).% Fact added to test stateOfUS/2

right(accused, speedyAndPublicTrial).
right(accused, trialByAnImpartialJury, in(stateOfUS(X, district(Y)))).
right(accused, informationAboutNatureAndCauseOfAccusation).
right(accused, confrontedWithWitnessesAgainstHim).
right(accused, obtainWitnessesInHisFavour).
right(accused, assistanceOfDefenceCounsel).

% ----------------------------------------------

% AMENDMENT 7

amendmentapproved(7, 15, 12, 1791).

right(Y, trialByJury_controversy(30)) :- citizen(Y,Z).

% ----------------------------------------------

% AMENDMENT 8

% Functors used
% notRequired/1 cases where certain actions are not required 

amendmentapproved(8, 15, 12, 1791).

right(Y, notRequired(excessiveBail)) :- citizen(Y,Z).
right(Y, notRequired(excessiveFines)) :- citizen(Y,Z).
right(Y, notRequired(cruelPunishments)) :- citizen(Y,Z).
right(Y, notRequired(unusualPunishmnets)) :- citizen(Y,Z).

% ----------------------------------------------

% AMENDMENT 9

amendmentapproved(9, 15, 12, 1791).

right(X, deny_retainedBy(otherPeople)) :- citizen(X,Y).
right(X, disparage_retainedBy(otherPeople)) :- citizen(X,Y).

% ----------------------------------------------

% AMENDMENT 10

amendmentapproved(10, 15, 12, 1791).

reservedTo(stateOfUS(X)).
reservedTo(people).
powerNotDelegatedtoUS(byConstitution, reservedTo(X)).

% ----------------------------------------------
% AMENDMENT 11 
noJudicialPower(federal, state).

jury(trialOfCrimes(X), stateOfUS(Y)) :- X =\= impeachement .
jury(trialOfCrimes(X), foreignState(Y)) :- X =\= impeachement .

% ----------------------------------------------

% AMENDMENT 12 

% Functors used
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

% ----------------------------------------------

% AMENDMENT 13 Section 1

% Functors used
% punishment/2 the first is the person's name who has to face the slavery if he is convicted of a crime else no one should be made to face slavery.

amendmentpassed(13,31,1,1865).
amendmentapproved(13,6,12,1865).

crime(rohan,convicted).
punishment(X,slavery) :- crime(X,convicted).
punishment(X,involuntary_servitude) :- crime(X,convicted).

% ----------------------------------------------

% AMENDMENT 13 Section 2

amendmentpassed(13,31,1,1865).
amendmentapproved(13,6,12,1865).

enforce(article_by_appropriate_legislation).
power(congress,enforce(article_by_appropriate_legislation)).

% ----------------------------------------------

% AMENDMENT 14 Section 1

% Functors used
% amendmentpassed/4 states that amendment number in first argument was passed on the date in second argument, month in third and year in fourth
% amendmentapproved/4 states that amendment number in first argument was approved on the date in second argument, month in third and year in fourth
% natural_born/1 states that person X is natural_born in US
% notenforce/2 states that first argument can't enforce law in second argument
% notmakelaw/2 states that first argument can't make law in second argument
% deprive/3 states that first argument deprives second argument of third argument


amendmentpassed(14, 13, 06, 1866). % Amendment 14 was passed on 13th June 1866
amendmentapproved(14, 09, 07, 1868). % Amendment 14 was approved on 9th July 1868

natural_born(rohan).
natural_born(meera).
natural_born(david).
natural_born(leonard).

citizen(X, Y) :- natural_born(X), age(X, Y).
notenforce(X, Law) :- stateOfUS(X), abridges_privelegies(citizen(A,B), Abridges), abridges_immunities(citizen(A,B), Abridges), Abridges = true.
notmakelaw(X, Law) :- stateOfUS(X), abridges_privelegies(citizen(A,B), Abridges), abridges_immunities(citizen(A,B), Abridges), Abridges = true.
deprive(X, citizen(A,B), life) :- stateOfUS(X), process_of_law(Processed), Processed = true.
deprive(X, citizen(A,B), liberty) :- stateOfUS(X), process_of_law(Processed), Processed = true.
deprive(X, citizen(A,B), property) :- stateOfUS(X), process_of_law(Processed), Processed = true.
deprive(X, citizen(A,B), equal_protection_of_law) :- stateOfUS(X), process_of_law(Processed), Processed = true.

% ----------------------------------------------

% AMENDMENT 14 Section 2

% Functors used
% amendmentpassed/4 states that amendment number in first argument was passed on the date in second argument, month in third and year in fourth
% amendmentapproved/4 states that amendment number in first argument was approved on the date in second argument, month in third and year in fourth
% sum/3 calculates the sum elements of the list in first argument using accumulator in second argument and saves result in last argument
% right/2 states that the right in second argument holds for first argument
% male/1 holds if the person (name in argument) is a male
% denied/2 holds if the right in first argument is denied on account of second argument
% notdenied/2 holds if the right in first argument can't be denied on account of second argument


amendmentpassed(14, 13, 06, 1866). % Amendment 14 was passed on 13th June 1866
amendmentapproved(14, 09, 07, 1868). % Amendment 14 was approved on 9th July 1868

% sum([No_of_FreePersons, No_of_Indians_not_taxed], 0, CountOfRepresentatives) is the template of this functor
sum([8, 1], 0, CountOfRepresentatives).

right(A,B).

% Changes due to Amendment 26 Section 1
notdenied(right(Y, vote_elect(X)), on_account_of_age) :- citizen(Y,_), age(Y, Age), Age >= 18.

% sum([No_of_FreePersons, No_of_Indians_not_taxed, -(0, /(A, Males_above_18))], 0, CountOfRepresentatives) is the template of this functor
% [rohan, david, leonard, george, raghu, sundar] is list of males above 18
% [leonard, george, raghu] is list of males above 18 and denied vote due to any reason
sum([8,  1, -(0, /(A, 6))], 0, ReducedCountOfRepresentatives) :- length([leonard, george, raghu], A), male(X), denied(right(X, vote_elect(elector_for_President)), _).
sum([8,  1, -(0, /(A, 6))], 0, ReducedCountOfRepresentatives) :- length([leonard, george, raghu], A), male(X), denied(right(X, vote_elect(elector_for_Vice_President)), _).
sum([8,  1, -(0, /(A, 6))], 0, ReducedCountOfRepresentatives) :- length([leonard, george, raghu], A), male(X), denied(right(X, vote_elect(representative_in_congress)), _).
sum([8,  1, -(0, /(A, 6))], 0, ReducedCountOfRepresentatives) :- length([leonard, george, raghu], A), male(X), denied(right(X, vote_elect(executive_officers)), _).
sum([8,  1, -(0, /(A, 6))], 0, ReducedCountOfRepresentatives) :- length([leonard, george, raghu], A), male(X), denied(right(X, vote_elect(judicial_officers)), _).
sum([8,  1, -(0, /(A, 6))], 0, ReducedCountOfRepresentatives) :- length([leonard, george, raghu], A), male(X), denied(right(X, vote_elect(members_of_legislature)), _).
sum([8,  1, -(0, /(A, 6))], 0, ReducedCountOfRepresentatives) :- length([leonard, george, raghu], A), male(X), denied(right(X, vote_elect(members_of_legislature)), _).
sum([8,  1, -(0, /(A, 6))], 0, ReducedCountOfRepresentatives) :- length([leonard, george, raghu], A), male(X), abridges_immunities(X,Y), abridges_privelegies(X,Y), Y = true.

% ----------------------------------------------

% AMENDMENT 14 Section 3

% Functors used
% amendmentpassed/4 states that amendment number in first argument was passed on the date in second argument, month in third and year in fourth
% amendmentapproved/4 states that amendment number in first argument was approved on the date in second argument, month in third and year in fourth
% qualified/2 has the names of those in first argument who are qualified for an election/appointment for the position in second argument
% rebel/2 says the first argument was part of a rebellion against second argument
% aid/1 says the first argument aided the second

amendmentpassed(14, 13, 06, 1866). % Amendment 14 was passed on 13th June 1866
amendmentapproved(14, 09, 07, 1868). % Amendment 14 was approved on 9th July 1868

% qualified([], X) :- X = senate; X = representative_in_congress;
%                     X = elector_for_President; X = elector_for_Vice_President;
%                     X = civil_office; X = military_office.
qualified(H, senate) :- (not(qualified(H, member_congress));
                      not(qualified(H, office_of_US));
                      not(qualified(H, member_congress));
                      not(qualified(H, member_of_state_legislature))).

qualified(H,representative_in_congress) :- (not(qualified(H, member_congress));
                    not(qualified(H, office_of_US));
                    not(qualified(H, member_congress));
                    not(qualified(H, member_of_state_legislature))), qualified(T, representative_in_congress).

qualified(H,elector_for_President) :- (not(qualified(H, member_congress));
                    not(qualified(H, office_of_US));
                    not(qualified(H, member_congress));
                    not(qualified(H, member_of_state_legislature))), qualified(T, elector_for_President).

qualified(H,elector_for_Vice_President) :- (not(qualified(H, member_congress));
                    not(qualified(H, office_of_US));
                    not(qualified(H, member_congress));
                    not(qualified(H, member_of_state_legislature))), qualified(T, elector_for_Vice_President).

qualified(H,civil_office) :- (not(qualified(H, member_congress));
                    not(qualified(H, office_of_US));
                    not(qualified(H, member_congress));
                    not(qualified(H, member_of_state_legislature))), qualified(T, civil_office).

qualified(H,military_office) :- (not(qualified(H, member_congress));
                    not(qualified(H, office_of_US));
                    not(qualified(H, member_congress));
                    not(qualified(H, member_of_state_legislature))), qualified(T, military_office).

supportConstitution(X) :- (not(rebel(X, against_constitution)); not(aid(X,enemies))), qualified([X|T], Y),
                           (Y = senate; Y = representative_in_congress;
                           Y = elector_for_President; Y = elector_for_Vice_President;
                           Y = civil_office; Y = military_office).

% ----------------------------------------------

% AMENDMENT 14 Section 4

% Functors used
% amendmentpassed/4 states that amendment number in first argument was passed on the date in second argument, month in third and year in fourth
% amendmentapproved/4 states that amendment number in first argument was approved on the date in second argument, month in third and year in fourth
% donotquestion/1 says that the state or US can't question the value in the argument
% validity/1 returns validity of the argument
% debt/1 says the debt was for the reason in the argument
% illegal/1 says that the payment in the argument is illegal

amendmentpassed(14, 13, 06, 1866). % Amendment 14 was passed on 13th June 1866
amendmentapproved(14, 09, 07, 1868). % Amendment 14 was approved on 9th July 1868

donotquestion(validity(debt(us))).
donotquestion(validity(debt(pension_payments))).
donotquestion(validity(debt(bounties_for_services))).
donotpay(X, debt(aid(Y,rebls_against_US))) :- X = us; X = stateOfUS(A).
donotpay(X, claim_for_loss_of_slave) :- X = us; X = stateOfUS(A).
donotpay(X, claim_for_emancipation_of_slave) :- X = us; X = stateOfUS(A).
illegal(P) :- donotpay(X, P).

% ----------------------------------------------

% AMENDMENT 14 Section 5

% Functors used
% amendmentpassed/4 states that amendment number in first argument was passed on the date in second argument, month in third and year in fourth
% amendmentapproved/4 states that amendment number in first argument was approved on the date in second argument, month in third and year in fourth
% power/2 says the government body in the first argument has the power mentioned in the second argument

amendmentpassed(14, 13, 06, 1866). % Amendment 14 was passed on 13th June 1866
amendmentapproved(14, 09, 07, 1868). % Amendment 14 was approved on 9th July 1868

power(congress, enforce(amendment14)).

% ----------------------------------------------

% AMENDMENT 15 Section 1

% Functors used
% amendmentpassed/4 states that amendment number in first argument was passed on the date in second argument, month in third and year in fourth
% amendmentapproved/4 states that amendment number in first argument was approved on the date in second argument, month in third and year in fourth
% notdenied/2 holds if the right in first argument can't be denied on account of second argument

amendmentpassed(15, 26, 02, 1869). % Amendment 15 was passed on 26th February 1869
amendmentapproved(15, 03, 02, 1870). % Amendment 15 was approved on 03rd February 1870

notdenied(right(X, vote_elect(Y)), on_account_of_race).
notdenied(right(X, vote_elect(Y)), on_account_of_color).
notdenied(right(X, vote_elect(Y)), on_account_of_previous_servitude).

% ----------------------------------------------

% AMENDMENT 15 Section 2

% Functors used
% amendmentpassed/4 states that amendment number in first argument was passed on the date in second argument, month in third and year in fourth
% amendmentapproved/4 states that amendment number in first argument was approved on the date in second argument, month in third and year in fourth
% power/2 says the government body in the first argument has the power mentioned in the second argument

amendmentpassed(15, 26, 02, 1869). % Amendment 15 was passed on 26th February 1869
amendmentapproved(15, 03, 02, 1870). % Amendment 15 was approved on 03rd February 1870

power(congress, enforce(amendment15)).

% ----------------------------------------------

% AMENDMENT 16

amendmentpassed(13,2,7,1909).
amendmentapproved(13,3,2,1913).

power(congress,lay(taxes_on_income)).
power(congress,collect(taxes_on_income)).

% ----------------------------------------------

% AMENDMENT 17

% vacancies(byResignation; recessOfLegislature).
% tempArrang(executive, vacancies, nextMeetingOfLegislature).
tempArrang(legislature, stateOfUS(Y)).
vacancies(senate(state), executiveAuthority(issueWrits), tempArrang(X)).
fillVacancies(legislature).

% ----------------------------------------------

% AMENDMENT 18

% REPEALED BY AMENDMENT 21 SO SKIPPED

% ----------------------------------------------

% AMENDMENT 19

% Functors used
% amendmentpassed/4 states that amendment number in first argument was passed on the date in second argument, month in third and year in fourth
% amendmentapproved/4 states that amendment number in first argument was approved on the date in second argument, month in third and year in fourth
% notdenied/2 holds if the right in first argument can't be denied on account of second argument
% power/2 says the government body in the first argument has the power mentioned in the second argument

amendmentpassed(19, 04, 06, 1919). % Amendment 19 was passed on 4th June 1919
amendmentapproved(19, 18, 08, 1920). % Amendment 19 was approved on 18th August 1920

notdenied(right(X, vote_elect(Y)), on_account_of_sex). 
power(congress,enforce(amendment19)).

% ----------------------------------------------

% AMENDMENT 20 Section 1

% Functors used
% endOfTerm/2 specifies the date and time of the end of term of the elected representatives

amendmentpassed(20,2,3,1932).
amendmentapproved(20, 23,1,1933).

endOfTerm(president, day(D,M,T)) :- D =:= 20, M =:= january, T =:= 1200.
endOfTerm(vPOTUS, day(D,M,T)) :- D =:= 20, M =:= january, T =:= 1200.
endOfTerm(senators, day(D,M,T)) :- D =:= 3, M =:= january, T =:= 1200.
endOfTerm(representatives, day(D,M,T)) :- D =:= 3, M =:= january, T =:= 1200.

% ----------------------------------------------

% AMENDMENT 20 Section 2

assemblyOfCongress(X) :- 
    (onceEveryYear(X), thirdDayOfJan(X), time(noon(X))); appointedByLaw(X).

% ----------------------------------------------

% AMENDMENT 20 Section 3

% Functors used
% actingPresident/1 defines who the acting president is. 
% test facts for actingPresident/1

notQualified(president, true).  % set true if president is not qualified.
notQualified(president, true).  % set true if vice president is not qualified.
notChosen(president, true).     % set true if president is not chosen. 
actingPresident(vicePresident) :- 
    notQualified(president, true);
    notChosen(president, true).

actingPresident(providedByCongress) :-
    notQualified(president, true),
    notQualified(vicePresident, true).

% ----------------------------------------------

% AMENDMENT 20 Section 4

death(president, choosenBy(houseOfRepresentatives)).
death(vPOTUS, choosenBy(senate)).

% ----------------------------------------------

% AMENDMENT 20 Section 5

% Functors used
% amendmentenforced/5 states that amendment number in first argument, section number in the second argument, was passed on the date in third argument, month in fourth and year in fifth

amendmentenforced(20,1,15,10,1933).
amendmentenforced(20,2,15,10,1933).

% ----------------------------------------------

% AMENDMENT 20 Section 6

% Functors used
% amendmentOperative/3 states the amendment number in the first argument, second argument consists of the orignal document which is to be ratified and the third argument checks if it has been passed

amendmentOperative(20, toConstitution, passed(legislatureOf(stateOfUS(X), A), Y)) :- A>=0.75, Y<7.

% ----------------------------------------------

% AMENDMENT 21  Section 1

% Functors used
% article/2 tells the status of the article given its number in the first argument.
 
amendmentpassed(21, 20, 02, 1933).
amendmentapproved(21, 05, 12, 1933).

article(18, "repealed").

% ----------------------------------------------
%  AMENDMENT 21 Section 2

% Functors used
% prohibitedInUS/1 defines what is prohibited according to the laws

prohibitedInUS(violation("state liquour laws")).

% ----------------------------------------------
% AMENDMENT 21 Section 3 
% Functors used
% ammendmentInoperative/1 defines which ammendment is inoperative.

ratifiedAmmendment(27).      % fact per section 3
ammendmentInoperative(X):- ratifiedAmmendment(X).

% ----------------------------------------------

% AMENDMENT 22 Section 1

% Functors used
% notElected/2 Y is a the president in power and X is the president who has been elected

president_not_elected(rahul).
years_as_president(3).
president(krishna).
amendmentpassed(22,21,3,1947).
amendmentapproved(22,27,2,1951).
notElected(president,more_than_twice).
notheldoffice(Y,president,Z):- president(X),years_as_president(Z), Z>2, president_not_elected(Y).
notheldoffice(Y,acting_president,Z):- president(X),Z>2.

% ----------------------------------------------

% AMENDMENT 22 Section 2

operative(amendment_22) :- ratifiedYears(X,Y),X<7,Y>0.75.

% ----------------------------------------------

% AMENDMENT 23 Section 1

amendmentpassed(23,16,6,1960).
amendmentapproved(23,29,3,1961).
power(congress,appoint(districtconstitutingseatofgovernment)).

% ----------------------------------------------

% AMENDMENT 23 Section 2

power(congress,enforce(amendment_23)).

% ----------------------------------------------

% AMENDMENT 24 Section 1

amendmentpassed(24,27, 8, 1962).
amendmentapproved(24, 23, 1, 1964).

right(X, vote(election)) :- citizen(X,Y).

% ----------------------------------------------

% AMENDMENT 24 Section 2

power(congress, enforce(amendment(24))).

% ----------------------------------------------

% AMENDMENT 25 Section 1.

% newPresident/1 defines who the next president is.
% nominate/1 defines when the vice president will be nominated.
% actingPresident/1 defines when vice president becomes the acting president.

amendmentpassed(25, 06, 07, 1965).
amendmentapproved(25, 10, 02, 1967).

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

% ----------------------------------------------

% AMENDMENT 25 Section 2 

nominate(vicePresident) :-
    vacancies(vicePresident),
    congressConsent(true).
% ----------------------------------------------

% AMENDMENT 25 Section 3

actingPresident(vicePresident):-
    writtenDeclaration(president, _).

% ----------------------------------------------

% AMENDMENT 25 Section 4

actingPresident(vicePresident):-
    writtenDeclaration(vicePresident, _),
    writtenDeclaration(executive, _).

% ----------------------------------------------

% AMENDMENT 26 Section 1

% Functors used
% amendmentpassed/4 states that amendment number in first argument was passed on the date in second argument, month in third and year in fourth
% amendmentapproved/4 states that amendment number in first argument was approved on the date in second argument, month in third and year in fourth
% notdenied/2 holds if the right in first argument can't be denied on account of second argument

amendmentpassed(26, 23, 03, 1971). % Amendment 26 was passed on 23rd March 1971
amendmentapproved(26, 01, 07, 1971). % Amendment 26 was approved on 1st July 1971
notdenied(right(X, vote_elect(Y)), on_account_of_age) :- age(X,Age), Age>=18.

% ----------------------------------------------

%AMENDMENT 26 Section 2

% Functors used
% amendmentpassed/4 states that amendment number in first argument was passed on the date in second argument, month in third and year in fourth
% amendmentapproved/4 states that amendment number in first argument was approved on the date in second argument, month in third and year in fourth
% power/2 says the government body in the first argument has the power mentioned in the second argument

amendmentpassed(26, 23, 03, 1971). % Amendment 26 was passed on 23rd March 1971
amendmentapproved(26, 01, 07, 1971). % Amendment 26 was approved on 1st July 1971

power(congress,enforce(amendment26)).

% ----------------------------------------------

% AMENDMENT 27 

% Functors used
% varyCompensation/3 states that the bodies in the first and second argument can only vary their compensation for the next term.

amendmentpassed(27, 25, 09, 1789).
amendmentapproved(27, 07, 05, 1992).
varyCompensation(senator, houseOfRepresentatives, nextElections).

% ----------------------------------------------
% END
