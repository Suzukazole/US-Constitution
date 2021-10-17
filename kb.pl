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

consist(congress,senate).
consist(congress,houseOfRepresentatives).
legislativePower(congress).
legislativePower(X) :- consist(Y,X), legislativePower(Y).

% ----------------------------------------------

%ARTICLE 1 Section 2

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


elected(X,Y,people,Z).
age_qualified_HOR(H) :- age(H,X), X >=25.
citizen_qualified_HOR(H) :- citizen(H,Y), Y >=7.
state_qualified_HOR(H,X) :- stateOfUS(X), elected(H,X,people,X).
qualified([], houseOfRepresentatives).
qualified([H|T],houseOfRepresentatives) :- age_qualified_HOR(H), citizen_qualified_HOR(H), state_qualified_HOR(H,Q), qualified(T,houseOfRepresentatives).

members(X) :- qualified([X|T],houseOfRepresentatives); member(X,T).
consist(houseOfRepresentatives, members(X)).
term(members(X),2).


stateOfUS(rhodeisland).
meetingOfCongress(D, M, Year).
enum_done(X) :- meetingOfCongress(D, M, Year), X >= Year, =<(X, Year+3), enum_done(Y), =<(X-Y, 10).
total([H|T], A, N) :- total(T, A-1, N).
total([],A,A). 
num_representatives(Y) :- Y = [H|T], H>=1, total(Y, 0, N), =<(N,*(/(1,30000)) , populationOfUS).
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
power(houseOfRepresentatives, impeachment(X)).
choose(houseOfRepresentatives, speaker).
choose(houseOfRepresentatives, officers).

%--------------------------------------------------------

%ARTICLE 1 Section 7

power(houseofRepresentatives, raise(revenue_bills)).
power(senate, propose(amendments_bills)).
power(senate, concor(amendments_bills)).
bill_to_law(X) :- bill_passed(houseOfRepresentatives,X), bill_passed(senate,X), bill_passed(president,X).
bill_passed(president,X) :- bill_approve(president,X,Y), Y<=10. 
bill_passed(president,X) :- bill_disapprove(president,X), bill_reconsider(houseOfRepresentatives,X,Y), bill_reconsider(senate,X,Y), Y>=0.66.
order(X) :- order_passed(houseOfRepresentatives,X), order_passed(senate,X), order_passed(president,X).
order_passed(president,X) :- order_approve(president,X,Y), Y<=10.
order_passed(president,X) :- order_approve(president,X,Y), Y>10.
order_passed(president,X) :- order_disapprove(president,X), order_reconsider(houseOfRepresentatives,X,Y), order_reconsider(senate,X,Y), Y>=0.66.
resolution(X) :- resolution_passed(houseOfRepresentatives,X), resolution_passed(senate,X), resolution_passed(president,X).
resolution_passed(president,X) :- resolution_approve(president,X,Y), Y<=10.
resolution_passed(president,X) :- resolution_approve(president,X,Y), Y>10.
resolution_passed(president,X) :- resolution_disapprove(president,X), resolution_reconsider(houseOfRepresentatives,X,Y), resolution_reconsider(senate,X,Y), Y>=0.66.
vote(X) :- vote_passed(houseOfRepresentatives,X), vote_passed(senate,X), vote_passed(president,X).
vote_passed(president,X) :- vote_approve(president,X,Y), Y<=10.
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

% Check this once
power(congress, borrow(money_on_credit_of_US)).

% Check this once
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

power(congress, declare(war(X,Y))).
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

district(X) :- area(X, A), =<(X,10).
power(congress, exerciseLegislation(district(X))).
% Yet to finish

power(congress, makelaws(execute_foregoing_powers)).
power(congress, makelaws(power_vested_in_government)).

% ----------------------------------------------

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

% AMENDMENT 14 Section 1

amendmentpassed(14, 13, 06, 1866). % Amendment 14 was passed on 13th June 1866
amendmentapproved(14, 09, 07, 1868). % Amendment 14 was approved on 9th July 1868

citizen(X, Y) :- natural_born(X), age(X, Y).
notenforce(X, Law) :- stateOfUS(X), abridges_privelegies(citizen(_,_), Abridges), abridges_immunities(citizen(_,_), Abridges), Abridges = true.
notmakelaw(X, Law)) :- stateOfUS(X), abridges_privelegies(citizen(_,_), Abridges), abridges_immunities(citizen(_,_), Abridges), Abridges = true.
deprive(X, citizen(_,_), life) :- stateOfUS(X), process_of_law(Processed), Processed = true.
deprive(X, citizen(_,_), liberty) :- stateOfUS(X), process_of_law(Processed), Processed = true.
deprive(X, citizen(_,_), property) :- stateOfUS(X), process_of_law(Processed), Processed = true.
deprive(X, citizen(_,_), equal_protection_of_law) :- stateOfUS(X), process_of_law(Processed), Processed = true.

% ----------------------------------------------

% AMENDMENT 14 Section 2

amendmentpassed(14, 13, 06, 1866). % Amendment 14 was passed on 13th June 1866
amendmentapproved(14, 09, 07, 1868). % Amendment 14 was approved on 9th July 1868













