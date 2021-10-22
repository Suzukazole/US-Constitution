meetingOfCongress1(04, 07, 1861). %Fact added to test enum_done/1 and other fns
meetingOfCongress1(02, 12, 1861). %Fact added to test enum_done/1 and other fns
meetingOfCongress1(07, 12, 1863). %Fact added to test enum_done/1 and other fns
meetingOfCongress1(05, 12, 1864). %Fact added to test enum_done/1 and other fns
% enum_done(1860).
enum_done(1862).
% enum_done(1800).
% enum_done(X) :-  Y = X - 1860, Y =< 10, enum_done(Y).
enum_again(X) :- enum_done(X).
enum_done(X) :- meetingOfCongress1(D, M, Year), X >= Year, =<(X, +(Year,3)).
